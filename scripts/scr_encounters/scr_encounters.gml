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