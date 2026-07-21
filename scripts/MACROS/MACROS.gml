#region Input

#macro KEY_UP keyboard_check(vk_up)
#macro KEY_DOWN keyboard_check(vk_down)
#macro KEY_LEFT keyboard_check(vk_left)
#macro KEY_RIGHT keyboard_check(vk_right)
#macro KEY_ACCEPT keyboard_check_pressed(ord("Z"))
#macro KEY_CANCEL keyboard_check_pressed(ord("X"))

#endregion

#region Enums

enum PARTY {
	LEADER,
	FOLLOWER,
}

#endregion