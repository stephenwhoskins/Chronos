/// @description Insert description here
// You can write your code in this editor

var bbox_left_offset = 78;
var bbox_bottom_offset = shadow_offset;

if (sprite_index == sprite_dragon_attacking_2)
{
	bbox_left_offset -= 13;
}

if (sprite_index == sprite_dragon_dead)
{
	bbox_bottom_offset = -10;
}

draw_set_color(c_black);
draw_set_alpha(.5)
draw_ellipse(bbox_left + bbox_left_offset, bbox_bottom + bbox_bottom_offset, bbox_right - bbox_left_offset, bbox_bottom + 20 + bbox_bottom_offset, false)
draw_set_alpha(1);
draw_set_color(c_white);

if (death_count < max_death_count)
{
	if (floor(death_count / 2) % 2 == 0)
	{
		draw_self();
	}
	
	return;
}

if (hurt_count < max_hurt_count &&
	floor(hurt_count / 2) % 2 == 0)
{
	draw_self();
}
else if (hurt_count == max_hurt_count)
{
	draw_self();
}