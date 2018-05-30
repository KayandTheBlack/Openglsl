#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float n = 8;
void main()
{
    vec2 Check = vtexCoord*n;
    float value  = fract(Check.s);
    float value2 = fract(Check.t);
    if(value <= 0.1 || value2 <= 0.1) fragColor = vec4(0,0,0,1);
    else fragColor = vec4(0.8,0.8,0.8,1);
    //fragColor = frontColor;
}
