/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprite_centipede_head_dying)
{
	// boss logic here
	if (is_boss)
	{
		audio_stop_sound(object_music_player.sound);
		instance_create_depth(x, y - view_hport[0], depth - 2, object_centipede_key);
	}
	
	image_alpha = 0;
	image_speed = 0; // need to stop animation or this event will happen again
}