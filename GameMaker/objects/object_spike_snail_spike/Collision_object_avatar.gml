/// @description Insert description here
// You can write your code in this editor
if (other.hurt_count == other.max_hurt_count)
{
	global.health_level = max(global.health_level - 1, 0);
	other.hurt_count = 0;
	other.bounce_direction = 0;
}