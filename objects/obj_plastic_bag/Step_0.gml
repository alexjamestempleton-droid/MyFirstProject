// Move left across the screen
x -= spd;

// Destroy when off screen
if (x < -64) {
    instance_destroy();
}