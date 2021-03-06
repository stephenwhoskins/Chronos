/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprite_centipede_segment_dying)
	return;

// Handle collisions with avatar.
if (place_meeting(x, y, object_avatar))
{
	if (object_avatar.hurt_count == object_avatar.max_hurt_count)
	{
		global.health_level = max(global.health_level - 1, 0);
		object_avatar.hurt_count = 0;
			
		// If avatar is to the left.
		if (object_avatar.x < x)
		{
			object_avatar.bounce_direction = -1;
		}
		else
		{
			object_avatar.bounce_direction = 1;
		}
	}
}

image_index = image_number * animation_count / max_animation_count;

animation_count = (animation_count + 1) % max_animation_count;