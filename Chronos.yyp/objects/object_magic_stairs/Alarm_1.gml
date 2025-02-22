/// @description Insert description here
// You can write your code in this editor

audio_play_sound(sound_door_closed, 10, false);
object_magic_left_wall_closed.x = 0;
object_magic_left_wall_closed.y = 0;
object_magic_left_wall_closed.image_alpha = 0;
object_magic_left_wall_closed.solid = false;
alarm[2] = room_speed;