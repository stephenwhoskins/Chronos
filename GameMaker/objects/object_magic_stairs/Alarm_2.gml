/// @description Insert description here
// You can write your code in this editor

object_music_player.played = false;
object_music_player.loop_begin_time = 0.0;
object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
object_music_player.sound = audio_play_sound(sound_bgm_1, 10, true);