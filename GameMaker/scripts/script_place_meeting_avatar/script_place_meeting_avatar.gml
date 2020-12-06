// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_place_meeting_avatar(x, y)
{
	if (position_meeting(object_avatar.x - 7 - x, object_avatar.y - y, self))
	{
		return true;
	}
	if (position_meeting(object_avatar.x + 7 - x, object_avatar.y - y, self))
	{
		return true;
	}
	if (position_meeting(object_avatar.x - 7 - x, object_avatar.y - 12 - y, self))
	{
		return true;
	}
	if (position_meeting(object_avatar.x + 7 - x, object_avatar.y - 12 - y, self))
	{
		return true;
	}
	
	return false;
}