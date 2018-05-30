#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform mat4 modelViewProjectionMatrix;
void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0,0,0,0);
		vec4 P = gl_in[i].gl_Position;
		P.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*P;
		EmitVertex();
	}
    EndPrimitive();
}





