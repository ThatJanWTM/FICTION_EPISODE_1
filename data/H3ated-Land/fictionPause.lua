
option = {'Resume', 'Retry', 'Options', 'Quit'}

function onPause()
    openCustomSubstate('fictionPause', true)
    return Function_Stop
end

function onCustomSubstateCreate(n)
    if n == 'fictionPause' then

	--BG
	makeLuaSprite('titleCard', 'ASHL/pause', 0, 0)
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

	--Options Text
	makeLuaText('opt', 'Options')
	setTextFont('opt', 'FictionPixel.ttf');
	setTextSize('opt', 24)
	setProperty('opt.antialiasing', false);
	setProperty('opt.borderSize', 3);
	setProperty('opt.y', 376)
	addLuaText('opt')
	screenCenter('opt', 'X');

	--Quit Stage Text
	makeLuaText('quit', 'QUIT')
	setTextFont('quit', 'FictionPixel.ttf');
	setTextSize('quit', 24)
	setProperty('quit.antialiasing', false);
	setProperty('quit.borderSize', 3);
	setProperty('quit.y', 400)
	addLuaText('quit')
	screenCenter('quit', 'X');

	--Setting Cams
	setObjectCamera('titleCard', 'camOther')
	setObjectCamera('paused', 'camOther')
	setObjectCamera('resume', 'camOther')
	setObjectCamera('restart', 'camOther')
	setObjectCamera('opt', 'camOther')
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
	removeLuaText('opt')
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
			stopSound()
            		runHaxeCode([[
                		import options.OptionsState;
                		import backend.MusicBeatState;
        
                		var songPos = FlxG.sound.music.time;
                		var wasPlayingVocals = PlayState.instance.vocals != null && PlayState.instance.vocals.playing;
        
                		PlayState.instance.paused = true;
        
                		if (PlayState.instance.vocals != null) {
                    		PlayState.instance.vocals.volume = 0;
                		}
        
                		OptionsState.onPlayState = true;
                		OptionsState.onLeaveCallback = function() {
                    		PlayState.instance.paused = false;
        
                    		if (FlxG.sound.music != null) {
                        		FlxG.sound.music.play();
                        		FlxG.sound.music.time = songPos;
                    		}
        
                    		if (PlayState.instance.vocals != null) {
                        		PlayState.instance.vocals.time = songPos;
                        		PlayState.instance.vocals.volume = 1;
                        		if (wasPlayingVocals) {
                            		PlayState.instance.vocals.play();
                        		}
                    		}
                		};
        
               		 MusicBeatState.switchState(new OptionsState());
            		]])

		elseif keyboardJustPressed('ENTER') and optionSelected == 4 then
			runHaxeCode([[PlayState.seenCutscene = false]])
			exitSong()
		end
	end
	if optionSelected == 1 then
		setTextColor('resume', 'ffff00')
		setTextColor('restart', 'ffffff')
		setTextColor('opt', 'ffffff')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 2 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffff00')
		setTextColor('opt', 'ffffff')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 3 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffffff')
		setTextColor('opt', 'ffff00')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 4 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffffff')
		setTextColor('opt', 'ffffff')
		setTextColor('quit', 'ffff00')
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
