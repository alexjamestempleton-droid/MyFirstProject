/// @description Reset gameplay state and enter rm_game without menu overlap.
function begin_game_run(_mode) {
    game_set_speed(60, gamespeed_fps);
    
    global.game_mode = _mode;
    global.current_zone = 1;
    global.zone_timer = 0;
    global.zone_complete = false;
    global.score = 0;
    global.score_timer = 0;
    
    global.powerup_ready = true;
    global.powerup_used_this_level = false;
    global.powerup_cooldown = 0;
    global.powerup_active = false;
    global.slow_time_remaining = 0;
    global.sonar_active = false;
    global.sonar_radius = 0;
    
    global.show_pause_menu = false;
    global.show_zone1_popup = false;
    global.zone1_popup_shown = false;
    global.zone1_popup_delay = 90;
    global.pearls_this_zone = 0;
    
    room_goto(rm_game);
}

/// @description Return to main menu with a clean room transition.
function goto_main_menu() {
    game_set_speed(60, gamespeed_fps);
    global.show_pause_menu = false;
    global.show_zone1_popup = false;
    global.powerup_active = false;
    global.slow_time_remaining = 0;
    global.sonar_active = false;
    load_game();
    room_goto(rm_splash);
}

/// @description Enter gameplay after completing a zone.
function continue_zone_run() {
    game_set_speed(60, gamespeed_fps);
    global.zone_complete = false;
    global.zone_timer = 0;
    global.show_pause_menu = false;
    global.show_zone1_popup = false;
    global.zone1_popup_shown = (global.current_zone != 1);
    global.zone1_popup_delay = 90;
    global.powerup_active = false;
    global.slow_time_remaining = 0;
    global.sonar_active = false;
    global.pearls_this_zone = 0;
    room_goto(rm_game);
}
