shader_type canvas_item;

uniform float wind_strength = 5.0;
uniform float wave_frequency = 1.5;

uniform vec2 player_pos;
uniform float influence_radius = 80.0;

// persistent state coming from script
uniform float push_amount = 0.0;

void vertex() {

    float wave = sin(TIME * wave_frequency);

    vec2 world_pos = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;

    float height = UV.y * UV.y;

    vec2 wind = vec2((1.0-UV.y) * wind_strength * wave,0);

    // push direction computed in shader (stable)
    vec2 dir = normalize(world_pos - player_pos);

    vec2 push = vec2(push_amount,0);

    VERTEX.xy += wind + push;
}