#version 450
#extension GL_ARB_separate_shader_objects : enable

layout (location = 0) in vec2 inPosition;
layout (location = 1) in vec3 inColor;

layout (push_constant) uniform pushConstants
{
    vec3 tintColor;   
} PushConstant;

layout (binding = 0) uniform UniformBufferObject
{
    mat4 model;
    mat4 view;
    mat4 projection;
} ubo;

layout (location = 0) out vec3 fragColor;

out gl_PerVertex
{
    vec4 gl_Position;
};

void main ()
{
    gl_Position = ubo.projection * ubo.view * ubo.model * vec4 (inPosition, 0.0, 1.0);
    fragColor = inColor * PushConstant.tintColor;
}