// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_place_meeting(x, y)
{
	var x_offset = 6;
	
	if (image_xscale < 0)
	{
		x_offset = 7;
	}

	var instance_barrier = instance_position(x - x_offset, y + 2, object_barrier)
	if (instance_barrier != noone)
	{
		if (instance_barrier.solid)
			return true;
	}
	instance_barrier = instance_position(x + x_offset, y + 2, object_barrier)
	if (instance_barrier != noone)
	{
		if (instance_barrier.solid)
			return true;
	}
	instance_barrier = instance_position(x - x_offset, y - 4, object_barrier)
	if (instance_barrier != noone)
	{
		if (instance_barrier.solid)
			return true;
	}
	instance_barrier = instance_position(x + x_offset, y - 4, object_barrier)
	if (instance_barrier != noone)
	{
		if (instance_barrier.solid)
			return true;
	}
	
	return false;
}