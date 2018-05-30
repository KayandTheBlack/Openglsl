#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec4 lightPosition; // similar a gl_LightSource[0].position;
uniform float n=4;
uniform mat4 modelViewMatrixInverse;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(1,1,1,1.0) * N.z;
    vtexCoord = texCoord;
    vec3 L = vec3(modelViewMatrixInverse*lightPosition);
    float d = distance(vertex, L);
    float w = clamp(pow(1/d, n),0,1);
    vec3 vertexNew = (1.0-w)*vertex + w*L;
    gl_Position = modelViewProjectionMatrix * vec4(vertexNew, 1.0);
}



