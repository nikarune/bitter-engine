// Update party status.
status = partym_get_status(name);

// Give the party leader player controls.
if (status == PARTY.LEADER) {
	
	global.record_ref = id; // The party manager will now record the position of this instance.
	
	x += KEY_RIGHT - KEY_LEFT;
	y += KEY_DOWN - KEY_UP;

}

// Record the position of the other party members.
else if (recording) {
	
	// Set the party member's position.
	x = obj_party_manager.pos[record].x;
	y = obj_party_manager.pos[record].y;
	
}