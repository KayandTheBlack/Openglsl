#version 330 core

in vec4 frontColor;
in vec3 N;
in vec3 P;
out vec4 fragColor;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space
uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

void main(){
	vec3 normal = normalize(N);
	vec3 L = normalize(lightPosition.xyz - P);
	vec3 V = vec3(0,0,1);
	vec3 H = normalize(V+L);
    fragColor = matAmbient*lightAmbient + matDiffuse*lightDiffuse*max(0,dot(normal,L))+matSpecular*lightSpecular*pow(max(0,dot(normal,H)), matShininess);
}
