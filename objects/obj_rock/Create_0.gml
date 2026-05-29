spd = 4; 

// Choose a random rock sprite
switch (irandom_range(1, 3)) {
    case 1: sprite_index = spr_rock_1; break;
    case 2: sprite_index = spr_rock_2; break;
    case 3: sprite_index = spr_rock_3; break;
}
// Align bottom of rock with the ocean floor (sprites use top-left origin)
y = room_height - sprite_get_bbox_bottom(sprite_index);
image_speed = 0;
touching = false;

// Fade and destroy
fading = false;
fade_speed = 0.05; // how fast the rock fades
