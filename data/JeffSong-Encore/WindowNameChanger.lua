function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Jeff Song Encore: The Senpai-re Strikes Back")
end

function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", "That was not Senpai")
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end