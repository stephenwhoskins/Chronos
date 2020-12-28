// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_place_meeting(x, y)
{
	var x_offset = 6;
	
	if (image_xscale < 0)
	{
		x_offset = 7;
	}
	
	if (position_meeting(x - x_offset, y, object_barrier))
	{
		return true;
	}
	if (position_meeting(x + x_offset, y, object_barrier))
	{
		return true;
	}
	if (position_meeting(x - x_offset, y - 12, object_barrier))
	{
		return true;
	}
	if (position_meeting(x + x_offset, y - 12, object_barrier))
	{
		return true;
	}
	
	return false;
}