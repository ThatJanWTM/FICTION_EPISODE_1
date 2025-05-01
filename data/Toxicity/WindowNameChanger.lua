function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "A Snow H3ated Funk")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Game Over")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end