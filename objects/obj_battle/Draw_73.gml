// Main Selection
var _menux = party_units[select].x + BATTLE_MENU_XOFFSET;
var _menuy = party_units[select].y + BATTLE_MENU_YOFFSET;

menu_image_index = menu_image_index mod sprite_get_number(menu_spr);
menu_image_index += sprite_get_speed(menu_spr) / FPS;

draw_sprite_stretched(menu_spr, menu_image_index, _menux, _menuy, menu_width, menu_height);

if (menu_layer == 0) {
	
	menu_height = sprite_get_height(menu_spr);
	menu_width = sprite_get_width(menu_spr);
	
	var _button_line_x = _menux + BATTLE_MENU_BUTTON_MARGIN;
	var _button_line_y = _menuy + sprite_get_height(menu_spr) / 2;
	var _button_line_w = sprite_get_width(menu_spr) - (BATTLE_MENU_BUTTON_MARGIN * 2);

	for (var i = 0; i < array_length(buttons); i++) {

		var _button_spr = buttons[i];
		var _button_x = _button_line_x + ((_button_line_w / (array_length(buttons) - 1)) * i);
		var _button_y = _button_line_y;
	
		draw_sprite(_button_spr, 0, _button_x, _button_y);
	
	}
	
}

// Submenu (actions menu)
else if (menu_layer == 1) {
	
	for (var i = 0; i < array_length(encounter_type.actions); i++) {
		
		var _action = encounter_type.actions[i]
		var _action_name = _action.name;
		var _action_desc = _action.description;
		
		var _text_chunk_width = sprite_get_width(menu_spr) - (BATTLE_MENU_TEXT_MARGIN * 2);
		var _text_chunk_height = BATTLE_MENU_TEXT_NAME_SEP + (BATTLE_MENU_TEXT_DESC_SEP + string_height_ext(_action_desc, BATTLE_MENU_TEXT_DESC_SEP, _text_chunk_width));
		
		var _namex = _menux + BATTLE_MENU_TEXT_MARGIN;
		var _namey = _menuy + BATTLE_MENU_TEXT_MARGIN + (_text_chunk_height * i);
		var _descx = _namex;
		var _descy = _namey + BATTLE_MENU_TEXT_NAME_SEP
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		draw_set_font(fn_main);
		draw_set_color(c_white);
		
		draw_text(_namex, _namey, _action_name);
		
		draw_set_font(fn_main_1);
		draw_set_color(c_grey);
		
		draw_text_ext(_descx, _descy, _action_desc, BATTLE_MENU_TEXT_DESC_SEP, _text_chunk_width);
		
		menu_height = (_text_chunk_width * i) + BATTLE_MENU_TEXT_MARGIN;
		
	}
	
}

draw_sprite(partym_get_sprite(global.party_names[select], "battle_nametag"), 0, _menux, _menuy);