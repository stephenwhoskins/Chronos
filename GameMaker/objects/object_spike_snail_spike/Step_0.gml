/// @description Insert description here
// You can write your code in this editor
var dir_norm = direction % 90;
if (abs(dir_norm - 45) < 22.5)
{
	sprite_index = sprite_spike_snail_spike_1;
}
else
{
	sprite_index = sprite_spike_snail_spike_0;
}
if (rx != script_get_room_col(self) || ry != script_get_room_row(self))
{
	instance_destroy();
}