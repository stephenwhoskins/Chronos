/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(.5)
draw_ellipse(bbox_left, bbox_bottom - 3, bbox_right - 1, bbox_bottom + 2, false)
draw_set_alpha(1);
draw_set_color(c_white);

if ((hurt_count < max_hurt_count && floor(hurt_count / 2) % 2 == 0) ||
	hurt_count == max_hurt_count ||
	sprite_index == sprite_avatar_shocked ||
	sprite_index == sprite_avatar_shocked_2
)
{
	draw_self();
}