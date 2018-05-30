#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

void main()
{
    fragColor = vec4(1,1,1,1);
    float radius = distance(vtexCoord,vec2(0.5, 0.5));

    if(radius<0.2) fragColor = vec4(1,0,0,1);
}
