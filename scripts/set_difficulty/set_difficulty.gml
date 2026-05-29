function set_difficulty() {
    if (global.game_mode == "infinity") {
        spawn_interval = max(20, 120 - floor(global.score / 5));
        obstacle_speed = min(12, 3 + floor(global.score / 30));
        min_gap = max(20, 80 - floor(global.score / 10));
    } else {
        switch (zone) {
            case 1:
                spawn_interval = 120; // slow
                obstacle_speed = 3;
                min_gap = 80;
                break;
            case 2:
                spawn_interval = 90;
                obstacle_speed = 4;
                min_gap = 70;
                break;
            case 3:
                spawn_interval = 70;
                obstacle_speed = 5;
                min_gap = 60;
                break;
            case 4:
                spawn_interval = 50;
                obstacle_speed = 6;
                min_gap = 50;
                break;
            case 5:
                spawn_interval = 35; // fast and chaotic
                obstacle_speed = 8;
                min_gap = 40;
                break;
        }
    }
}