/// @description Insert description here
// You can write your code in this editor

var y_offset = 2.0 * sin(2.0 * pi * float_count / max_float_count);

float_count = (float_count + 1) % max_float_count;

y = orig_y + y_offset;

if (death_count < max_death_count)
{
	if (death_count > 2 * max_death_count / 3)
	{
		sprite_index = sprite_timey_dead;
	}
	if (death_count > max_death_count / 3)
	{
		if (global.shake_count == global.max_shake_count)
		{
			global.shake_count = 0;
			sprite_index = sprite_timey_dying;
		}
		
		if (death_count == max_death_count / 3 + 1)
		{
			object_music_player.sound = audio_play_sound(sound_rumble, 10, true);
		}
	}
	
	death_count = min(death_count + 1, max_death_count);
	
	if (death_count == max_death_count - object_fade_out.max_fade_count)
	{
		object_fade_out.room_id = EndCutscene;
	}
}

if (time_warp_count < max_time_warp_count)
{
	if (time_warp_count > max_time_warp_count / 2)
	{
		if (global.shake_count == global.max_shake_count)
		{
			global.shake_count = 0;
			sprite_index = sprite_timey_time_warping;
		}
	}
	
	time_warp_count = min(time_warp_count + 1, max_time_warp_count);
	
	if (time_warp_count == max_time_warp_count)
	{
		global.health_level = 5;
		global.key_count = 0;
		global.time_stopped = false;
		room_goto(Room1);
	}
}