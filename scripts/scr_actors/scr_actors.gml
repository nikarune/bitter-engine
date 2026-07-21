global.party = {};
global.party_names = [];

function Party_Member() constructor {
	name = "???";
	description = "Party member.";
	
	object = obj_actor;
	
	#region Stats
	
	level = 1;
	attack = 1;
	defense = 1;
	max_hp = 10;
	hp = 10;
	
	#endregion

	#region Sprites
	
	s_idle = noone;
	s_walk = noone;
	
	#endregion
	
}

function Encounter() constructor {
	#region Stats
	
	attack = 1;
	defense = 1;
	max_hp = 10;
	hp = 10;
	
	#endregion
	
	#region Sprites
	
	s_battle_wait = noone;
	s_battle_down = noone;
	
	
	#endregion
}

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