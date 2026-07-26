depth = -bbox_bottom;

sprite_index = partym_get_sprite(name, "battle_idle");

x = obj_battle.carousel_points[carousel_spot].x;
y = obj_battle.carousel_points[carousel_spot].y;

direction = point_direction(x, y, obj_battle_enemy.x, obj_battle_enemy.y);
cardinal_animate_battle();

image_blend = make_colour_hsv(0, 0, y);