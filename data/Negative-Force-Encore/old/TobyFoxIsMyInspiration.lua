--Skips Countdown and makes assets invisible and precaches stuff (also precaches the static image 3 times?? it works so idk????)
function onCreate()
	setProperty('skipCountdown', true)
	setProperty('camHUD.visible', false)
	setProperty('camGame.visible', false)
	precacheImage("ASHL/nega/Static")
	precacheImage("ASHL/nega/Static")
	precacheImage("ASHL/nega/Static")
	precacheImage("characters/secret/ABC")
	precacheImage("SpotEye")
end

--Yes this is all an if statement. No I am not changing it. If you wanna do it and make it better dm me on discord @thatjan and show me yourself. This isn't me being aggresive this is a call for help.
function onStepHit()
	--Cool Window Title thing
	if curStep == 1 then
		setPropertyFromClass('flixel.FlxG', 'fullscreen', false)
		setPropertyFromClass("openfl.Lib", "application.window.title",'NEGATIVE')
	end
	if curStep == 4 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'NEGATIVE FORCE')
	end
	if curStep == 8 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'NEGATIVE FORCE EN-')
	end
	if curStep == 12 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'NEGATIVE FORCE ENCORE')
	end
	
	--Game Cams visible again
	if curStep == 16 then
		setProperty('camHUD.visible', true)
		setProperty('camGame.visible', true)
	end
	
	--The spotlight has been turned on!
	if curStep == 272 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'THE CHANGE')
		makeLuaSprite('SpotEye', 'ASHL/nega/SpotEye', 0, 16);
		addLuaSprite('SpotEye', true);
		scaleObject('SpotEye', 6, 6)
		setProperty('SpotEye', false);
	end
	
	--The spotlight has been turned off! (also like window name changes to be CRYPTIC)
	if curStep == 528 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'THE PLAN')
		setProperty('SpotEye.visible', false);
	end
	
	--The spotlight has been turned on! (Also the sick ass drop)
	if curStep == 784 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'THE DROP')
		setProperty('SpotEye.visible', true);
	end
	
	--Spotlight off yea yea y'know
	if curStep == 1040 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'THE PLAN')
		setProperty('SpotEye.visible', false);
	end
	
	--Repeat of step 784
	if curStep == 1296 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'THE FALL')
		setProperty('SpotEye.visible', true);
	end
	
	--THE CODE USED TO BRIDGE THE CONNECTION BETWEEN THE OUTSIDER AND THE GIRL
	if curStep == 1552 then
		setProperty('strumLineNotes.visible', false)
		setProperty('timeBarBG.visible',false)
		setProperty('timeBar.visible',false)
		setProperty('timeTxt.visible',false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty("healthBarBG.visible", false)
		setProperty('scoreTxt.visible',false)
		setProperty("healthBar.visible", false)
		setProperty('Negative.visible', false);
		setProperty('SpotEye.visible', false);
		setProperty('dad.alpha', 0)
		setProperty('bf.alpha', 0)
		setPropertyFromClass('flixel.FlxG', 'fullscreen', true)
		--This literally goes unused in normal play bro, but I'm keeping it cause it's still technically possible to see if you unfullscreen.
		setPropertyFromClass("openfl.Lib", "application.window.title",'THE MEETING')
	end
	if curStep == 1584 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'why you not in fullscreen')
		setProperty('strumLineNotes.visible', true)
		setProperty('timeBar.visible',true)
		setProperty('timeTxt.visible',true)
		setProperty('iconP1.visible', true)
		setProperty('iconP2.visible', true)
		setProperty('scoreTxt.visible',true)
		setProperty("healthBarBG.visible", true)
		setProperty('dad.alpha', 50)
	end
	
	--END OF CONNECTION
	if curStep == 1840 then
		setPropertyFromClass("openfl.Lib", "application.window.title",'▯▯▯▯')
		setProperty('strumLineNotes.visible', false)
		setProperty('timeBarBG.visible',false)
		setProperty('timeBar.visible',false)
		setProperty('timeTxt.visible',false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty("healthBarBG.visible", false)
		setProperty('scoreTxt.visible',false)
		setProperty("healthBar.visible", false)
		makeAnimatedLuaSprite('Static', 'ASHL/nega/Static', 0, 0)
		addAnimationByPrefix('Static','loop','static',30);
		addLuaSprite('Static', false)
		setObjectCamera('Static', 'hud')
		scaleObject('Static', 1, 1)
		setProperty('Static.antialiasing', false);
		setPropertyFromClass('flixel.FlxG', 'fullscreen', false)
	end
end

--Changes Window Title back to Fiction Overloads' name
function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNF: Fiction Overload")
end