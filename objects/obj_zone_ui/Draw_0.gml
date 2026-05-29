// --- MODE LABEL ---
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_font(fnt_main); // assign a font in GameMaker
if (global.game_mode == "infinity") {
    draw_text(room_width / 2, 20, "INFINITY");
} else {
    draw_text(room_width / 2, 20, "ZONE " + string(global.current_zone));
}

if (global.game_mode == "infinity") {
    draw_text(room_width / 2, 50, "Score: " + string(global.score));
} else {
    // --- TIMER ---
    var zone_duration = get_zone_duration(global.current_zone) * 60;
    var frames_left = zone_duration - global.zone_timer;
    var seconds_left = ceil(frames_left / 60);
    var minutes = seconds_left div 60;
    var seconds = seconds_left mod 60;

    var time_str = string(minutes) + ":" + (seconds < 10 ? "0" : "") + string(seconds);
    draw_text(room_width / 2, 50, time_str);
}

draw_pearl_hud();

draw_set_color(c_white);
draw_set_halign(fa_left);

var equipped = "NONE";
if (global.powerup_equipped == 1) equipped = "Slow Time";
else if (global.powerup_equipped == 2) equipped = "Sonic Pulse";
var ready_text = global.powerup_ready ? "READY" : "WAIT";
draw_text(20, 80, "Powerup: " + equipped + " (" + ready_text + ")");
draw_text(20, 100, "Press SHIFT to activate");
if (global.slow_time_remaining > 0) {
    draw_text(20, 120, "Slow active: " + string(ceil(global.slow_time_remaining / room_speed)) + "s");
} else if (global.sonar_active) {
    draw_text(20, 120, "Sonic Pulse active");
} else if (!global.powerup_ready && global.game_mode == "infinity") {
    draw_text(20, 120, "Recharge in: " + string(ceil((30 * room_speed - global.powerup_cooldown) / room_speed)) + "s");
} else if (!global.powerup_ready && global.game_mode == "zone") {
    draw_text(20, 120, "Ready next level");
}

if (global.sonar_active && instance_exists(obj_fish)) {
    draw_set_alpha(0.35);
    draw_set_color(c_yellow);
    draw_circle(obj_fish.x, obj_fish.y, global.sonar_radius, false);
    draw_set_alpha(1.0);
}

// Zone 1 tutorial overlay (drawn on UI layer, above gameplay)
if (global.show_zone1_popup) {
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1.0);
    
    draw_set_color(make_color_rgb(0, 30, 80));
    draw_rectangle(room_width / 2 - 200, room_height / 2 - 100,
                   room_width / 2 + 200, room_height / 2 + 100, false);
    draw_set_color(c_white);
    draw_rectangle(room_width / 2 - 200, room_height / 2 - 100,
                   room_width / 2 + 200, room_height / 2 + 100, true);
    
    draw_set_halign(fa_center);
    draw_set_font(fnt_main);
    draw_set_color(c_white);
    draw_text(room_width / 2, room_height / 2 - 70, "ZONE 1 CONTROLS");
    
    draw_set_color(c_yellow);
    draw_text(room_width / 2, room_height / 2 - 30, "Use UP/DOWN arrows or W/S");
    draw_text(room_width / 2, room_height / 2 - 10, "to move the fish vertically");
    
    draw_set_color(c_white);
    draw_text(room_width / 2, room_height / 2 + 20, "Avoid obstacles and collect pearls!");
    draw_text(room_width / 2, room_height / 2 + 40, "Press SPACE to continue");
    
    draw_set_halign(fa_left);
}

