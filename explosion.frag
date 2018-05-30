#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform sampler2D explosion;
uniform float time;

void main() {
    float slice = 30;
    float frame = floor(mod(time*slice, 48));
    vec2 off;
    off.x = mod(frame, 8)/8;
    off.y = 5.0/6.0 - floor(mod(frame/8, 6))/6;
    vec2 ftexCoord = vec2(vtexCoord.x/8+off.x,vtexCoord.y/6+off.y);
    fragColor = texture(explosion, ftexCoord);
    fragColor = fragColor*fragColor.a;
}
