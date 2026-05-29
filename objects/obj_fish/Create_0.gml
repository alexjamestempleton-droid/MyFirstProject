// Movement
vsp = 0;          // vertical speed
move_speed = 4;   // how fast the fish moves up/down

// Current and Drift
current_strength = 1.5; // force pushing the fish right in zone 2
current_drift_x = 0;    // accumulated drift in x direction
current_drift_y = 0;    // accumulated drift in y direction
drift_change_timer = 0;
drift_change_interval = 30; // change drift direction every 30 frames

// Health
health_max = 100;
health = health_max;

// Invincibility frames (so you don't lose health every single frame on hit)
inv_frames = 0;
inv_duration = 90; // 1.5 seconds at 60fps

// State
alive = true;