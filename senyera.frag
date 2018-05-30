#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
void main()
{
    int s = int(floor(fract(vtexCoord.s)*9)); // coord/ 1/9;
    if (s % 2 == 1) fragColor = vec4(1,0,0,1);
    else fragColor = vec4(1,1,0,1);
}
