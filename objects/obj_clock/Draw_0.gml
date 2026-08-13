draw_set_color(c_white)
draw_circle(radius, radius, radius, true);

var _d = (360/12) * current_hour
_d += 270;
var _x = radius/2 * dcos(_d);
var _y = radius/2 * dsin(_d);

draw_line(radius, radius, radius + _x, radius + _y)

_d = (360/60) * current_minute
_d += 270;
_x = radius/1.5 * dcos(_d);
_y = radius/1.5 * dsin(_d);

draw_line(radius, radius, radius + _x, radius + _y)

_d = (360/60) * current_second
_d += 270;
_x = radius * dcos(_d);
_y = radius * dsin(_d);

draw_line(radius, radius, radius + _x, radius + _y)