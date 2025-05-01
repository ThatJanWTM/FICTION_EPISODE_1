function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin' ERECT MODE")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Retry")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end