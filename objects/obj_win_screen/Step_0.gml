timer++;
alpha = min(1.0, alpha + 0.015);

// Animate bubbles floating up
for (var i = 0; i < ds_list_size(bubble_list); i++) {
    var b = bubble_list[| i];
    b[1] -= b[2]; // move up
    if (b[1] < -20) {
        b[1] = room_height + irandom(100); // reset to bottom
        b[0] = irandom(room_width);
    }
    bubble_list[| i] = b;
}

if (timer < input_delay) exit;

// Play again from zone 1
if (keyboard_check_pressed(ord("R"))) {
    begin_game_run("zone");
}

// Main menu
if (keyboard_check_pressed(vk_escape)) {
    goto_main_menu();
}