draw_sprite_tiled(sprite_index, image_index, 0, 0);

#region DEBUG ELLIPSE

var _ellipse_corner_x1 = BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y1 = BATTLE_ENEMY_Y;
var _ellipse_corner_x2 = RES.WIDTH - BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y2 = BATTLE_PARTYLEADER_Y;

var _ellipse_center_x = (_ellipse_corner_x2 + _ellipse_corner_x1) / 2;
var _ellipse_center_y = (_ellipse_corner_y2 + _ellipse_corner_y1) / 2;

var _semi_horizontal_radius = (_ellipse_corner_x2 - _ellipse_corner_x1) / 2;
var _semi_vertical_radius = (_ellipse_corner_y2 - _ellipse_corner_y1) / 2;

var _major_axis = max(_semi_horizontal_radius, _semi_vertical_radius) * 2;
var _minor_axis = min(_semi_horizontal_radius, _semi_vertical_radius) * 2;

draw_set_colour(c_grey)
draw_ellipse(_ellipse_corner_x1, _ellipse_corner_y1, _ellipse_corner_x2, _ellipse_corner_y2, false);

for (var i = 0; i < array_length(carousel_points); i++) {
	
	var _offset = (theta_offset * (array_length(carousel_points) mod 2 != 0));
	var _point = (360 / (array_length(carousel_points)) * i) + theta - _offset;
	
	carousel_points[i].x = _ellipse_center_x + (_semi_horizontal_radius * dcos(_point));
	carousel_points[i].y = _ellipse_center_y + (_semi_vertical_radius * dsin(_point));
	
	draw_set_color(c_white);
	draw_arrow(_ellipse_center_x, _ellipse_center_y, carousel_points[i].x, carousel_points[i].y, carousel_points[i].y / 10);
	
}

#endregion

menu_layer = KEY_UP;