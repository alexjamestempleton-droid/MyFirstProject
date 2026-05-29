// Background (place spr_splashscreentext in the room yourself — not drawn here)
if (sprite_exists(spr_splashscreen)) {
    draw_sprite_stretched(spr_splashscreen, 0, 0, 0, room_width, room_height);
}

draw_set_font(fnt_main);

// --- layout tuning (edit these) ---
var _panel_top = 175;       // start of menu/shop box (leave room for title in room)
var _panel_half_w = 200;
var _line_gap = 44;         // main menu line spacing
var _shop_row_h = 58;       // shop line spacing (bigger = more space)
var _shop_extra_h = 40;     // extra box height at bottom

var _cx = room_width * 0.5;
var _col_border = make_color_rgb(120, 190, 220);
var _col_fill = make_color_rgb(10, 28, 52);
var _col_accent = make_color_rgb(55, 130, 175);
var _col_muted = make_color_rgb(160, 185, 205);

if (!shop_open) {
    var _py1 = _panel_top;
    var _n = 4;
    var _py2 = _py1 + 22 + (_n * _line_gap) + 28;
    var _px1 = _cx - _panel_half_w;
    var _px2 = _cx + _panel_half_w;
    
    draw_set_alpha(0.88);
    draw_set_color(c_black);
    draw_rectangle(_px1 - 2, _py1 - 2, _px2 + 2, _py2 + 2, false);
    draw_set_alpha(0.92);
    draw_set_color(_col_fill);
    draw_rectangle(_px1, _py1, _px2, _py2, false);
    draw_set_alpha(1.0);
    draw_set_color(_col_accent);
    draw_rectangle(_px1, _py1, _px2, _py1 + 4, false);
    draw_set_color(_col_border);
    draw_rectangle(_px1, _py1, _px2, _py2, true);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var _options = ["ZONE MODE", "INFINITY MODE", "SHOP", "SETTINGS"];
    for (var i = 0; i < _n; i++) {
        if (i == selected) draw_set_color(c_yellow);
        else draw_set_color(c_white);
        draw_text(_cx, _py1 + 22 + (i * _line_gap), _options[i]);
    }
    
    draw_set_color(_col_muted);
    draw_text(_cx, _py2 + 14, "W/S or arrows  |  SPACE to select");
} else {
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1.0);
    
    var _sy1 = _panel_top;
    var _shop_h = 22 + 34 + 18 + (3 * _shop_row_h) + 52 + 30 + _shop_extra_h;
    var _sy2 = _sy1 + _shop_h;
    var _sx1 = _cx - _panel_half_w;
    var _sx2 = _cx + _panel_half_w;
    
    draw_set_alpha(0.88);
    draw_set_color(c_black);
    draw_rectangle(_sx1 - 2, _sy1 - 2, _sx2 + 2, _sy2 + 2, false);
    draw_set_alpha(0.92);
    draw_set_color(_col_fill);
    draw_rectangle(_sx1, _sy1, _sx2, _sy2, false);
    draw_set_alpha(1.0);
    draw_set_color(_col_accent);
    draw_rectangle(_sx1, _sy1, _sx2, _sy1 + 4, false);
    draw_set_color(_col_border);
    draw_rectangle(_sx1, _sy1, _sx2, _sy2, true);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    var _y = _sy1 + 22;
    draw_set_color(make_color_rgb(130, 220, 255));
    draw_text(_cx, _y, "POWER-UP SHOP");
    _y += 38;
    
    draw_set_color(make_color_rgb(50, 100, 140));
    draw_rectangle(_sx1 + 24, _y, _sx2 - 24, _y + 2, false);
    _y += 18;
    
    var _shop_items = ["SLOW TIME", "SONIC PULSE", "BACK"];
    var _shop_costs = ["5 pearls", "10 pearls", ""];
    for (var j = 0; j < 3; j++) {
        if (j == shop_selected) draw_set_color(c_yellow);
        else draw_set_color(c_white);
        var _line = _shop_items[j];
        if (_shop_costs[j] != "") _line += "  -  " + _shop_costs[j];
        draw_text(_cx, _y, _line);
        
        if (j < 2) {
            var _owned = (j == 0) ? global.powerup_slow_purchased : global.powerup_pulse_purchased;
            draw_set_color(_owned ? make_color_rgb(120, 255, 160) : make_color_rgb(150, 165, 180));
            draw_text(_cx, _y + 24, _owned ? "Owned" : "Not owned");
        }
        _y += _shop_row_h;
    }
    
    _y += 8;
    draw_set_color(make_color_rgb(50, 100, 140));
    draw_rectangle(_sx1 + 24, _y, _sx2 - 24, _y + 2, false);
    
    if (shop_message != "") {
        draw_set_color(c_yellow);
        draw_text_ext(_cx, _y + 14, shop_message, 20, (_panel_half_w * 2) - 40);
    }
    
    draw_set_color(_col_muted);
    draw_text(_cx, _sy2 - 36, "SPACE - buy/equip    ESC - close");
}

draw_pearl_hud();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1.0);
