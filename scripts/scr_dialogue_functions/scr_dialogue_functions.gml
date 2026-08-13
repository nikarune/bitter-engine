function dialogue_prep(_dialogue) {
	
	if (!is_array(_dialogue)) {
		_dialogue = [_dialogue];	
	}
	
	global.dialogue_pages = _dialogue;
}

function dialogue_clear() {
	global.dialogue_pages = [];
}

function dialogue_run() {
	instance_create_depth(0, 0, -999, obj_textbox);
}