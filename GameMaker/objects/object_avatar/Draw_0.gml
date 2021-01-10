/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(.5)
draw_ellipse(bbox_left, bbox_bottom - 3, bbox_right, bbox_bottom + 2, false)
draw_set_alpha(1);
draw_set_color(c_white);
if ((hurt_count < max_hurt_count || sprite_index == sprite_avatar_dead) &&
	floor(hurt_count / 2) % 2 == 0)
{
	draw_self();
}
else if (hurt_count == max_hurt_count && sprite_index != sprite_avatar_dead)
{
	draw_self();
}
	