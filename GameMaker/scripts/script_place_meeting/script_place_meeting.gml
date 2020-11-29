// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_place_meeting(x, y)
{
	if (position_meeting(x - 7, y, object_barrier))
	{
		return true;
	}
	if (position_meeting(x + 7, y, object_barrier))
	{
		return true;
	}
	if (position_meeting(x - 7, y - 12, object_barrier))
	{
		return true;
	}
	if (position_meeting(x + 7, y - 12, object_barrier))
	{
		return true;
	}
	
	return false;
}