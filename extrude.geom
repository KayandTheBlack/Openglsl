#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;
in vec3 N[];
uniform float d = 0.5;
uniform mat4 modelViewProjectionMatrix;
out vec3 normal;

void main( void ) {
	vec4 extruded[3];
	vec3 n1 = normalize((N[0] +N[1] +N[2])/3.0);
	extruded[0] = gl_in[0].gl_Position+d*vec4(n1,0);
	extruded[1] = gl_in[1].gl_Position+d*vec4(n1,0);
	extruded[2] = gl_in[2].gl_Position+d*vec4(n1,0);

	normal = n1;
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
    EndPrimitive();
	
	normal = cross(n1, (gl_in[0].gl_Position-gl_in[1].gl_Position).xyz);
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
    EndPrimitive();
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
    EndPrimitive();

	normal = cross(n1, (gl_in[1].gl_Position-gl_in[2].gl_Position).xyz);
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
    EndPrimitive();
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
    EndPrimitive();

	normal = cross(n1, (gl_in[2].gl_Position-gl_in[0].gl_Position).xyz);
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
    EndPrimitive();
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
    EndPrimitive();
	/*for( int i = 0 ; i < 3 ; i++ )
	{
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();*/
}
