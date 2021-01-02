/// @description Insert description here
// You can write your code in this editor
if (other.hurt_count == other.max_hurt_count)
{
	global.health_level = global.health_level - 1;
	other.hurt_count = 0
	
	if (other.x < x)
	{
		other.bounce_direction = -1;
	}
	else
	{
		other.bounce_direction = 1;
	}
}