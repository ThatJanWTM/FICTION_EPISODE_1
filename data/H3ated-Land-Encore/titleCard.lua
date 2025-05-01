function onCreatePost()
	if not seenCutscene then
		setProperty('skipCountdown', true)
		setProperty('camGame.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty("healthBar.visible", false)
		setProperty('scoreTxt.visible',false)
	end
end

function onSongStart()
	if not seenCutscene then
		openCustomSubstate("titleCard", true)
		return Function_Stop
	end
end

function onCustomSubstateCreate(n)
    if n == "titleCard" then
		--The Fuckin SOUND
		playSound('ASHL/titleCardSound')
		
		--Title Card Pop-Up
		makeLuaSprite('titleCard', 'ASHL/encore/titleCard', 0, 0)
		addLuaSprite('titleCard', true)
		scaleObject('titleCard', 3, 3)
		setObjectCamera('titleCard', 'hud')
		setProperty('titleCard.antialiasing', false);
		
		--Stupid piece of shit idiot son of mine walking on the fucking titleCard like a fucking bitch baby
		if boyfriendName == 'Slimey' then
			makeAnimatedLuaSprite('slimeyMove', 'ASHL/slimeyMove', 0, 0)
			addAnimationByPrefix('slimeyMove', 'loop', 'slimeyMove', 10, true);
			scaleObject('slimeyMove', 3, 3)
			setObjectCamera('slimeyMove', 'hud')
			addLuaSprite('slimeyMove', true)
			setProperty('slimeyMove.antialiasing', false);
		elseif boyfriendName == 'Slimey-Shiny' then
			makeAnimatedLuaSprite('slimeyMove', 'ASHL/slimeyMove-shiny', 0, 0)
			addAnimationByPrefix('slimeyMove', 'loop', 'slimeyMove', 10, true);
			scaleObject('slimeyMove', 3, 3)
			setObjectCamera('slimeyMove', 'hud')
			addLuaSprite('slimeyMove', true)
			setProperty('slimeyMove.antialiasing', false);
		end
		onPoopyDookie()
	end
end

function onPoopyDookie()
	runTimer('titleDelay', 3)
end
		

function onTimerCompleted(tag)
	if tag == "titleDelay" then
	
	removeLuaSprite('titleCard')
	removeLuaSprite('slimeyMove')
	
	setProperty('scoreTxt.visible', true)
	setProperty("healthBar.visible", true)
	setProperty('iconP1.visible', true)
	setProperty('iconP2.visible', true)
	setProperty('camGame.visible', true)
	
	closeCustomSubstate()
	end
end


















