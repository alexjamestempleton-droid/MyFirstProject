// Background
draw_set_color(make_color_rgb(0, 30, 80));
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_text(room_width / 2, 150, "SETTINGS");

// Volume bar
var vol_pct = global.volume;
var bar_x = room_width / 2 - 100;
var bar_y = 280;
var bar_w = 200;
var bar_h = 20;

if (selected == 0) draw_set_color(c_yellow);
else draw_set_color(c_white);
draw_text(room_width / 2, 240, "VOLUME");

draw_set_color(c_dkgray);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
draw_set_color(c_aqua);
draw_rectangle(bar_x, bar_y, bar_x + (bar_w * vol_pct), bar_y + bar_h, false);
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, true);

// Mute toggle
if (selected == 1) draw_set_color(c_yellow);
else draw_set_color(c_white);
draw_text(room_width / 2, 340, "MUTE: " + (global.muted ? "ON" : "OFF"));

// Back
if (selected == 2) draw_set_color(c_yellow);
else draw_set_color(c_white);
draw_text(room_width / 2, 400, "BACK");

// Instructions
draw_set_color(make_color_rgb(150, 150, 150));
draw_text(room_width / 2, room_height - 40, "LEFT/RIGHT to adjust volume, SPACE to select");

draw_set_color(c_white);
draw_set_halign(fa_left);