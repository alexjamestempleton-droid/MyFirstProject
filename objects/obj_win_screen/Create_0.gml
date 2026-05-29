input_delay = 150; // 2.5 seconds
timer = 0;

// Celebration animation
alpha = 0;
bubble_list = ds_list_create();

// Spawn decorative bubbles
for (var i = 0; i < 20; i++) {
    ds_list_add(bubble_list, [
        irandom(room_width),        // x
        room_height + irandom(200), // y (start below screen)
        1 + random(3),              // speed
        4 + irandom(12)             // size
    ]);
}