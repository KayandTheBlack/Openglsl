#version 330 core

out vec4 fragColor;
in vec3 normal;
uniform mat3 normalMatrix;
void main()
{
    fragColor = vec4(0.8,0.8,0.8,1.0)*(normalize(normalMatrix*normal)).z;
}
