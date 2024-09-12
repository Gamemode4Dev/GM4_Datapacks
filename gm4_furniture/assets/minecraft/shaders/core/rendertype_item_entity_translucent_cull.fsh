#version 150

#moj_import <fog.glsl>
#moj_import <emissive_utils.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightColor;
in vec4 faceLightColor;
in vec2 texCoord0;
in vec2 texCoord1;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    int alpha = int(round(textureLod(Sampler0, texCoord0, 0.0).a * 255.0));
    color = make_emissive(color, lightColor, faceLightColor, alpha);
    if(color.a < 0.1) discard;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
