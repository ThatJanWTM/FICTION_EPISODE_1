function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Boll Deluxe")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Again?")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end