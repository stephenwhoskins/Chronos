/// @description Insert description here
// You can write your code in this editor

if (last_image_index != floor(image_index) && floor(image_index) == 1)
{
	x += 2 * image_xscale;
	
	if (abs(x - orig_x) > max_x_offset)
	{
		image_xscale = -image_xscale;
	}
}

show_debug_message("x: " + string(x));
last_image_index = floor(image_index);