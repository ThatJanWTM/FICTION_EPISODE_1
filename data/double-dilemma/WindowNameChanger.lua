function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin'")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Lose... Restart?")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end