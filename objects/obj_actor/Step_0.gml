depth = -bbox_bottom;

// Update party status.
status = partym_get_status(name);


// Give the party leader player controls.
if (status == PARTY.LEADER) {

	global.record_ref = id; // The party manager will now record the position of this instance.

	#region Player Controls

	x += (KEY_RIGHT - KEY_LEFT);
	y += (KEY_DOWN - KEY_UP);
	
	// Set direction.
	if (xprevious != x or yprevious != y) {
		direction = point_direction(0, 0, KEY_RIGHT - KEY_LEFT, KEY_DOWN - KEY_UP);
	}
	
	#endregion

}

// Record the position of the other party members.
else if (recording) {
	
	// Set the party member's position and direction.
	x = obj_party_manager.pos[record].x;
	y = obj_party_manager.pos[record].y;
	direction = obj_party_manager.pos[record].direction;
	
}

#region Sprites

	var _start_sprite = sprite_index;

	// Set sprite correctly.
	if (xprevious != x or yprevious != y) {
		sprite_index = partym_get_sprite(name, "walk");
	}

	else {
		sprite_index = partym_get_sprite(name, "idle");
	}

	// If the sprite changed, reset the local frame.
	if (_start_sprite != sprite_index) {
		local_frame = 0;
	}

	cardinal_animate();

	#endregion
