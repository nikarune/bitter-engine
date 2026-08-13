#region Meta

function end_scene() {
	
	scene++;
	
	if (scene >= array_length(scene_info)) {
		instance_destroy();
	}
	
}

function validate_scene() {
	
	if (object_index != obj_cutscene_manager) {
		
		show_error("Scene was called in an object that is not obj_cutscene_manager.", true);
	
	}
	
}

#endregion

function scene_wait(_frames) {
	
	validate_scene();
	
	timer++;
	
	if (timer >= _frames) {
		
		timer = 0;
		end_scene();
		
	}
	
}

function scene_prep_dialogue(_dialogue) {
	
	validate_scene();
	
	dialogue_prep(_dialogue);
	dialogue_run();
	
	end_scene();
	
}

function scene_dialogue() {
	
	validate_scene();
	
	if (!instance_exists(obj_textbox)) {
		end_scene();
	}
	
}