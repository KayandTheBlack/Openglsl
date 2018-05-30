#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;
in vec3 N[];
uniform float d =0;
uniform mat4 modelViewProjectionMatrix;
out vec3 normal;
out vec4 gPos;
vec3 n1;
void emitSide (vec4 a, vec4 b, vec4 a2, vec4 b2) {
	normal = cross(n1, (a-b).xyz);
	gPos=b2;
	gl_Position = modelViewProjectionMatrix*gPos;
		EmitVertex();
	gPos=a2;
	gl_Position = modelViewProjectionMatrix*gPos;
		EmitVertex();
	gPos=b;
	gl_Position = modelViewProjectionMatrix*gPos;
		EmitVertex();
    EndPrimitive();
    gPos=a2;
	gl_Position = modelViewProjectionMatrix*gPos;
		EmitVertex();
	gPos=a;
	gl_Position = modelViewProjectionMatrix*gPos;
		EmitVertex();
	gPos=b;
	gl_Position = modelViewProjectionMatrix*gPos;
		EmitVertex();
    EndPrimitive();
}

void main( void ) {
	vec4 extruded[3];
	n1 = normalize((N[0] +N[1] +N[2])/3.0);
	extruded[0] = gl_in[0].gl_Position+d*vec4(n1,0);
	extruded[1] = gl_in[1].gl_Position+d*vec4(n1,0);
	extruded[2] = gl_in[2].gl_Position+d*vec4(n1,0);

	normal = -n1;
	gPos=gl_in[0].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
	gPos=gl_in[1].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
	gPos=gl_in[2].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
    EndPrimitive();
	emitSide (gl_in[0].gl_Position, gl_in[1].gl_Position, extruded[0], extruded[1]);
	emitSide (gl_in[1].gl_Position, gl_in[2].gl_Position, extruded[1], extruded[2]);
	emitSide (gl_in[2].gl_Position, gl_in[0].gl_Position, extruded[2], extruded[0]);
	/*
	normal = cross(n1, (gl_in[0].gl_Position-gl_in[1].gl_Position).xyz);
	gPos=extruded[1];
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gPos=extruded[0];
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gPos=gl_in[1].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
    EndPrimitive();
    gPos=extruded[0];
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gPos=gl_in[0].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
	gPos=gl_in[1].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
    EndPrimitive();

	normal = cross(n1, (gl_in[1].gl_Position-gl_in[2].gl_Position).xyz);
	gPos=extruded[2];
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
	gPos=extruded[1];
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gPos=gl_in[2].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
    EndPrimitive();
	gPos=extruded[1];
	gl_Position = modelViewProjectionMatrix*extruded[1];
		EmitVertex();
	gPos=gl_in[1].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[1].gl_Position;
		EmitVertex();
	gPos=gl_in[2].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
    EndPrimitive();

	normal = cross(n1, (gl_in[2].gl_Position-gl_in[0].gl_Position).xyz);
	gPos=extruded[0];
	gl_Position = modelViewProjectionMatrix*extruded[0];
		EmitVertex();
	gPos=extruded[2];
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
	gPos=gl_in[0].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
    EndPrimitive();
	gPos=extruded[2];
	gl_Position = modelViewProjectionMatrix*extruded[2];
		EmitVertex();
	gPos=gl_in[2].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[2].gl_Position;
		EmitVertex();
	gPos=gl_in[0].gl_Position;
	gl_Position = modelViewProjectionMatrix*gl_in[0].gl_Position;
		EmitVertex();
    EndPrimitive();*/
}
