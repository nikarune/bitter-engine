global.party = {};
global.party_names = [];
global.party_state = PARTYSTATES.ROAM;

function Party_Member() constructor {
	name = "???";
	description = "Party member.";
	
	#region Stats
	
	level = 1;
	attack = 1;
	defense = 1;
	max_hp = 10;
	hp = 10;
	
	#endregion

	#region Actions
	
	actions = [];
	
	#endregion
	
	#region Sprites
	
	s_icon = spr_kris_icon;
	s_idle = spr_actor_kris_idle;
	s_walk = spr_actor_kris_walk;
	
	s_battle_idle = spr_kris_battle;
	s_battle_nametag = spr_battle_nametag_kris;
	s_battle_area_enter = spr_kris_battle_enter;
	s_battle_area_landing = spr_kris_battle_land;
	
	#endregion
	
	#region System
	
	object = obj_actor;
	instance = noone;
	
	#endregion
}

function PM_Susie() : Party_Member() constructor {
	s_icon = spr_susie_icon;
	s_idle = spr_susie_idle;
	s_walk = spr_susie_walk;
	
	s_battle_idle = spr_susie_battle;
	s_battle_nametag = spr_battle_nametag_susie;
	s_battle_area_enter = spr_susie_battle_enter;
	s_battle_area_landing = spr_susie_battle_land;
}
	
function Action() constructor {
	name = "Action";
	description = "An action.";
	
	object = obj_battle_action;
}

function ACT_Starstrike() constructor {
	name = "Starstrike";
	description = "Strike, full of stars.";
	
	object = obj_battle_action_starstrike;
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
	
	actions = [
		new ACT_Starstrike(),
		new Action(),
	];
}

#region Functions

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
	
#endregion
