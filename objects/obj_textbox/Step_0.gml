// Update all variables
page_number = array_length(global.dialogue_pages);
text_string_length = string_length(global.dialogue_pages[page]);


typing_progress = min(typing_progress + text_typing_speed, text_string_length);

if (KEY_ACCEPT) {

	if (typing_progress >= text_string_length) {
		
		page++;
		typing_progress = 0;
	
		if (page >= page_number) {
			instance_destroy();	
		}
		
	}
	
}

if (KEY_CANCEL) {
	
	typing_progress = text_string_length;
	
}
