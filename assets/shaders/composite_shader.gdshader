shader_type spatial;
//render_mode diffuse_toon, specular_toon;

uniform sampler2D diffuse_texture : source_color;
uniform sampler2D color_gradient;
uniform sampler2D fresnel_gradient;
uniform float fresnel_intensity = 5.0;

float fresnel(float amount, vec3 normal, vec3 view){
	return pow(1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0), amount);
}

void vertex(){
	
}
void fragment(){
	ALBEDO = texture(diffuse_texture, UV).rgb;
	float f = fresnel(fresnel_intensity, NORMAL, VIEW);
	ALBEDO += (f * texture(fresnel_gradient, vec2(f, 0.0)).r);
}

void light(){
	float dotproduct = clamp(dot(NORMAL, LIGHT), -.99, 0.99);
	float sample = clamp((dotproduct + 1.0) * ATTENUATION / 2.01, 0.01, 0.99);
	vec4 shaded = texture(color_gradient, vec2(sample, 0.0));
	DIFFUSE_LIGHT += clamp((shaded.rgb * LIGHT_COLOR), 0.0, 1.0);
}