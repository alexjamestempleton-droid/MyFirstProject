if (!alive) exit;

// --- CURRENT AND DRIFT ---
// Zone 2 has a strong rightward current
if (global.current_zone == 2) {
    current_strength = 1.5;
} else {
    current_strength = 0.5;
}

// Update drift direction periodically
drift_change_timer++;
if (drift_change_timer >= drift_change_interval) {
    drift_change_timer = 0;
    var drift_angle = random(360);
    var drift_mag = 0.3;
    current_drift_x = cos(degtorad(drift_angle)) * drift_mag;
    current_drift_y = -sin(degtorad(drift_angle)) * drift_mag;
}

// Apply current (always pushes right in zone 2)
var time_factor = (global.slow_time_remaining > 0) ? 0.5 : 1;
var current_force_x = (global.current_zone == 2) ? current_strength * time_factor : 0;
var current_force_y = 0;

// Apply current and drift to position (unless blocked by rock)
if (!place_meeting(x + current_force_x + current_drift_x * time_factor, y, obj_rock)) {
    x += current_force_x + current_drift_x * time_factor;
}
if (!place_meeting(x, y + current_force_y + current_drift_y * time_factor, obj_rock)) {
    y += current_force_y + current_drift_y * time_factor;
}

// Power-up cooldown and activation
if (global.powerup_equipped > 0 && keyboard_check_pressed(vk_shift) && global.powerup_ready && !global.powerup_active) {
    if (global.powerup_equipped == 1) {
        global.slow_time_remaining = 5 * room_speed;
        global.powerup_active = true;
        global.powerup_ready = false;
        global.powerup_used_this_level = true;
        global.powerup_cooldown = 0;
    } else if (global.powerup_equipped == 2) {
        global.sonar_active = true;
        global.sonar_radius = 0;
        global.powerup_active = true;
        global.powerup_ready = false;
        global.powerup_used_this_level = true;
        global.powerup_cooldown = 0;
    }
}

if (global.slow_time_remaining > 0) {
    global.slow_time_remaining -= 1;
    if (global.slow_time_remaining <= 0) {
        global.slow_time_remaining = 0;
        global.powerup_active = false;
    }
}

if (global.sonar_active) {
    var fish_x = x;
    var fish_y = y;
    global.sonar_radius += 24;
    with (obj_obstacle_parent) {
        if point_distance(x, y, fish_x, fish_y) <= global.sonar_radius {
            instance_destroy();
        }
    }
    if (global.sonar_radius >= 220) {
        global.sonar_active = false;
        global.powerup_active = false;
    }
}

if (!global.powerup_ready && global.game_mode == "infinity" && !global.powerup_active) {
    global.powerup_cooldown += 1;
    if (global.powerup_cooldown >= 30 * room_speed) {
        global.powerup_ready = true;
    }
}

// --- MOVEMENT ---
// Zone 1: Only allow up/down movement (W/S or up/down arrows)
var dx = 0;
var dy = 0;

if (global.current_zone == 1) {
    if (!variable_global_exists("zone1_popup_shown")) global.zone1_popup_shown = false;
    if (!variable_global_exists("show_zone1_popup")) global.show_zone1_popup = false;

    // Zone 1: Only vertical movement
    if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
        dy = -move_speed;
    } else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
        dy = move_speed;
    }
    
    // Show control popup for zone 1 after a short delay (avoids menu overlap on start)
    if (variable_global_exists("zone1_popup_delay") && global.zone1_popup_delay > 0) {
        global.zone1_popup_delay--;
    } else if (!global.zone1_popup_shown) {
        global.show_zone1_popup = true;
        global.zone1_popup_shown = true;
    }
} else {
    // Zone 2+: Allow full movement
    if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
        dx = -move_speed;
    } else if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
        dx = move_speed;
    }
    
    if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
        dy = -move_speed;
    } else if (keyboard_check(ord("S")) || keyboard_check(vk_down)) {
        dy = move_speed;
    }
    
    // Reset popup flag when leaving zone 1
    global.zone1_popup_shown = false;
}

// Check and apply horizontal movement
if (dx != 0) {
    if (!place_meeting(x + dx, y, obj_rock)) {
        x += dx;
    }
}

// Check and apply vertical movement
if (dy != 0) {
    if (!place_meeting(x, y + dy, obj_rock)) {
        y += dy;
    }
}

// Keep fish in bounds
x = clamp(x, 16, room_width - 16);
y = clamp(y, 16, room_height - 16);

// --- INVINCIBILITY FRAMES ---
if (inv_frames > 0) {
    inv_frames--;
    // Flash effect while invincible
    image_alpha = (inv_frames mod 6 < 3) ? 0.3 : 1.0;
} else {
    image_alpha = 1.0;
}

// --- COLLISION WITH OBSTACLES ---
if (inv_frames == 0) {
    var touching_rock = place_meeting(x, y, obj_rock);
    if (place_meeting(x, y, obj_obstacle_parent) && !touching_rock) {
        health -= 20;
        inv_frames = inv_duration;
        
        if (health <= 0) {
            health = 0;
            alive = false;
            room_goto(rm_death); // go to death screen
        }
    }
}

// Note: Pause is handled by obj_pause_menu (which is in the room)
// No need to handle it here