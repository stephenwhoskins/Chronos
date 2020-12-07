/// @description Insert description here
// You can write your code in this editor

state_count = (state_count + 1) % max_state_count;

if (state_count == 0)
{
	if (sprite_index == sprite_jelly_shocking)
	{
		sprite_index = sprite_jelly_idle;
	}
	else
	{
		sprite_index = sprite_jelly_shocking
	}
}