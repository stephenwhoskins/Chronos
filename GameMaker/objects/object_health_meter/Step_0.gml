/// @description Insert description here
// You can write your code in this editor

initialize_count = min(initialize_count + 1, max_initialize_count);

if (initialize_count % init_segment_count == 0)
{
	num_displayed++;
	audio_play_sound(sound_health_meter, 10, false);
}