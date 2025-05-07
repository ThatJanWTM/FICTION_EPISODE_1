
option = {'Resume', 'Retry', 'Quit'}

function onPause()
    openCustomSubstate('fictionPause', true)
    return Function_Stop
end

function onCustomSubstateCreate(n)
    if n == 'fictionPause' then

	--BG
	makeLuaSprite('titleCard', 'ASHL/nega/pause', 0, 0)
	addLuaSprite('titleCard', true)
	scaleObject('titleCard', 3, 3)
	setObjectCamera('titleCard', 'hud')
	setProperty('titleCard.antialiasing', false);
		
	--Sound Effect
	playSound('general/CamOff')	
	
	--Pause Text
	makeLuaText('paused', 'P A U S E')
	setTextFont('paused', 'FictionPixel.ttf');
	setTextSize('paused', 24)
	setProperty('paused.antialiasing', false);
	setProperty('paused.borderSize', 3);
	setProperty('paused.y', 280)
	addLuaText('paused')
	screenCenter('paused', 'X');

	--Resume Text
	makeLuaText('resume', 'Resume')
	setTextFont('resume', 'FictionPixel.ttf');
	setTextSize('resume', 24)
	setProperty('resume.antialiasing', false);
	setProperty('resume.borderSize', 3);
	setProperty('resume.y', 328)
	addLuaText('resume')
	screenCenter('resume', 'X');

	--Retry Stage Text
	makeLuaText('restart', 'Retry Stage')
	setTextFont('restart', 'FictionPixel.ttf');
	setTextSize('restart', 24)
	setProperty('restart.antialiasing', false);
	setProperty('restart.borderSize', 3);
	setProperty('restart.y', 352)
	addLuaText('restart')
	screenCenter('restart', 'X');

	--Quit Stage Text
	makeLuaText('quit', 'QUIT')
	setTextFont('quit', 'FictionPixel.ttf');
	setTextSize('quit', 24)
	setProperty('quit.antialiasing', false);
	setProperty('quit.borderSize', 3);
	setProperty('quit.y', 376)
	addLuaText('quit')
	screenCenter('quit', 'X');

	--Setting Cams
	setObjectCamera('titleCard', 'camOther')
	setObjectCamera('paused', 'camOther')
	setObjectCamera('resume', 'camOther')
	setObjectCamera('restart', 'camOther')
	setObjectCamera('quit', 'camOther')
   end
end

function onCustomSubstateUpdate(n)
	if n == 'fictionPause' then
		if keyboardJustPressed('ESCAPE') then
			playSound('general/CamOff')
			closeCustomSubstate()
   		end
	end	
end

function onResume()
	removeLuaSprite('titleCard')
	removeLuaText('paused')
	removeLuaText('resume')
	removeLuaText('restart')
	removeLuaText('quit')
end

function onCustomSubstateUpdatePost(name)
	if name == 'fictionPause' then
		if keyboardJustPressed('ENTER') and optionSelected == 1 then
			playSound('general/CamOff')
			closeCustomSubstate()
		elseif keyboardJustPressed('ENTER') and optionSelected == 2 then
			restartSong()
		elseif keyboardJustPressed('ENTER') and optionSelected == 3 then
			runHaxeCode([[PlayState.seenCutscene = false]])
			playSound('ASHL/nega/titleCardSound', 1, 'titleSound')
			exitSong()
		end
	end
	if optionSelected == 1 then
		setTextColor('resume', 'ffff00')
		setTextColor('restart', 'ffffff')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 2 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffff00')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 3 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffffff')
		setTextColor('quit', 'ff0000')
	end
	if (keyboardJustPressed('W') or keyboardJustPressed('UP')) then
		chooseOption(-1)
		playSound('scrollMenu')	
	elseif (keyboardJustPressed('S') or keyboardJustPressed('DOWN')) then
		chooseOption(1)
		playSound('scrollMenu')
	end
end

-- option default select (resume)
optionSelected = 1
function chooseOption(choose)
	optionSelected = optionSelected + choose;

	if optionSelected >= #option + 1 then
		optionSelected = 1;
	elseif optionSelected <= 0 then
		optionSelected = #option;
	end
end
