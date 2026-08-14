function run_dialogue_command(_cmd) {
	
	var _cmd_index = _cmd[0];
	var _cmd_params = [];
	
	array_copy(_cmd_params, 0, _cmd, 1, array_length(_cmd) - 1);
	
	switch (_cmd_index) {
		
		// CLEAR COMMANDS (reset to defaults)
		case "clear":
		
			draw_set_font(fn_main);
			draw_set_color(c_white);
		
		break;
		
		// Color switching
		case "c":
			
			
			var _color_index = _cmd_params[0];
			var _color = global.color_library[$ _color_index];
			
			if (!struct_exists(global.color_library, _color_index)) {
				
				console_write($"Color \"{_color_index}\" not found. Setting to default.", CONSOLE_COLOR_ERROR);	
				_color = c_white;
				
			}
			
			draw_set_color(_color);
			
		break;
		
		// Font switching
		case "f":
		
			var _font = asset_get_index(_cmd_params[0]);
			
			if (_font == -1) {
				
				console_write("No font found. Setting to default.", CONSOLE_FONT_ERROR);
				draw_set_font(fn_main)
				
			}
			
			else {
				
				draw_set_font(_font);
					
			}
		
		break;
		
	}
	
}