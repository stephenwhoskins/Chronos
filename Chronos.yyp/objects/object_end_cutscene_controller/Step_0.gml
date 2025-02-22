/// @description Insert description here
// You can write your code in this editor

// Bring our hero into view, standing on a mountain top.
var lay_id = layer_get_id("Assets_1");
if (layer_get_x(lay_id) != 136)
{
	layer_x(lay_id, layer_get_x(lay_id) + 1);
}

// Bring the tower into view.
lay_id = layer_get_id("Assets_2");
if (tower_layer_x != -136)
{
	tower_layer_x = tower_layer_x - 1;
	layer_x(lay_id, tower_layer_x + shake_offset);
	
}
// Have the tower collapse.
else if (pause_count == max_pause_count)
{
	layer_x(lay_id, tower_layer_x + shake_offset);
	layer_y(lay_id, layer_get_y(lay_id) + 0.25);
}
// Watch the view for a bit.
else
{
	layer_x(lay_id, tower_layer_x + shake_offset);
	pause_count++;
}

shake_count = (shake_count + 1) % max_shake_count;

if (shake_count / 2 < 1)
{
	shake_offset = -0.5;
}
else
{
	shake_offset = 0.5;
}