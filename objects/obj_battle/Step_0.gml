theta = lerp(theta, lerp_val_max, 0.1);

var _offset = (theta_offset * (array_length(carousel_points) mod 2 != 0));
var _lerp_add_amount = 0;

_lerp_add_amount = (1 / array_length(carousel_points));	

if (_offset == 0) {
	_lerp_add_amount *= 2;
}

lerp_val_max = partypos[select];

//lerp_val_max = clamp(lerp_val_max, (0.5 - _lerp_add_amount), (0.5 + _lerp_add_amount))

select += (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left));
select = clamp(select, 0, array_length(partypos) - 1);

if (KEY_CANCEL) {
	party_add("123", new PM_Susie());
	instance_destroy();
	instance_create_depth(0, 0, 0, obj_battle);
}

show_debug_message(_offset)

show_debug_message(lerp_val_max)

/*
0.83 - kris
0.17 - susie