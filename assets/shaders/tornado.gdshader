shader_type spatial;
render_mode cull_disabled, unshaded;

uniform sampler2D shape_curve;
uniform float b_alpha : hint_range(-0.5, 0.5);
uniform sampler2D alpha_cut;
uniform sampler2D albedo_texture;
uniform sampler2D color;

uniform float cut_rotation : hint_range (0.0, 5.0) = 1.0;
uniform float tex_rotation : hint_range (0.0, 5.0) = 1.0;

void vertex() {
	VERTEX.x += texture(shape_curve, vec2(VERTEX.y, 0.0)).x;
	VERTEX.z += texture(shape_curve, vec2(VERTEX.y, 0.0)).z;
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	ALBEDO = texture(albedo_texture, UV + vec2(TIME * tex_rotation, 0.0)).rgb;
	ALBEDO = texture(color, vec2(ALBEDO.r, 0.0)).rgb;
	ALPHA = round(texture(alpha_cut, UV + vec2(TIME * cut_rotation, 0.5 * TIME)).r + b_alpha);
	
}
