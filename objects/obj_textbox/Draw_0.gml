var _textbox_x = CAM_X + textbox_x;
var _textbox_y = CAM_Y + textbox_y;

var _text_x = CAM_X + text_x;
var _text_y = CAM_Y + text_y;

// Draw init
draw_set_font(text_font);
draw_set_color(c_white);

// Draw stuff
draw_sprite_stretched(textbox_sprite, 0, _textbox_x, _textbox_y, textbox_width, textbox_height);

draw_text_dbox(_text_x, _text_y, global.dialogue_pages[page], typing_progress, text_line_width, text_line_sep);