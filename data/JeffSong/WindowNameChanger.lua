function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Jeff Song: Jeff Extraveganza")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "That was shit!")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end