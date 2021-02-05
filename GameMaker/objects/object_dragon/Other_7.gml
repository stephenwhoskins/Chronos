/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprite_dragon_attacking_2)
{
	instance_create_depth(x, y, depth - 1, object_chronos_boss);
	instance_destroy();
}