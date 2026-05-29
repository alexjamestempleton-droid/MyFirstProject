if (!active) exit;

// Dim background
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// Panel
draw_set_color(make_color_rgb(0, 30, 80));
draw_rectangle(display_get_gui_width()/2 - 150, 200,
               display_get_gui_width()/2 + 150, 500, false);
draw_set_color(c_white);
draw_rectangle(display_get_gui_width()/2 - 150, 200,
               display_get_gui_width()/2 + 150, 500, true);

// Title
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(display_get_gui_width()/2, 220, "PAUSED");

// Options
var options = ["RESUME", (global.muted ? "UNMUTE" : "MUTE"), "MAIN MENU"];
for (var i = 0; i < array_length(options); i++) {
    if (i == selected) draw_set_color(c_yellow);
    else draw_set_color(c_white);
    draw_text(display_get_gui_width()/2, 310 + (i * 60), options[i]);
}

draw_set_halign(fa_left);