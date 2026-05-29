function save_game() {
    var save_path = game_save_id + "ocean_save.ini";
    
    ini_open(save_path);
    
    ini_write_real("stats", "high_score", global.high_score);
    ini_write_real("stats", "pearls", global.pearls);
    ini_write_real("stats", "current_zone", global.current_zone);
    ini_write_real("stats", "powerup_slow_purchased", global.powerup_slow_purchased ? 1 : 0);
    ini_write_real("stats", "powerup_pulse_purchased", global.powerup_pulse_purchased ? 1 : 0);
    ini_write_real("stats", "powerup_equipped", global.powerup_equipped);
    ini_write_real("audio", "volume", global.volume);
    ini_write_real("audio", "muted", global.muted);
    ini_write_real("meta", "save_version", 2);
    
    ini_close();
}

function load_game() {
    var save_path = game_save_id + "ocean_save.ini";
    
    if (file_exists(save_path)) {
        ini_open(save_path);
        
        global.high_score = ini_read_real("stats", "high_score", 0);
        global.pearls = ini_read_real("stats", "pearls", 0);
        global.current_zone = ini_read_real("stats", "current_zone", 1);
        global.powerup_slow_purchased = ini_read_real("stats", "powerup_slow_purchased", 0) == 1;
        global.powerup_pulse_purchased = ini_read_real("stats", "powerup_pulse_purchased", 0) == 1;
        global.powerup_equipped = ini_read_real("stats", "powerup_equipped", 0);
        global.volume = ini_read_real("audio", "volume", 1.0);
        global.muted = ini_read_real("audio", "muted", 0);
        
        var _save_ver = ini_read_real("meta", "save_version", 1);
        if (_save_ver < 2) {
            global.pearls = 0;
            ini_write_real("meta", "save_version", 2);
            ini_write_real("stats", "pearls", 0);
        }
        
        ini_close();
        
        if (_save_ver < 2) save_game();
    } else {
        global.pearls = 0;
        global.high_score = 0;
        global.current_zone = 1;
        global.powerup_slow_purchased = false;
        global.powerup_pulse_purchased = false;
        global.powerup_equipped = 0;
    }
}

/// @description Pick up one pearl in the world (only source of pearls).
function collect_pearl() {
    global.pearls += 1;
    global.pearls_this_zone += 1;
    save_game();
}

/// @description Top-right pearl icon + total count (menu and gameplay HUD).
function draw_pearl_hud() {
    if (!sprite_exists(spr_pearl)) exit;
    
    var _count_str = string(global.pearls);
    var _icon_sc = 0.11;
    var _pw = sprite_get_width(spr_pearl) * _icon_sc;
    var _ph = sprite_get_height(spr_pearl) * _icon_sc;
    var _pad = 14;
    
    draw_set_font(fnt_main);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    
    var _text_w = string_width(_count_str);
    var _box_w = _pw + _text_w + 22;
    var _box_h = max(_ph, 32) + 8;
    var _bx2 = room_width - _pad;
    var _bx1 = _bx2 - _box_w;
    var _by1 = _pad;
    var _cy = _by1 + _box_h * 0.5;
    
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(_bx1, _by1, _bx2, _by1 + _box_h, false);
    draw_set_alpha(1.0);
    draw_set_color(make_color_rgb(10, 28, 52));
    draw_rectangle(_bx1 + 2, _by1 + 2, _bx2 - 2, _by1 + _box_h - 2, false);
    draw_set_color(make_color_rgb(120, 190, 220));
    draw_rectangle(_bx1, _by1, _bx2, _by1 + _box_h, true);
    
    draw_sprite_ext(spr_pearl, 0, _bx1 + 10, _cy - _ph * 0.5, _icon_sc, _icon_sc, 0, c_white, 1);
    draw_set_color(c_white);
    draw_text(_bx1 + 14 + _pw, _cy, _count_str);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
