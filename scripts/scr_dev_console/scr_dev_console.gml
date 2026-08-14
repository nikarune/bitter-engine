function console_write(_str, _ind) {
	global.console_text[_ind] = $"{_ind}) {_str}";
}

function console_clear() {
	
	for (var i = 0; i < array_length(global.console_text); i++) {
		global.console_text[i] = "";
	}
	
}