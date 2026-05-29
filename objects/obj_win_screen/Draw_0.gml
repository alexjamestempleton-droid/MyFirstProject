draw_set_alpha(alpha);

// Background - bright clean ocean
draw_set_color(make_color_rgb(0, 80, 160));
draw_rectangle(0, 0, room_width, room_height, false);

// Draw floating bubbles
draw_set_color(make_color_rgb(150, 220, 255));
for (var i = 0; i < ds_list_size(bubble_list); i++) {
    var b = bubble_list[| i];
    draw_circle(b[0], b[1], b[3], true);
}

// Victory message
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_text(room_width / 2, 160, "YOU ESCAPED THE POLLUTION!");

// Thematic message
draw_set_color(c_white);
draw_text(room_width / 2, 240, "You survived all 5 zones.");
draw_text(room_width / 2, 280, "But the ocean still needs help.");
draw_text(room_width / 2, 320, "Every piece of rubbish counts.");

// Final stats
draw_set_color(make_color_rgb(180, 255, 220));
draw_text(room_width / 2, 400, "Total Pearls collected: " + string(global.pearls));

// Pearl ranking
var rank = "";
if (global.pearls >= 12) rank = "OCEAN GUARDIAN";
else if (global.pearls >= 8) rank = "DEEP DIVER";
else if (global.pearls >= 5) rank = "REEF EXPLORER";
else rank = "SMALL FRY";

draw_set_color(c_yellow);
draw_text(room_width / 2, 450, "Rank: " + rank);

// Prompts
if (timer >= input_delay) {
    draw_set_color(c_white);
    draw_text(room_width / 2, 540, "Press R to play again");
    draw_set_color(make_color_rgb(150, 150, 150));
    draw_text(room_width / 2, 580, "Press ESC for main menu");
}

draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_halign(fa_left);