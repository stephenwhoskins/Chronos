/// @description Insert description here
// You can write your code in this editor
if (script_get_room_index(self) == script_get_room_index(object_avatar) &&
!place_meeting(x, y, object_avatar) &&
!closed &&
extra_delay_count == max_extra_delay_count)
{
	image_alpha = 1;
	solid = true;
	closed = true;
	audio_play_sound(sound_door_closed, 10, false);
}

extra_delay_count = min(extra_delay_count + 1, max_extra_delay_count);