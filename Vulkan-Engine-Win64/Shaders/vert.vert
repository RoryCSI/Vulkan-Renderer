#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(binding = 2) uniform UniformBufferObjectLight {
    vec4 lightColor;
    vec4 lightPos;
} uboLight;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;
layout(location = 3) in vec3 inNormal;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);

    vec4 worldPos = ubo.model * vec4(inPosition, 1.0);

    vec4 toLight = uboLight.lightPos - worldPos;
    vec3 lightColor = uboLight.lightColor.xyz * uboLight.lightColor.w;

    //vec3 diffuse = lightColor * max(dot(

    fragColor = inColor * uboLight.lightColor.xyz;
    fragTexCoord = inTexCoord;
}