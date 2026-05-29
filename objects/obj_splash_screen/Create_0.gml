// Menu options
selected = 0; // 0 = Zone, 1 = Infinity, 2 = Shop, 3 = Settings
shop_open = false;
shop_selected = 0;
shop_message = "";

// Settings
global.volume = 1.0;
global.muted = false;

// Load saved pearls / shop progress
load_game();
global.pearls_this_zone = 0;

// Power-up system
global.powerup_equipped = 0; // 0 = none, 1 = Slow Time, 2 = Sonic Pulse
global.powerup_slow_purchased = false;
global.powerup_pulse_purchased = false;
global.powerup_ready = true;
global.powerup_cooldown = 0;
global.powerup_used_this_level = false;
global.powerup_active = false;
global.slow_time_remaining = 0;
global.sonar_active = false;
global.sonar_radius = 0;

title_y = -100;    // starts off screen, slides down
target_y = 200;