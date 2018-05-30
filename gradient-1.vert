#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform vec3 boundingBoxMax; // cantonada maxima de la capsa englobant

void main() {
    //vec3 N = normalize(normalMatrix * normal);
    //frontColor = vec4(color,1.0) * N.z;
    float y4 = 4*(vertex.y-boundingBoxMin.y)/(boundingBoxMax.y-boundingBoxMin.y);
    if(y4<1) frontColor = mix(vec4(1,0,0,1),vec4(1,1,0,1),fract(y4));
    else if(y4<2) frontColor = mix(vec4(1,1,0,1),vec4(0,1,0,1),fract(y4));
    else if(y4<3) frontColor = mix(vec4(0,1,0,1),vec4(0,1,1,1),fract(y4));
    else if(y4<4) frontColor = mix(vec4(0,1,1,1),vec4(0,0,1,1),fract(y4));
    else frontColor = vec4(0,0,1,1);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}






