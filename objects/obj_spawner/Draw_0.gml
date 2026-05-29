// Base ocean fill for zones without a dedicated background sprite
var zone_bg = -1;
if (global.current_zone == 2) zone_bg = spr_zone2_bg;
else if (global.current_zone == 3) zone_bg = spr_zone3_bg;

if (zone_bg == -1) {
    draw_set_alpha(1.0);
    draw_set_color(make_color_rgb(0, 20, 45));
    draw_rectangle(0, 0, room_width, room_height, false);
}

draw_set_color(c_white);
