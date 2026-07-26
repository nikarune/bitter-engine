instance_deactivate_all(true);

partypos = [150, 30];

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
	
	carousel_points[i] = {x : 0, y : 0};
	
	if (i == 0) {
		
		party_units[i] = instance_create_depth(
			0,
			0,
			-999,
			obj_battle_party_leader,
			{carousel_spot : i}
		);
		
	}
	
	else if (i >= 2) {
		party_units[i] = instance_create_depth(
			0,
			0,
			-999,
			obj_battle_party_units,
			{name : _partym_name, carousel_spot : i + 1}
		);
	}
	
	else {
		
		party_units[i] = instance_create_depth(
			0,
			0,
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
	0,
	0,
	-999,
	obj_battle_enemy,
	{carousel_spot : 2}
);

array_push(carousel_points, {x : 0, y : 0});

#endregion


// Misc
menu_spr = spr_battle_menu;
menu_image_index = 0;
menu_layer = 0;
encounter_type = new Encounter(); 
menu_height = sprite_get_height(menu_spr);
menu_width = sprite_get_width(menu_spr);

theta = 360 / (array_length(carousel_points));
theta_offset = 180 / (array_length(carousel_points));
lerp_val_max = 0;

select = 0;