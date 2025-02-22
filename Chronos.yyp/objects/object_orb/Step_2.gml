/// @description Insert description here
// You can write your code in this editor

// Update orb location.
if (!firing)
{
	x = rotation_radius * cos(2 * pi * orb_rotation_count / max_orb_rotation_count) + orig_x;
	y = -rotation_radius * sin(2 * pi * orb_rotation_count / max_orb_rotation_count) + orig_y;

	orb_rotation_count = (orb_rotation_count + 1) % max_orb_rotation_count;
}
else if (speed != 2)
{
	direction = 360.0 * orb_rotation_count / max_orb_rotation_count;
	speed = 2;
	alarm[0] = 4 * room_speed;
}

// Cause damage to the avatar.
if (place_meeting(x, y, object_avatar))
{
	if (object_avatar.hurt_count == object_avatar.max_hurt_count)
	{
		global.health_level = max(global.health_level - 1, 0);
		object_avatar.hurt_count = 0;
				
		// If avatar is to the left
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