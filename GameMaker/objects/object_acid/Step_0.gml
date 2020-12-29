/// @description Insert description here
// You can write your code in this editor

if (animation_count == 0)
{
	image_index = 0;
	x -= 3;
	y -= 3;
}
else if (animation_count == max_animation_count / 2)
{
	image_index = 1;
}

//animation_count = (animation_count + 1) % max_animation_count;