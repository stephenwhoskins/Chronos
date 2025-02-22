/// @description Insert description here
// You can write your code in this editor
if (_new_char_frame_count == 0 && _char_count != _max_char_count && !audio_is_playing(sound_chat) &&
fade_count == max_fade_count && fade_out_count == max_fade_count)
{
	audio_play_sound(sound_chat, 10, false);
}