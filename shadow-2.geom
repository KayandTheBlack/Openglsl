#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform vec3 boundingBoxMax;
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	if(gl_PrimitiveIDIn == 0) {
		gfrontColor = vec4(0,1,1,1);
		vec3 C = (boundingBoxMin+boundingBoxMax)/2.0;
		float R = distance(C,boundingBoxMax);
		
		vec4 P = vec4(C.x+R, boundingBoxMin.y-0.01, C.z-R,1);
		gl_Position = modelViewProjectionMatrix*P;
		EmitVertex();

		P = vec4(C.x+R, boundingBoxMin.y-0.01, C.z+R,1);
		gl_Position = modelViewProjectionMatrix*P;
		EmitVertex();

		P = vec4(C.x-R, boundingBoxMin.y-0.01, C.z-R,1);
		gl_Position = modelViewProjectionMatrix*P;
		EmitVertex();

		P = vec4(C.x-R, boundingBoxMin.y-0.01, C.z+R,1);
		gl_Position = modelViewProjectionMatrix*P;
		EmitVertex();
    		EndPrimitive();
	}
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0,0,0,1);
		vec4 P = gl_in[i].gl_Position;
		P.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*P;
		EmitVertex();
	}
    EndPrimitive();
    
}





