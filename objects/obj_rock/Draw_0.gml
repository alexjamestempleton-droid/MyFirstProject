// Draw the rock sprite if available, otherwise draw a fallback rock shape
if (sprite_index != noone) {
    draw_self();
} else {
    var rock_color = make_color_rgb(100, 90, 60);
    var rock_size = 24;

    draw_set_color(rock_color);
    draw_rectangle(x - rock_size, y - rock_size, x + rock_size, y + rock_size, true);
    draw_set_color(c_white); // reset
}

