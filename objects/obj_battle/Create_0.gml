instance_deactivate_all(true);

partypos = [
	{x : BATTLE_PARTYLEADER_X, y : BATTLE_PARTYLEADER_Y},
	{x : BATTLE_PARTYMEMBER_XOFFSET, y : BATTLE_PARTYMEMBER_YOFFSET},
	{x : RES.WIDTH - BATTLE_PARTYMEMBER_XOFFSET, y : BATTLE_PARTYMEMBER_YOFFSET}
];

buttons = [
	spr_battle_button_fight,
	spr_battle_button_act,
	spr_battle_button_item,
];

#region Create Battle Instances

// Create party members
for (var i = 0; i < array_length(global.party_names); i++) {
	
	var _partym_name = global.party_names[i];
	var _partym_instance = partym_get_instance(_partym_name);
	var _unitx = partypos[i].x;
	var _unity = partypos[i].y;
	carousel_points[i] = {x : _unitx, y : _unity};
	
	if (i == 0) {
		
		party_units[i] = instance_create_depth(
			_unitx,
			_unity,
			-999,
			obj_battle_party_leader,
			{carousel_spot : i}
		);
		
	}
	
	else {
		
		party_units[i] = instance_create_depth(
			_unitx,
			_unity,
			-999,
			obj_battle_party_units,
			{name : _partym_name, carousel_spot : i}
		);
		
	}
	
}

// Create enemy
var _enemyx = BATTLE_ENEMY_X;
var _enemyy = BATTLE_ENEMY_Y;

enemy = instance_create_depth(
	_enemyx,
	_enemyy,
	-999,
	obj_battle_enemy,
	{carousel_spot : array_length(carousel_points)}
);

array_push(carousel_points, {x : _enemyx, y : _enemyy});

#endregion

// Misc
menu_spr = spr_battle_menu;
menu_image_index = 0;
menu_layer = 0;
encounter_type = new Encounter(); 
menu_height = sprite_get_height(menu_spr);
menu_width = sprite_get_width(menu_spr);

theta = pi/2;
lerp_val = 0;
lerp_val_max = 0;