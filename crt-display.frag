#version 330 core

in vec4 frontColor;
out vec4 fragColor;

layout(pixel_center_integer) in vec4 gl_FragCoord;  //Redefineix coords perque siguin enteres
//en comptes de .5 .5
uniform int n;
void main()
{
    if(int(gl_FragCoord.y)%n!=0) discard;
    fragColor = frontColor;
}
