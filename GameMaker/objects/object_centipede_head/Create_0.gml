/// @description Insert description here
// You can write your code in this editor

pattern_1 = true;
image_angle = 270;

num_body_segments = 8;
max_hurt_count = 999999;
hurt_count = 0;
orig_x = x;
orig_y = y;
max_x = 32;
max_y = 48;
x_velocity = 0;
y_velocity = 8;

max_update_count = 4;
update_count = 0;

health_level = 3;
max_hurt_count = 30;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;

for (i = num_body_segments - 1; i > -1; i--)
{
	// body segments destroy themselves once they've died
	instance_body_segments[i] = instance_create_depth(x, y, depth + 1, object_centipede_segment);
	instance_body_segments[i].head = self;
	instance_body_segments[i].animation_count = (2 * i) % instance_body_segments[i].max_animation_count;
}

max_silence_count = 120;
silence_count = 0;

if (image_yscale > 1.5)
{
	max_x = 8;
	max_y = 32;
	health_level = 15;
}