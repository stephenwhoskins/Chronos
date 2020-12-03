/// @description Insert description here
// You can write your code in this editor

num_body_segments = 8;
max_hurt_count = 999999;
hurt_count = 0;
orig_x = x;
orig_y = y;
max_x = 64;
max_y = 64;
x_velocity = 8;
y_velocity = 8;

max_update_count = 4;
update_count = 0;

for (i = num_body_segments - 1; i > -1; i--)
{
	instance_body_segments[i] = instance_create_depth(x, y, depth + 1, object_python_segment);
	instance_body_segments[i].animation_count = (2 * i) % instance_body_segments[i].max_animation_count;
}