/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprite_centipede_head_dying)
{
	// boss logic here
	if (image_xscale > 1.5)
	{
		object_bottom_wall_closing_tropics.locked = false;
		silence_count = 0; // reinitialize the background music
	}
	
	image_alpha = 0;
	image_speed = 0; // need to stop animation or this event will happen again
}