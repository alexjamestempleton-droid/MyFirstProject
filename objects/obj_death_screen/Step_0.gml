timer++;

// Fade in
alpha = min(1.0, alpha + 0.02);

if (!variable_global_exists("game_mode")) global.game_mode = "zone";
if (!variable_global_exists("high_score")) global.high_score = 0;
if (!variable_global_exists("score")) global.score = 0;
if (!variable_global_exists("score_timer")) global.score_timer = 0;
if (!variable_global_exists("zone_complete")) global.zone_complete = false;
if (!variable_global_exists("zone_timer")) global.zone_timer = 0;

if (global.game_mode == "infinity") {
    if (global.score > global.high_score) {
        global.high_score = global.score;
        save_game();
    }
}

if (timer < input_delay) exit;

// Restart from the current mode
if (keyboard_check_pressed(ord("R"))) {
    begin_game_run(global.game_mode);
}

// Back to main menu
if (keyboard_check_pressed(vk_escape)) {
    goto_main_menu();
}