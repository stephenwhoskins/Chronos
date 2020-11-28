// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_moving_block_meeting(x, y)
{
	if (position_meeting(x - 7, y, object_moving_block))
	{
		return true;
	}
	if (position_meeting(x + 7, y, object_moving_block))
	{
		return true;
	}
	if (position_meeting(x - 7, y - 12, object_moving_block))
	{
		return true;
	}
	if (position_meeting(x + 7, y - 12, object_moving_block))
	{
		return true;
	}
	
	return false;
}