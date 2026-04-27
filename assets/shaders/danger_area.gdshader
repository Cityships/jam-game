shader_type spatial;

uniform sampler2D danger_texture;
uniform sampler2D color_ramp;
varying vec3 vtx;

void vertex(){
	vtx = VERTEX;
}

void fragment() {
	float d = texture(danger_texture, vec2(0.0,vtx.y * 0.5 + 0.5)).r;
	vec4 s = texture(color_ramp, vec2(vtx.x * 0.5 + 0.5 + d, 0.0));
	ALBEDO = s.rgb;
	
	// Called for every pixel the material is visible on.
}
