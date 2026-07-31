#region Meta

#macro FPS 60

#endregion

#region Input

#macro KEY_UP keyboard_check(vk_up)
#macro KEY_DOWN keyboard_check(vk_down)
#macro KEY_LEFT keyboard_check(vk_left)
#macro KEY_RIGHT keyboard_check(vk_right)
#macro KEY_ACCEPT keyboard_check_pressed(ord("Z"))
#macro KEY_CANCEL keyboard_check_pressed(ord("X"))

#endregion

#region Cardinal Dir

#macro DIRECTION_COUNT 4 // The amount of directions an actor can walk in.
#macro CARDINAL_DIR direction div (360 / DIRECTION_COUNT)
#macro BATTLE_CARDINAL_DIR round(direction / (360 / 8))

#endregion

#region Enums

enum PARTY {
	LEADER,
	FOLLOWER,
}

enum RES {
	WIDTH = 320,
	HEIGHT = 240,
}

enum PARTYSTATES {
	ROAM,
	BATTLE,
}

#endregion

#region Pos Presets

#macro BATTLE_ENEMY_X 160
#macro BATTLE_ENEMY_Y 75

#macro BATTLE_PARTYLEADER_X 160
#macro BATTLE_PARTYLEADER_Y 175

#macro BATTLE_PARTYMEMBER_XOFFSET 60
#macro BATTLE_PARTYMEMBER_YOFFSET 150

#macro BATTLE_MENU_XOFFSET 13
#macro BATTLE_MENU_YOFFSET -57

#macro BATTLE_MENU_WIDTH 96
#macro BATTLE_MENU_HEIGHT 41

#macro BATTLE_MENU_BUTTON_MARGIN 20
#macro BATTLE_MENU_TEXT_MARGIN 10
#macro BATTLE_MENU_TEXT_NAME_SEP 16
#macro BATTLE_MENU_TEXT_DESC_SEP 8
#macro BATTLE_MENU_TEXT_CHUNK_SEP 4
#macro BATTLE_MENU_ICON_MARGIN 3
#macro BATTLE_MENU_ICON_SEP 10

#endregion