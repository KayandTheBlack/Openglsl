#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float n = 8;
void main()
{
    vec2 Check = floor(vtexCoord*n);
    int value = int(Check.s+Check.t)%2;
    if(value == 1) fragColor = vec4(0,0,0,1);
    else fragColor = vec4(0.8,0.8,0.8,1);
    //fragColor = frontColor;
}
