// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_place_meeting_avatar(x, y)
{
	var x_offset = 6;
	
	if (object_avatar.image_xscale < 0)
	{
		x_offset = 7;
	}
	
	if (position_meeting(object_avatar.x - x_offset - x, object_avatar.y + 2 - y, self))
	{
		return true;
	}
	if (position_meeting(object_avatar.x + x_offset - x, object_avatar.y + 2 - y, self))
	{
		return true;
	}
	if (position_meeting(object_avatar.x - x_offset - x, object_avatar.y - 4 - y, self))
	{
		return true;
	}
	if (position_meeting(object_avatar.x + x_offset - x, object_avatar.y - 4 - y, self))
	{
		return true;
	}
	
	return false;
}