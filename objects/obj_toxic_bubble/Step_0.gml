// Move left across the screen
x -= spd;

// Pop when the fish touches it
if (place_meeting(x, y, obj_fish)) {
    instance_destroy();
    exit;
}

// Destroy when off screen
if (x < -64) {
    instance_destroy();
}