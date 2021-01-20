/// @description Insert description here
// You can write your code in this editor

if (health_level > 0)
{
	sprite_index = sprite_angel_firing;

	instance_arrow = instance_create_depth(bbox_right + 10, y + 4, depth - 1, object_angel_arrow);
	instance_arrow.hspeed = image_xscale * 1;
	instance_arrow.image_xscale = image_xscale;
	instance_arrow.image_yscale = -1;
	instance_arrow.image_angle = -image_xscale * 90;
	if (image_xscale < 0)
	{
		instance_arrow.x = bbox_left - 10;
	}

	alarm[1] = room_speed;
}