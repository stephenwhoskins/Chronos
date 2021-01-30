/// @description Insert description here
// You can write your code in this editor
if (other.hurt_count == other.max_hurt_count)
{
	global.health_level = max(global.health_level - 1, 0);
	other.hurt_count = 0;
		
	// If arrow is flying to the left, bounce avatar to the left.
	if (hspeed < x)
	{
		other.bounce_direction = -1;
	}
	// If arrow is flying to the right, bounce avatar to the right.
	else
	{
		other.bounce_direction = 1;
	}
}
instance_destroy(self);