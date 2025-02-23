/// @description Insert description here
// You can write your code in this editor

if (global.displayed_credits)
{
	return;
}

// Draw "A Game by".
script_draw_intro_credits(sprite_a_game_by, animation_count,
a_game_by_start_time, a_game_by_end_time);

// Draw "Programming".
script_draw_intro_credits(sprite_programming, animation_count, programming_start_time, programming_end_time);

// Draw "Art by".
script_draw_intro_credits(sprite_art, animation_count, art_start_time, art_end_time);

// Draw "Music by".
script_draw_intro_credits(sprite_music_and_sound, animation_count,
music_and_sound_start_time, music_and_sound_end_time);

animation_count = min(animation_count + 1, max_animation_count);

if (animation_count == max_animation_count)
{
	global.displayed_credits = true;
}