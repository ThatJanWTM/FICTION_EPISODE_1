function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Sonic Boll 1.9.3")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Again?")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end