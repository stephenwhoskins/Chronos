/// @description Insert description here
// You can write your code in this editor

if (script_get_room_index(object_avatar) == self_room_index && !avatar_present)
{
	audio_stop_all();
	object_music_player.sound = audio_play_sound(sound_dragon, 10, true);
	object_music_player.played = false;
	object_music_player.loop_begin_time = 14.925;
	object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
	
	dragon_state = dragon_states.introduction;
	
	avatar_present = true;
}
else if (script_get_room_index(object_avatar) != script_get_room_index(self) && avatar_present)
{
	avatar_present = false;
}

switch (dragon_state)
{
	case dragon_states.idle:
		break;
	case dragon_states.introduction:
		y++;
		if (y == orig_y)
		{
			dragon_state = dragon_states.flying_eight_pattern;
		}
		break;
}

if (hurt_count == 0 && sprite_index != sprite_dragon_attacking_2)
{
	health_level = max(health_level - 1, 0);
	
	if (health_level == 0)
	{
		sprite_index = sprite_dragon_attacking_2;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_dragon_attacking_2)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);