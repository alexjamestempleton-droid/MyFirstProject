global.show_restart_popup = false;
global.show_pause_menu = false;
global.show_zone1_popup = false;
global.zone1_popup_shown = false;

// Zone and Pearl tracking
global.current_zone = 1;
global.pearls = 0;
global.pearls_this_zone = 0;

// Zone timer
global.zone_timer = 0;
global.zone_complete = false;

// Game mode: zone or infinity
global.game_mode = "zone";
global.score = 0;
global.score_timer = 0;
global.score_increment_cooldown = 6; // 100ms at 60fps
global.high_score = 0;

// Rock stop behavior
global.rocks_stopped = false;
global.rock_stop_x = -1;

// Power-ups (ensure these exist in-game rooms too, not just splash)
global.powerup_equipped = 0; // 0 = none, 1 = Slow Time, 2 = Sonic Pulse
global.powerup_slow_purchased = false;
global.powerup_pulse_purchased = false;
global.powerup_ready = true;
global.powerup_active = false;
global.powerup_cooldown = 0;
global.powerup_used_this_level = false;
global.slow_time_remaining = 0;
global.sonar_active = false;
global.sonar_radius = 0;
global.zone1_popup_delay = 0;

// Pearls required to unlock each zone
global.pearls_to_advance = 2; // earn 2 pearls to skip ahead, 1 to just progress

// Audio
global.muted = false;
global.volume = 1.0;

// Load saved progress (after all defaults are set)
load_game();
