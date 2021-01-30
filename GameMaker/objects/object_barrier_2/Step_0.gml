/// @description Insert description here
// You can write your code in this editor

if (global.water_drained && room == Room2 &&
sprite_index != draining_sprite && sprite_index != drained_sprite && floor(image_index) == 0)
{
	sprite_index = draining_sprite;
	
	if (global.shake_count == global.max_shake_count)
	{
		global.shake_count = 0;
	}
}
else if (global.water_drained && room == Room2 &&
sprite_index != draining_sprite && sprite_index != drained_sprite &&
global.shake_count == global.max_shake_count)
{
	global.shake_count = 0;
}