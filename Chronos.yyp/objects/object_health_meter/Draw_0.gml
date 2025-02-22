/// @description Insert description here
// You can write your code in this editor

var health_level = min(object_chronos_boss.health_level, num_displayed);
var camera_x = script_get_room_camera_x(x);
var camera_y = script_get_room_camera_y(y);
var health_meter_x = camera_x + view_wport[0] - 16;
var health_meter_y = camera_y + global.hud_height + 8 * max_health_level + 8;

if (health_level > 0)
{
	draw_set_color($ff2222);
	draw_rectangle(health_meter_x, health_meter_y - 8 * health_level + 8, health_meter_x + 7, health_meter_y + 8, false);
}

draw_set_color($88ffff);
for (var i = 0; i < health_level; i++)
{
	draw_rectangle(health_meter_x + 1, health_meter_y - 8 * i + 1, health_meter_x + 6, health_meter_y - 8 * i + 6, false);
}
draw_set_color(c_white);