/// @description Insert description here
// You can write your code in this editor

if (hurt_count == 0)
	//instance_destroy();
	hurt_count = max_hurt_count

if (state == jelly_state.jelly_shocking)
{
	if (sprite_index == sprite_jelly_shocking)
	{
		sprite_index = sprite_jelly_idle;
		image_index = 0;
	}
	else
	{
		sprite_index = sprite_jelly_shocking
		image_index = 0;
	}
	if (state_count == max_shocking_count)
	{
		spd = init_speed;
		dir = random_range(0, 2 * pi);
		state = jelly_state.jelly_idle;
		state_count = 0;
	}
}
else
{
	sprite_index = sprite_jelly_idle;
	if (state_count == max_idle_count)
	{
		spd = 0;
		state = jelly_state.jelly_shocking;
		state_count = 0;
	}
}

dx = spd * cos(dir);
dy = spd * sin(dir);

if (place_meeting(x + dx, y + dy, object_avatar))
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
else
{
	if (!place_meeting(x + dx, y, object_barrier))
	{
		x += dx;
	}
	if (!place_meeting(x, y + dy, object_barrier))
	{
		y += dy;
	}
}


state_count++;