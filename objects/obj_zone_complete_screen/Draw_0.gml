draw_set_color(c_white);
draw_set_halign(fa_center);

draw_text(room_width / 2, 200, "ZONE " + string(global.current_zone) + " COMPLETE!");
draw_text(room_width / 2, 260, "Pearls found this zone: " + string(global.pearls_this_zone));
draw_text(room_width / 2, 320, "Total Pearls: " + string(global.pearls));

// Show skip option if enough pearls
if (global.pearls >= 4 && global.current_zone < 5) {
    draw_text(room_width / 2, 400, "Press S to SKIP next zone");
}

draw_text(room_width / 2, 460, "Press SPACE to continue");

draw_set_color(c_white); // reset
draw_set_halign(fa_left);