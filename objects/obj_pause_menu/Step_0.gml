// Toggle pause
if (keyboard_check_pressed(vk_escape)) {
    active = !active;
    visible = active;
    game_set_speed(active ? 0 : room_speed, gamespeed_fps);
}

if (!active) exit;

// Navigate
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    selected = max(0, selected - 1);
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    selected = min(2, selected + 1);
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_return)) {
    if (selected == 0) {
        // Resume
        active = false;
        visible = false;
        game_set_speed(room_speed, gamespeed_fps);
    } else if (selected == 1) {
        // Toggle mute
        global.muted = !global.muted;
        audio_master_gain(global.muted ? 0 : global.volume);
    } else if (selected == 2) {
        // Main menu
        active = false;
        visible = false;
        global.show_pause_menu = false;
        global.show_zone1_popup = false;
        goto_main_menu();
        exit;
    }
}