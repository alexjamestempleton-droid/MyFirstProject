// Move left across the screen at a steady pace
if (!fading) 
{
    x -= spd;
}

// Destroy when off screen
if (x < -64) 
{
    instance_destroy();
}

// Store the specific fish being hit, if any
var _fish = instance_place(x, y, obj_fish);

// Fade and destroy on contact with fish
if (_fish != noone) 
{
    if (!fading) 
    {
        fading = true;
        x -= spd; // Push rock past fish so it stops overlapping
        
        // Deal damage specifically to the colliding fish
        with (_fish) 
        {
            health -= 30;
            if (health <= 0) 
            {
                health = 0;
                alive = false;
                room_goto(rm_death);
            }
        }
    }
    
    // Fade out
    image_alpha -= fade_speed;
    if (image_alpha <= 0) 
    {
        instance_destroy();
    }
} 
else 
{
    image_alpha = 1.0;
}
