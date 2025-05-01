function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "          ")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Leave this song while you can")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end