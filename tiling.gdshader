shader_type canvas_item;

uniform sampler2D tile_texture : repeat_enable, filter_nearest;
uniform float scale = 1.0; // overall scale of tiles

void fragment() {
    // Get texture size
    vec2 tex_size = textureSize(tile_texture, 0);
    
    // Correct UVs to keep aspect ratio
    vec2 aspect_ratio = vec2(tex_size.y / tex_size.x, 1.0); 
    vec2 tiled_uv = UV * scale * aspect_ratio;
    
    COLOR = texture(tile_texture, tiled_uv);
}