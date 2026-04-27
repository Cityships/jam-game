shader_type spatial;


uniform sampler2D caustic_noise : repeat_enable;
uniform float scale = 5.0;
varying vec3 world_position;


void vertex() {
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	// Called for every vertex the material is visible on.
}

void fragment() {
	float noise_value = texture(caustic_noise, world_position.xz * scale).r;
	EMISSION += vec3(noise_value);
	ALPHA = noise_value;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
