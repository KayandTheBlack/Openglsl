#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
//in vec2 vtexCoord[];
out vec2 gtexCoord;
out vec4 gfrontColor;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float step = 0.3;
flat out int up;
out vec3 gnormal;

void main( void )
{
	float steppu = step;
	vec4 c = (gl_in[0].gl_Position
		+gl_in[1].gl_Position
		+gl_in[2].gl_Position)/3;
	c = steppu*floor(c/steppu);
	vec4 c2 = c+vec4(steppu,steppu,steppu,0);
	vec4 color = vfrontColor[0];//+vfrontColor[1]+ vfrontColor[2]; //RGBCY
	if (distance(color, vec4(1,0,0,1)) < distance(color, vec4(0,1,0,1))) gfrontColor = vec4(1,0,0,1);
	else  gfrontColor = vec4(0,1,0,1);
	if (distance(color, vec4(0,0,1,1)) < distance(color,gfrontColor)) gfrontColor = vec4(0,0,1,1);
	if (distance(color, vec4(0,1,1,1)) < distance(color,gfrontColor)) gfrontColor = vec4(0,1,1,1);
	if (distance(color, vec4(1,1,0,1)) < distance(color,gfrontColor)) gfrontColor = vec4(1,1,0,1);

// back
	up = 0;
	gnormal = normalize(normalMatrix*vec3(0, 0, -1));
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c2.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c2.y,c.z,1);
	EmitVertex();
	EndPrimitive();
	up = 1;
//TOP!
	gnormal = normalize(normalMatrix*vec3(0, 1, 0));
        gtexCoord = vec2(0, 0);
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c2.y,c.z,1);
	EmitVertex();
        gtexCoord = vec2(0, 1);
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c2.y,c.z,1);
	EmitVertex();
        gtexCoord = vec2(1, 0);
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c2.y,c2.z,1);
	EmitVertex();
        gtexCoord = vec2(1, 1);
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c2.y,c2.z,1);
	EmitVertex();
	EndPrimitive();
//FRONT!
	up = 0;
	gnormal = normalize(normalMatrix*vec3(0, 0, 1));
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c2.y,c2.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c2.y,c2.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c2.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c.y,c2.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c.y,c.z,1);
	EmitVertex();
    EndPrimitive();
//left
	gnormal = normalize(normalMatrix*vec3(-1, 0, 0));
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c2.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c2.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c2.y,c2.z,1);
	EmitVertex();
    EndPrimitive();
//right
	gnormal = normalize(normalMatrix*vec3(1, 0, 0));
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c.y,c2.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c2.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c2.x,c2.y,c2.z,1);
	EmitVertex();
    EndPrimitive();
}
