
spawn_timer = 0;
spawn_interval = 120; // spawn every 2 seconds (at 60fps)
min_gap = 80;         // minimum pixel gap between obstacles
spawn_counter = 0;    // count obstacle spawns to create pearls

// Speed (increases as zones progress)
obstacle_speed = 4;

// Track last spawn y position to enforce gaps
last_spawn_y = -1;

// Draw background behind everything for zone 2
depth = 10000;
bg_scroll_x = 0;
bg_scroll_speed = 0.35;

// Zone difficulty scaling
zone = global.current_zone;
set_difficulty();

// Clean state when entering gameplay (prevents menu/game overlap)
game_set_speed(60, gamespeed_fps);
if (instance_exists(obj_pause_menu)) {
    with (obj_pause_menu) {
        active = false;
        visible = false;
    }
}
if (instance_exists(obj_fish)) {
    with (obj_fish) {
        x = 160;
        y = room_height * 0.5;
        health = health_max;
        alive = true;
        image_alpha = 1;
    }
}
if (!variable_global_exists("zone1_popup_delay")) global.zone1_popup_delay = 0;