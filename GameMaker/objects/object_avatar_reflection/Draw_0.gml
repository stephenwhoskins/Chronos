/// @description Insert description here
// You can write your code in this editor
if (room == Room4)
{
	var new_height = abs(sprite_height);
	var new_y = y + new_height;
	var new_top = 0;
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y + 16, object_invisible_barrier, _list, false);
	
	for (var i = 0; i < _num; ++i)
	{
		var instance_barrier = _list[| i];
		
		if (new_y > instance_barrier.y - instance_barrier.sprite_height / 2)
		{
			new_top = new_y - instance_barrier.y + instance_barrier.sprite_height / 2;
		}
	}
	
	ds_list_destroy(_list);
	new_y -= new_top;

	draw_sprite_part_ext(sprite_index, image_index, 0, new_top, abs(sprite_width), new_height, x - 13 * image_xscale, new_y, image_xscale, image_yscale, c_white, 0.5);
}
else
{
	draw_self();
}