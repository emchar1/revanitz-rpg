extends Node

# PROPERTIES

enum AudioKey {
	BGM_MENU,
	
	BUTTON_TAP_2,
	BUTTON_TAP_5
}

enum Music {
	NONE, BGM_MENU
}

enum Type {
	SOUND, MUSIC
}

var music_map := {
	Music.BGM_MENU: {
		"music": AudioKey.BGM_MENU
	}
}

var sounds := {
	AudioKey.BGM_MENU: {
		"type": Type.MUSIC,
		"stream": preload("res://assets/sounds/bgm_menu.ogg")
	},
	AudioKey.BUTTON_TAP_2: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/buttontap2.ogg")
	},
	AudioKey.BUTTON_TAP_5: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/buttontap5.ogg")
	}
}
