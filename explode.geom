#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
in vec3 n[];
uniform mat4 modelViewProjectionMatrix;

const float speed = 0.5;
uniform float time;

void main( void )
{
	vec3 nm = (n[0]+n[1]+n[2])/3;
	vec4 despl = vec4(speed*time*nm,0);
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position + despl);
		EmitVertex();
	}
    EndPrimitive();
}
