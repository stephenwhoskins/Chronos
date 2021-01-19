/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_black);
draw_set_alpha(.5)
if (floor(image_index) == 0)
{
	if (image_xscale > 0)
	{
		draw_ellipse(bbox_left, bbox_bottom - 3, bbox_right - 2, bbox_bottom + 2, false);
	}
	else
	{
		draw_ellipse(bbox_right - 1, bbox_bottom - 3, bbox_left + 1, bbox_bottom + 2, false);
	}
}
else
{
	if (image_xscale > 0)
	{
		draw_ellipse(bbox_left + 2, bbox_bottom - 3, bbox_right - 4, bbox_bottom + 2, false);
	}
	else
	{
		draw_ellipse(bbox_right - 3, bbox_bottom - 3, bbox_left + 3, bbox_bottom + 2, false);
	}
}
draw_set_alpha(1);
draw_set_color(c_white);

if (hurt_count < max_hurt_count &&
	floor(hurt_count / 2) % 2 == 0)
{
	draw_self();
}
else if (hurt_count == max_hurt_count)
{
	draw_self();
	if (tink_count < 5 && tink_count > 0)
	{
		draw_sprite(sprite_sword_sparks, 0, x, bbox_top);
	}
}