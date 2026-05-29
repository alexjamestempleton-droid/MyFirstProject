// Background - dark murky water
draw_set_alpha(alpha);
draw_set_color(make_color_rgb(0, 10, 30));
draw_rectangle(0, 0, room_width, room_height, false);

// Big death message
draw_set_color(make_color_rgb(220, 50, 50));
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_text(room_width / 2, 180, "YOU DIDN'T MAKE IT...");

// Flavour text tied to theme
draw_set_color(c_white);
draw_text(room_width / 2, 260, "Another fish lost to pollution.");
draw_text(room_width / 2, 300, "The ocean grows darker.");

// Stats
draw_set_color(make_color_rgb(180, 220, 255));
if (global.game_mode == "infinity") {
    draw_text(room_width / 2, 380, "Score this run: " + string(global.score));
    draw_text(room_width / 2, 420, "High score: " + string(global.high_score));
} else {
    draw_text(room_width / 2, 380, "Zone reached: " + string(global.current_zone));
    draw_text(room_width / 2, 420, "Pearls collected: " + string(global.pearls));
}

// Prompt (only show after delay)
if (timer >= input_delay) {
    draw_set_color(c_yellow);
    draw_text(room_width / 2, 520, "Press R to try again");
    draw_set_color(make_color_rgb(150, 150, 150));
    draw_text(room_width / 2, 570, "Press ESC for main menu");
}

draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_halign(fa_left);