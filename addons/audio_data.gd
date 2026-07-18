extends Node

# PROPERTIES

enum AudioKey {
	BGM_PLACEHOLDER,
	BGM_MINES,
	BGM_SPIDERBOSS,
	
	BUTTON_TAP_2,
	BUTTON_TAP_5,
	DRIP0,
	DRIP1,
	DRIP2,
	DRIP3,
	DRIP4,
	WIND0,
	WIND1,
	WIND2
}

enum Music {
	NONE, BGM_PLACEHOLDER, BGM_MINES, BGM_SPIDERBOSS
}

enum Type {
	SOUND, MUSIC
}

var music_map := {
	Music.BGM_PLACEHOLDER: {
		"music": AudioKey.BGM_PLACEHOLDER
	},
	Music.BGM_MINES: {
		"music": AudioKey.BGM_MINES
	},
	Music.BGM_SPIDERBOSS: {
		"music": AudioKey.BGM_SPIDERBOSS
	}
}

var sounds := {
	AudioKey.BGM_PLACEHOLDER: {
		"type": Type.MUSIC,
		"stream": preload("res://assets/sounds/bgm_placeholder.ogg")
	},
	AudioKey.BGM_MINES: {
		"type": Type.MUSIC,
		"stream": preload("res://assets/sounds/mine/taiko.ogg")
	},
	AudioKey.BGM_SPIDERBOSS: {
		"type": Type.MUSIC,
		"stream": preload("res://assets/sounds/mine/spiderboss.ogg")
	},
	AudioKey.BUTTON_TAP_2: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/buttontap2.ogg")
	},
	AudioKey.BUTTON_TAP_5: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/buttontap5.ogg")
	},
	AudioKey.DRIP0: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/water_drip/drip0.ogg")
	},
	AudioKey.DRIP1: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/water_drip/drip1.ogg")
	},
	AudioKey.DRIP2: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/water_drip/drip2.ogg")
	},
	AudioKey.DRIP3: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/water_drip/drip3.ogg")
	},
	AudioKey.DRIP4: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/water_drip/drip4.ogg")
	},
	AudioKey.WIND0: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/wind/wind0.ogg")
	},
	AudioKey.WIND1: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/wind/wind1.ogg")
	},
	AudioKey.WIND2: {
		"type": Type.SOUND,
		"stream": preload("res://assets/sounds/mine/wind/wind2.ogg")
	},
}
