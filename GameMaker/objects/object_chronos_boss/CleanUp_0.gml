/// @description Insert description here
// You can write your code in this editor

for (var i = instance_number(object_angel_minion) - 1; i > -1; i--)
{
	var angel_instance = instance_find(object_angel_minion, i);
	instance_destroy(angel_instance.id);
}