function onCreate()
	precacheImage("ASHL/nega/Static")
	precacheImage("ASHL/nega/SpotEye")
end

function onStepHit()
	if curStep == 1 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "N E G A T I V E  F O R C E")
	end
	if curStep == 1600 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "H E R")
		makeLuaSprite('SpotEye', 'ASHL/nega/SpotEye', 0, 16);
		addLuaSprite('SpotEye', true);
		scaleObject('SpotEye', 6, 6)
		setProperty('SpotEye', false);
	end
	if curStep == 1856 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "    ")
		setProperty('camHUD.visible', false)
		setProperty('camGame.visible', false)
		makeAnimatedLuaSprite('Static', 'Static', 0, 0)
		addAnimationByPrefix('Static','loop','static',30);
		addLuaSprite('Static', false)
		setObjectCamera('Static', 'hud')
		scaleObject('Static', 1, 1)
		setProperty('Static.antialiasing', false);
	end
end