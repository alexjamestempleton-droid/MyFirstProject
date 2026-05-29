// Draw the bubble, white in zone 2, default color otherwise
if (global.current_zone == 2) {
    var orig_blend = image_blend;
    image_blend = c_white;
    draw_self();
    image_blend = orig_blend;
} else {
    draw_self();
}
