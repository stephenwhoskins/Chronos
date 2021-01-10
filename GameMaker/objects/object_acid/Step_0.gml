/// @description Insert description here
// You can write your code in this editor

var move_offset = 4;
if (animation_count == max_animation_count / 2)
{
	image_index = 0;
	
	switch (floor(state))
	{
		case move_upper_left:
			x -= move_offset;
			y -= move_offset;
			break;
		case move_upper_right:
			x += move_offset;
			y -= move_offset;
			break;
		case move_lower_left:
			x -= move_offset;
			y += move_offset;
			break;
		case move_lower_right:
			x += move_offset;
			y += move_offset;
			break;
	}
	
	state = (state + 0.5) % max_states;
}
else if (animation_count == 0)
{
	switch (floor(state))
	{
		case move_upper_left:
			image_index = 1;
			break;
		case move_upper_right:
			image_index = 2;
			break;
		case move_lower_left:
			image_index = 3;
			break;
		case move_lower_right:
			image_index = 4;
			break;
	}
}

if (object_avatar.hurt_count == object_avatar.max_hurt_count && place_meeting(x, y, object_avatar))
{
	global.health_level--;
	object_avatar.hurt_count = 0;
}

animation_count = (animation_count + 1) % max_animation_count;