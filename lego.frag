#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
in vec2 gtexCoord;
in vec3 gnormal;
flat in int up;
uniform sampler2D lego;

void main()
{
	if(up==1) {
		fragColor = texture(lego,gtexCoord)*gfrontColor*gnormal.z;
	}
    else fragColor = gfrontColor*gnormal.z;
}
