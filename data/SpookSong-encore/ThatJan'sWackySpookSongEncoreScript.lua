
--Black Bar things, stole if from [REDACTED] but idk where it comes from before that so sorry
local thickness = 100

function onCreate()
	makeLuaSprite("cineBar_upper", nil, 0, -thickness)
	makeGraphic("cineBar_upper", 1400, thickness, "000000")
	setObjectCamera("cineBar_upper", "Hud")
	addLuaSprite("cineBar_upper", false)
		
	makeLuaSprite("cineBar_lower", null, 0, 720)
	makeGraphic("cineBar_lower", 1400, thickness, "000000")
	setObjectCamera("cineBar_lower", "Hud")
	addLuaSprite("cineBar_lower", false)
	end


--Song events (that aren't actual events)
function onStepHit()
	--Cool Name thing
	if curStep == 1 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Ov|")
	end
	if curStep == 2 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fict|")
	end
	if curStep == 3 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF:|  ")
	end
	if curStep == 4 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Spook|")
	end
	if curStep == 6 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Spook Song|")
	end
	if curStep == 8 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Spook Song Encore (by caser)")
	end
	if curStep == 1544 then
		doTweenAlpha('HUDleave', 'camHUD', 0, 1, 'linear')
		doTweenAlpha('HUDback', 'camHUD', 1, 0.5, 'circOut')
	end
	if curStep == 1544 then
		doTweenAlpha('HUDleave', 'camHUD', 0, 1, 'linear')
	end
	
	
	--Cool Effect when the "you know what" appears
	if curStep == 1672 then 
		doTweenAlpha('HUDback', 'camHUD', 1, 0.5, 'circOut')
		setProperty('timeBarBG.visible',false)
		setProperty('timeBar.visible',false)
		setProperty('timeTxt.visible',false)
		doTweenY("cineBar_upper", "cineBar_upper", 0, 2, "quintout")
		doTweenY("cineBar_lower", "cineBar_lower", 720 - thickness, 2, "quintout")
		setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: It's not over yet!")
	end
end

--Making sure it doesn't permanently say Spook Song Encore when you leave
function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end