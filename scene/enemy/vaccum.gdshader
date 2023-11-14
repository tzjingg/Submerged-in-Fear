shader_type canvas_item;

void fragment() {
	COLOR.rgb = texture(TEXTURE, UV).rgb + vec3(1,1,1);
	COLOR.a = texture(TEXTURE, UV).a;
}
