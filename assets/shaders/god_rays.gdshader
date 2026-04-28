shader_type spatial;

uniform sampler2D noise : repeat_enable;
varying vec3 world_position;

void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	VERTEX.y = log(VERTEX.y + 09.49284) * 8.934 - 16.0;
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALPHA *= texture(noise, vec2(UV.x + TIME * 0.005, 0.0)).r;
	ALPHA *= UV.y;
	// Called for every pixel the material is visible on.
}

