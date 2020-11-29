/// @description Insert description here
// You can write your code in this editor

if (last_image_index != floor(image_index))
{
	if (script_get_room_index(object_avatar) == script_get_room_index(self) && image_speed < 0.2)
	{
		if (!audio_is_playing(sound_arrow))
		{
			audio_play_sound(sound_arrow, 10, false);
		}
	}
}

last_image_index = floor(image_index);