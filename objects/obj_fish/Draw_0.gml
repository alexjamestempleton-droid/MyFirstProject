// Draw the fish sprite (replace spr_fish with your sprite name)
// Zone 2: make fish darker
if (global.current_zone == 2) {
    var orig_blend = image_blend;
    image_blend = make_color_rgb(50, 80, 100); // darker blue tone
    draw_self();
    image_blend = orig_blend;
} else {
    draw_self();
}

// --- HEALTH BAR ---
var bar_x = 20;
var bar_y = 20;
var bar_w = 200;
var bar_h = 20;
var health_pct = health / health_max;

// Background (red)
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

// Foreground (green)
draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + (bar_w * health_pct), bar_y + bar_h, false);

// Border
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, true);

// Health text
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(bar_x, bar_y + bar_h + 4, "HEALTH: " + string(health) + "%");

draw_set_color(c_white); // reset colour

