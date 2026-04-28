shader_type spatial;

uniform sampler2D shape_curve;
uniform vec4 color : source_color;

void vertex() {
	VERTEX.x += texture(shape_curve, vec2(VERTEX.y, 0.0)).r - 0.75;
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = color.rgb;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
