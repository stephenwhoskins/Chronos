/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprite_angel_dying)
{
	if (is_boss)
	{
		script_timey_death_sequence();
	}
	instance_destroy();
}