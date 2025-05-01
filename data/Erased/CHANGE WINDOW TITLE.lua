--CHANGE WINDOW TITLE

function onUpdate()
	if getProperty("health") < 0 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'!?')
	elseif getProperty("health") > 1.80 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'. . .?')
	elseif getProperty("health") < 1.80 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'. . .')
	end
end

function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end
