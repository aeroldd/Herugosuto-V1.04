shader_type canvas_item;

uniform float wind_strength = 5;
uniform float wave_frequency= 1.0;
uniform float wave_phase = 0;

uniform float push = 0;

void vertex() {
	float wave = sin(TIME*wave_frequency + wave_phase);
	
    VERTEX.x += (1.0-UV.y) * wind_strength * (wave + push);
}