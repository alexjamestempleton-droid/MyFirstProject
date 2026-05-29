// Continue to next zone
if (keyboard_check_pressed(vk_space)) {
    global.current_zone++;
    
    // Update spawner difficulty
    // (spawner reads global.current_zone automatically via set_difficulty)
    
    if (global.current_zone > 5) {
        room_goto(rm_win); // finished all zones!
    } else {
        continue_zone_run();
    }
}

// Skip a zone if enough pearls
if (keyboard_check_pressed(ord("S")) && global.pearls >= 4 && global.current_zone < 5) {
    global.pearls -= 4; // spend pearls to skip
    save_game();
    global.current_zone += 1;
    
    if (global.current_zone > 5) {
        global.current_zone = 5; // clamp to max zone
    }
    continue_zone_run();
}