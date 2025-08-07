shader_type canvas_item;

// Paper texture (height map or grain)
uniform sampler2D paper_texture;

// Tiling of paper texture
uniform float paper_scale = 1.0;

// Outline settings
uniform float outline_thickness = 1.5;
uniform vec4 outline_color = vec4(1.0); // White

// Paper blending strength
uniform float paper_blend_strength = 1.0;

// Pixel size (1 / texture resolution)
uniform vec2 pixel_size;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    float alpha = tex.a;

    // OUTLINE: detect alpha edge
    float edge = 0.0;
    for (float x = -1.0; x <= 1.0; x++) {
        for (float y = -1.0; y <= 1.0; y++) {
            vec2 offset = vec2(x, y) * outline_thickness * pixel_size;
            float sample = texture(TEXTURE, UV + offset).a;
            if (sample < 0.5) {
                edge = 1.0;
            }
        }
    }

    vec4 final_color;

    if (edge == 1.0 && alpha > 0.0) {
        final_color = outline_color;
    } else {
        // PAPER MULTIPLY BLEND
        vec4 paper = texture(paper_texture, UV * paper_scale);
        float paper_intensity = dot(paper.rgb, vec3(0.333)); // grayscale
        vec3 paper_blended = tex.rgb * mix(vec3(1.0), vec3(paper_intensity), paper_blend_strength);
        final_color = vec4(paper_blended, alpha);
    }

    COLOR = final_color;
}
