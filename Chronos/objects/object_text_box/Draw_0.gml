/// @description Insert description here
// You can write your code in this editor
if (_new_char_frame_count == 0)
{
	if (_char_count == _max_char_count && _text_index != _num_text_indexes - 1)
	{
		if (_read_pause_count == _max_read_pause_count)
		{
			_text_index = (_text_index + 1) % _num_text_indexes;
			_char_count = -1;
			_max_char_count = string_length(_text[_text_index]);
			_read_pause_count = 0;
		}
		else
		{
			_read_pause_count++;
		}
	}
	
	_char_count = min(_char_count + 1, _max_char_count);
}
_new_char_frame_count = (_new_char_frame_count + 1) % _max_new_char_frame_count;

var _text_part = string_copy(_text[_text_index], 0, _char_count);

draw_set_font(font_dialogue);
draw_set_color(c_white);
draw_text(x + _left_padding, y + _top_padding, _text_part);