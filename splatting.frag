#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

void main() {
    //fragColor = frontColor;
    vec4 r = texture(rock1,vtexCoord);
    vec4 g = texture(grass2,vtexCoord);
    float n = texture(noise0,vtexCoord).r;
    fragColor = mix(r,g,n);
}
