draw_set_color(c_white);
draw_set_font(fn_main);

for (var i = 0; i < array_length(global.console_text); i++) {
	
	var _text = global.console_text[i];
	
	draw_text(1, 1 + (16 * i), _text);
	
}