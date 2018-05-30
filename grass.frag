#version 330 core

out vec4 fragColor;
in vec3 normal;
in vec4 gPos;
uniform mat3 normalMatrix;
uniform sampler2D side0;
uniform sampler2D top1;
uniform float d;

void main()
{
    float z =(normalize(normalMatrix*normal)).z;
	if(normal.z==0) { //vertical, don't ask
		vec2 texCoord = vec2(4*(gPos.x - gPos.y), gPos.z/d);
		fragColor = texture(side0, texCoord);
		if (fragColor.a < 0.1) discard;
	} else {
    	fragColor = texture(top1, 4*gPos.xy);
		if (fragColor.a < 0.1) discard;
	}
}
