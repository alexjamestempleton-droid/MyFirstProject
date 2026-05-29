// Move left across the screen
x -= spd;

// Collect pearl
if (place_meeting(x, y, obj_fish)) {
    collect_pearl();
    instance_destroy();
    exit;
}

// Destroy when off screen
if (x < -64) {
    instance_destroy();
}
