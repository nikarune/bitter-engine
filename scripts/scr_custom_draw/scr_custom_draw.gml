/*
global.text_draw_color = ds_list_create();

ds_list_add(
	global.text_draw_color,
	
	draw_get_color(),
	draw_get_color(),
	draw_get_color(),
	draw_get_color(),
);

function text_set_draw_color(_c) {
	
	if (!is_array(_c)) {
		
		for (var i = 0; i < ds_list_size(global.text_draw_color); i++) {
			ds_list_set(global.text_draw_color, i, _c);
		}
		
	}
	
	else {
	
		for (var i = 0; i < ds_list_size(global.text_draw_color); i++) {
		
			if (i < array_length(_c)) {
				ds_list_set(global.text_draw_color, i, _c[i]);
			}
		
			else {
				ds_list_set(global.text_draw_color, i, draw_get_color());	
			}
		
		}
		
	}
	
}

function text_reset_draw_color() {
	
	for (var i = 0; i < ds_list_size(global.text_draw_color); i++) {
		ds_list_set(global.text_draw_color, i, draw_get_color());
	}
}