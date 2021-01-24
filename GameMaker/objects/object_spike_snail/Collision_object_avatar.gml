/// @description Insert description here
// You can write your code in this editor

// Handle avatar collision here.
if (other.hurt_count == other.max_hurt_count)
{
	global.health_level = max(global.health_level - 1, 0);
	other.hurt_count = 0;
				
	// If avatar is to the left
	if (other.x < x)
	{
		other.bounce_direction = -1;
	}
	else
	{
		other.bounce_direction = 1;
	}
}