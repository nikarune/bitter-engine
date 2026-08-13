function party_add(_name, _struct) {
	array_push(global.party_names, _name);
	struct_set(global.party, _name, _struct);
}

function party_get_leader() {
	return (global.party_names[0]);
}

function partym_get_struct(_member) {
	return (struct_get(global.party, _member));
}

function partym_get_status(_member) {
	
	var _status = -1;
	
	if (_member == party_get_leader())  {
		
		_status = PARTY.LEADER;
		
	}
	
	else {
	
		_status = PARTY.FOLLOWER;
		
	}
	
	return (_status);
	
}

function partym_get_sprite(_member, _sprite) {
	return (struct_get(partym_get_struct(_member), "s_" + _sprite));
}

function partym_get_object(_member) {
	return (struct_get(partym_get_struct(_member), "object"));
}

function partym_get_instance(_member) {
	return (struct_get(partym_get_struct(_member), "instance"));
}

function party_create_instances(_sep) {
	
	for (var i = 0; i < array_length(global.party_names); i++) {
		
		var _partym_name = global.party_names[i];
		var _partym_object = partym_get_object(_partym_name);
		var _partym_inst = instance_create_layer(obj_party_manager.x, obj_party_manager.y, "Instances", _partym_object);
		
		with (_partym_inst) {
			
			name = _partym_name;
			record = i * _sep;
			
		}
		
		struct_set(partym_get_struct(_partym_name), "instance", _partym_inst);
		
	}

}
