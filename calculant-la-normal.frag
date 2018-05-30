#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 P;
uniform mat3 normalMatrix;
void main()
{
    //Calcular la normal com N!
    vec3 fx = dFdx(P); //vector entre aquest i la pos del fragment adjacent dret
    vec3 fy = dFdy(P); //"" superior
    vec3 Normal = cross(fx,fy);
    vec3 N = normalize(normalMatrix*Normal);
    fragColor = frontColor*N.z;
}
