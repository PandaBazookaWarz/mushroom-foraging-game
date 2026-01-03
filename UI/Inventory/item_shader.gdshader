shader_type canvas_item;

uniform vec4 silhouette_color : source_color = vec4(0.0, 0.0, 0.0, 1.0); // Default to black
uniform float silhouette_alpha_threshold : hint_range(0.0, 1.0) = 0.1; // Adjust transparency threshold
uniform bool do_silhouette = false;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
	if(do_silhouette){
	    if (color.a > silhouette_alpha_threshold) {
	        // If the pixel is opaque enough, color it with the silhouette color
	        COLOR = silhouette_color;
	    } else {
	        // Otherwise, make it completely transparent
	        COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	    }
	}
}