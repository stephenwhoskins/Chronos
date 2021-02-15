/// @description Insert description here
// You can write your code in this editor

if (hurt_count == 0 && (hit_type == hit_types.sword || hit_type == hit_types.arrow))
{
	hurt_count = max_hurt_count;
	
	if (tink_count == max_tink_count)
	{
		audio_play_sound(sound_tink, 10, false);
		tink_count = 0;
	}
}

if (last_image_index != floor(image_index) && floor(image_index) == 1 && sprite_index == sprite_spike_snail_walking)
{
	x += 2 * image_xscale;
	
	if (abs(x - orig_x) > max_x_offset)
	{
		image_xscale = -image_xscale;
	}
}


if (hurt_count == 0 && sprite_index != sprite_spike_snail_dying)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_spike_snail_dying;
		if (respawn == 0 && random(100) < 33)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_spike_snail_dying)
{
	hurt_count = max_hurt_count;
}

if (hurt_count < max_hurt_count)
	hurt_count += 1;
	
if (is_boss && shoot_count >= max_shoot_count && last_image_index != floor(image_index) && floor(image_index) == 1)
{
	sprite_index = sprite_spike_snail_attacking;
	var num_shoot = 5;
	var start_angle = 0;
	var angle_increment = 45;
	for (var i = 0; i < num_shoot; i++)
	{
		var shot = instance_create_depth(x, y, depth, object_spike_snail_spike);
		shot.direction = start_angle + i * angle_increment;
		shot.image_xscale = abs(image_xscale);
		shot.image_yscale = abs(image_yscale);
	}
}
else
{
	shoot_count++;
}

last_image_index = floor(image_index);

tink_count = min(tink_count + 1, max_tink_count);