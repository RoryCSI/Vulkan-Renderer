#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
    vec4 lightPos[4];
    vec4 lightColor[4];
} ubo;


layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;
layout(location = 3) in vec3 inNormal;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);

    vec4 worldPos = ubo.model * vec4(inPosition, 1.0);
    vec4 toLight;
    vec3 diffuse = vec3(0.04f,0.04f,0.04f);
    for (int i = 0; i < 4; i++)
    {
        toLight = ubo.lightPos[i] - worldPos;
        vec3 lightColor = ubo.lightColor[i].xyz * ubo.lightColor[i].w;
        diffuse += ubo.lightColor[i].xyz * max(dot(normalize(toLight.xyz), inNormal), 0.0) * normalize(length(toLight.xyz));
    }

    fragColor = inColor * diffuse;
    fragTexCoord = inTexCoord;
}