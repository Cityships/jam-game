shader_type spatial;


uniform sampler2D caustic_noise : repeat_enable;
uniform sampler2D distortion_noise : repeat_enable;
uniform float distortion_strength  = 0.05;
uniform float scroll_a = 0.05;
uniform float scroll_b = 0.025;
uniform float scale = 5.0;
varying vec3 world_position;


void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	// Called for every vertex the material is visible on.
}

void fragment() {

	vec2 distortion = texture(distortion_noise, world_position.xy + vec2(-TIME * scroll_b, 0.0)).rr * distortion_strength;

	float noise_value = texture(caustic_noise, distortion + world_position.xz * scale + TIME * scroll_a).r;
	EMISSION += vec3(noise_value);
	ALPHA = noise_value;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
