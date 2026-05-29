// Slide title in
title_y = lerp(title_y, target_y, 0.08);

if (shop_open) {
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        shop_selected = max(0, shop_selected - 1);
    }
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        shop_selected = min(2, shop_selected + 1);
    }
    if (keyboard_check_pressed(vk_escape)) {
        shop_open = false;
        shop_message = "";
    }

    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_return)) {
        if (shop_selected == 0) {
            if (!global.powerup_slow_purchased) {
                if (global.pearls >= 5) {
                    global.pearls -= 5;
                    global.powerup_slow_purchased = true;
                    global.powerup_equipped = 1;
                    save_game();
                    shop_message = "Slow Time purchased and equipped.";
                } else {
                    shop_message = "Need 5 pearls to buy Slow Time.";
                }
            } else {
                global.powerup_equipped = 1;
                shop_message = "Slow Time equipped.";
            }
        } else if (shop_selected == 1) {
            if (!global.powerup_pulse_purchased) {
                if (global.pearls >= 10) {
                    global.pearls -= 10;
                    global.powerup_pulse_purchased = true;
                    global.powerup_equipped = 2;
                    save_game();
                    shop_message = "Sonic Pulse purchased and equipped.";
                } else {
                    shop_message = "Need 10 pearls to buy Sonic Pulse.";
                }
            } else {
                global.powerup_equipped = 2;
                shop_message = "Sonic Pulse equipped.";
            }
        } else if (shop_selected == 2) {
            shop_open = false;
            shop_message = "";
        }
    }
    exit;
}

// Navigate menu with arrow keys
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    selected = max(0, selected - 1);
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    selected = min(3, selected + 1);
}

// Confirm selection
if (keyboard_check_pressed(vk_return) || keyboard_check_pressed(vk_space)) {
    if (selected == 0) {
        begin_game_run("zone");
    } else if (selected == 1) {
        begin_game_run("infinity");
    } else if (selected == 2) {
        shop_open = true;
        shop_selected = 0;
        shop_message = "";
    } else if (selected == 3) {
        game_set_speed(60, gamespeed_fps);
        room_goto(rm_settings);
    }
}
