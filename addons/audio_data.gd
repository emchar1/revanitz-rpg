extends Node

# PROPERTIES

enum AudioKey {
	BGM_PLACEHOLDER,
	
	BUTTON_TAP_2,
	BUTTON_TAP_5
}

enum Music {
	NONE, BGM_PLACEHOLDER
}

enum Type {
	SOUND, MUSIC
}

var music_map := {
	Music.BGM_PLACEHOLDER: {
		"music": AudioKey.BGM_PLACEHOLDER
	}
}

var sounds := {
	AudioKey.BGM_PLACEHOLDER: {
		"type": Type.MUSIC,
		"stream": preload("res://assets/sounds/bgm_placeholder.ogg")
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
