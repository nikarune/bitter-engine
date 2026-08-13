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