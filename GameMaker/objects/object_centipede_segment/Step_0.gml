/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprite_centipede_head_dying)
	return;

image_index = image_number * animation_count / max_animation_count;

animation_count = (animation_count + 1) % max_animation_count;