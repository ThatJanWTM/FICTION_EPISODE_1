function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Try Again...?')
    elseif getProperty("health") > 1.80 then
	setPropertyFromClass("openfl.Lib", "application.window.title",'Great Job')
    elseif getProperty("health") < 1.80 then
	setPropertyFromClass("openfl.Lib", "application.window.title",'Come sing with me')
    end
end

function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end