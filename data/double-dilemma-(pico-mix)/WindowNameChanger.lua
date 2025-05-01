function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' Pico Mix")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Fuck...")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end