// Navigate
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    selected = max(0, selected - 1);
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    selected = min(2, selected + 1);
}

// Adjust volume with left/right
if (selected == 0) {
    if (keyboard_check_pressed(vk_right)) {
        global.volume = min(1.0, global.volume + 0.1);
        audio_master_gain(global.volume);
    } else if (keyboard_check_pressed(vk_left)) {
        global.volume = max(0.0, global.volume - 0.1);
        audio_master_gain(global.volume);
    }
}

// Toggle mute
if (selected == 1 && keyboard_check_pressed(vk_space)) {
    global.muted = !global.muted;
    if (global.muted) {
        audio_master_gain(0);
    } else {
        audio_master_gain(global.volume);
    }
}

// Back to splash
if (selected == 2 && keyboard_check_pressed(vk_space)) {
    goto_main_menu();
}
if (keyboard_check_pressed(vk_escape)) {
    goto_main_menu();
}