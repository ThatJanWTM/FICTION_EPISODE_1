function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "A Snow H3ated Funk")
	setPropertyFromClass("substates.StickerSubState", "STICKER_PACK", "snow")
end

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then

	end
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Game Over")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end