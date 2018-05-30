#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float speed;
uniform float time;
const float PI = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);// * N.z;
    vtexCoord = texCoord;
    float psi = speed* /*PI**/ time;
    mat3 Rotate = mat3( vec3(cos(psi),0,-sin(psi)), vec3(0,1,0), vec3(sin(psi),0,cos(psi)) ); //note written by columns!
    gl_Position = modelViewProjectionMatrix * vec4(Rotate *vertex, 1.0);
}
