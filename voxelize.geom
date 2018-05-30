#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
uniform mat4 modelViewProjectionMatrix;
uniform float step = 1;
void main( void )
{
	float steppu = step;
	vec4 c = (gl_in[0].gl_Position
		+gl_in[1].gl_Position
		+gl_in[2].gl_Position)/3;
	c = steppu*(c/steppu-fract(c/steppu));
	
	gfrontColor = vfrontColor[0];
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y+steppu,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y+steppu,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y+steppu,c.z+steppu,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y+steppu,c.z+steppu,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z+steppu,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y,c.z+steppu,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y,c.z,1);
	EmitVertex();
    EndPrimitive();
	
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y,c.z+steppu,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y+steppu,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x,c.y+steppu,c.z+steppu,1);
	EmitVertex();
    EndPrimitive();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y,c.z+steppu,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y+steppu,c.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix*vec4(c.x+steppu,c.y+steppu,c.z+steppu,1);
	EmitVertex();
    EndPrimitive();
}
