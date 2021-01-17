/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_alpha(.5)
draw_ellipse(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 5, false)
draw_set_alpha(1);
draw_set_color(c_white);

draw_self();