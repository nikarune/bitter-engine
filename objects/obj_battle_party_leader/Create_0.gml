name = party_get_leader();

x_speed = 0;
y_speed = 0;
grav = 1;
transition_height = 20;
transition_speed = 3;
local_frame = 0;


function playerstate_battle_select() {
	x = obj_battle.carousel_points[carousel_spot].x;
	y = obj_battle.carousel_points[carousel_spot].y;
	
	sprite_index = partym_get_sprite(name, "battle_idle");
	direction = point_direction(x, y, obj_battle_enemy.x, obj_battle_enemy.y);
	depth = -bbox_bottom;
	image_blend = make_colour_hsv(0, 0, y);
	
	cardinal_animate_battle();
	
	if (KEY_ACCEPT) {
		state = playerstate_go_to_battle_area;
	}
	
	
}

function playerstate_go_to_battle_area() {
	sprite_index = partym_get_sprite(name, "battle_area_enter");
	x = obj_battle.carousel_points[carousel_spot].x;
	
	if (y < obj_battle.carousel_points[carousel_spot].y - transition_height) {
		transition_speed = 0;
	}
	
	y_speed -= transition_speed;
	y_speed += grav;
	
	y += y_speed;
	
	if (y > obj_battle.carousel_points[carousel_spot].y) {
		
		// Reset physics
		transition_speed = 3;
		y_speed = 0;
		
		// Set position correctly
		y = obj_battle.carousel_points[carousel_spot].y;
		
		// Reset sprite stuff
		image_index = 0;
		
		// Set state to the next one
		state = playerstate_battle_area_land;
		
	}
	
}

function playerstate_battle_area_land() {
	sprite_index = partym_get_sprite(name, "battle_area_landing");
	x = obj_battle.carousel_points[carousel_spot].x;
	y = obj_battle.carousel_points[carousel_spot].y;
	
	// If the animation is over, move on to the next state.
	if (image_index >= image_number - 1) {
		state = playerstate_battle_select;
	}
}

state = playerstate_battle_select;