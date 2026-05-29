// --- ZONE 1 POPUP DISMISSAL ---
if (global.show_zone1_popup && keyboard_check_pressed(vk_space)) {
    global.show_zone1_popup = false;
}

// --- GAME MODE ---
if (!variable_global_exists("game_mode")) global.game_mode = "zone";
if (!variable_global_exists("score")) global.score = 0;
if (!variable_global_exists("score_timer")) global.score_timer = 0;
if (!variable_global_exists("score_increment_cooldown")) global.score_increment_cooldown = 6;
if (!variable_global_exists("zone_complete")) global.zone_complete = false;
if (!variable_global_exists("zone_timer")) global.zone_timer = 0;

// Keep a subtle drifting background motion for later zones
var bg_time_factor = (variable_global_exists("slow_time_remaining") && global.slow_time_remaining > 0) ? 0.5 : 1;
bg_scroll_x += bg_scroll_speed * bg_time_factor;
if (bg_scroll_x > 100000) bg_scroll_x = 0;

// Apply zone backgrounds directly to the room Background layer
var bg_layer_id = layer_get_id("Background");
if (bg_layer_id != -1) {
    var bg_element_id = layer_background_get_id(bg_layer_id);
    if (bg_element_id != -1) {
        var zone_bg_sprite = -1;
        if (global.current_zone == 2) zone_bg_sprite = spr_zone2_bg;
        else if (global.current_zone == 3) zone_bg_sprite = spr_zone3_bg;
        
        layer_background_sprite(bg_element_id, zone_bg_sprite);
        
        if (zone_bg_sprite != -1) {
            var bg_scale = room_height / sprite_get_height(zone_bg_sprite);
            layer_background_xscale(bg_element_id, bg_scale);
            layer_background_yscale(bg_element_id, bg_scale);
            layer_background_htiled(bg_element_id, true);
            layer_background_vtiled(bg_element_id, false);
        }
    }
}

if (global.game_mode == "zone") {
    if (!global.zone_complete) {
        global.zone_timer++;
        
        // Debug: skip 50 seconds of the current zone when pressing J
        if (keyboard_check_pressed(ord("J"))) {
            global.zone_timer += 50 * 60;
        }
        
        var zone_duration = get_zone_duration(global.current_zone) * 60; // convert to frames
        
        if (global.zone_timer >= zone_duration) {
            global.zone_complete = true;
            award_pearls();
            room_goto(rm_zone_complete);
        }
    }
} else if (global.game_mode == "infinity") {
    global.score_timer++;
    if (global.score_timer >= global.score_increment_cooldown) {
        global.score += 1;
        global.score_timer = 0;
    }
}

spawn_timer++;

if (spawn_timer >= spawn_interval) {
    spawn_timer = 0;
    
    // Spawn a pearl every 30 obstacle spawns
    spawn_counter++;
    var chosen;
    if (spawn_counter >= 30) {
        chosen = obj_pearl;
        spawn_counter = 0;
    } else {
        if (global.game_mode == "infinity") {
            var obstacle_types = [obj_rock, obj_plastic_bag, obj_bottle, obj_toxic_bubble];
            chosen = obstacle_types[irandom(array_length(obstacle_types) - 1)];
        } else {
            if (global.current_zone == 2) {
                chosen = obj_rock;
            } else {
                var obstacle_types = [obj_plastic_bag, obj_bottle, obj_toxic_bubble];
                chosen = obstacle_types[irandom(array_length(obstacle_types) - 1)];
            }
        }
    }
    
    // Rocks sit on the ocean floor; other obstacles use random height with vertical gap
    var new_y;
    if (chosen == obj_rock) {
        new_y = room_height - sprite_get_bbox_bottom(spr_rock_2);
    } else {
        var tries = 0;
        do {
            new_y = irandom_range(40, room_height - 40);
            tries++;
        } until (abs(new_y - last_spawn_y) >= min_gap || tries > 10);
    }
    last_spawn_y = new_y;
    
    var new_obs = instance_create_layer(room_width + 32, new_y, "Instances", chosen);
    if (chosen != obj_pearl) new_obs.spd = obstacle_speed;
    else new_obs.spd = obstacle_speed;
}

if (global.game_mode == "infinity") {
    zone = 0;
} else {
    zone = global.current_zone;
}
set_difficulty();