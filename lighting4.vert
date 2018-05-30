#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec3 N;
out vec3 P;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;


void main() {
    P = (modelViewMatrix*vec4(vertex,1)).xyz; //vertex in eye space
    N = normalMatrix * normal;
    /*vec3 L = normalize(lightPosition.xyz - Ve);
	vec3 V = normalize(-Ve); // vector vertext-> cam
	vec3 R = 2*dot(N,L)*N-L;
    frontColor = matAmbient*lightAmbient + matDiffuse*lightDiffuse*max(0,dot(N,L))+matSpecular*lightSpecular*pow(max(0,dot(R,V)), matShininess);*/
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
