/// @description Insert description here
// You can write your code in this editor

// Set to 1 to properly check for collisions (set back to 0 later if necessary)
image_yscale = 1;

if (script_get_room_index(self) == script_get_room_index(object_avatar) &&
!place_meeting(x, y - 2, object_avatar) &&
!closed &&
locked &&
extra_delay_count == max_extra_delay_count)
{
	image_alpha = 1;
	solid = true;
	closed = true;
	audio_play_sound(sound_door_closed, 10, false);
}
else if (!locked && closed)
{
	image_alpha = 0;
	solid = false;
	closed = false;
	audio_play_sound(sound_door_closed, 10, false);
}

if (!closed)
{
	image_yscale = 0;
}

extra_delay_count = min(extra_delay_count + 1, max_extra_delay_count);