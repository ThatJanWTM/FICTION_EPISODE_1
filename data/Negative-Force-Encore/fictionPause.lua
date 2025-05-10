
option = {'Resume', 'Retry', 'Options', 'Quit'}

function onPause()
    openCustomSubstate('fictionPause', true)
    return Function_Stop
end

function onCustomSubstateCreate(n)
    if n == 'fictionPause' then

	--BG
	makeLuaSprite('titleCard', 'ASHL/nega/pauseEncore', 0, 0)
	addLuaSprite('titleCard', true)
	scaleObject('titleCard', 3, 3)
	setObjectCamera('titleCard', 'hud')
	setProperty('titleCard.antialiasing', false);
		
	--Sound Effect
	playSound('ASHL/nega/ng_accept')	
	
	--Pause Text
	makeLuaText('paused', 'P A U S E D')
	setTextFont('paused', 'FictionPixel.ttf');
	setTextSize('paused', 24)
	setProperty('paused.antialiasing', false);
	setProperty('paused.borderSize', 3);
	setProperty('paused.y', 280)
	addLuaText('paused')
	screenCenter('paused', 'X');

	--Resume Text
	makeLuaText('resume', 'CONTINUE')
	setTextFont('resume', 'FictionPixel.ttf');
	setTextSize('resume', 24)
	setProperty('resume.antialiasing', false);
	setProperty('resume.borderSize', 3);
	setProperty('resume.y', 328)
	addLuaText('resume')
	screenCenter('resume', 'X');

	--Retry Stage Text
	makeLuaText('restart', 'RESTART')
	setTextFont('restart', 'FictionPixel.ttf');
	setTextSize('restart', 24)
	setProperty('restart.antialiasing', false);
	setProperty('restart.borderSize', 3);
	setProperty('restart.y', 352)
	addLuaText('restart')
	screenCenter('restart', 'X');

	--Options Text
	makeLuaText('opt', 'SETTINGS')
	setTextFont('opt', 'FictionPixel.ttf');
	setTextSize('opt', 24)
	setProperty('opt.antialiasing', false);
	setProperty('opt.borderSize', 3);
	setProperty('opt.y', 376)
	addLuaText('opt')
	screenCenter('opt', 'X');

	--Quit Stage Text
	makeLuaText('quit', 'EXIT')
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
			playSound('ASHL/nega/ng_back')
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
			playSound('ASHL/nega/ng_accept')
			closeCustomSubstate()

		elseif keyboardJustPressed('ENTER') and optionSelected == 2 then
			playSound('ASHL/nega/ng_accept')
			restartSong(true)

		elseif keyboardJustPressed('ENTER') and optionSelected == 3 then
			playSound('ASHL/nega/ng_accept')
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
			playSound('ASHL/nega/ng_accept')
			runHaxeCode([[PlayState.seenCutscene = false]])
			exitSong()
		end
	end
	if optionSelected == 1 then
		setTextColor('resume', 'ff00ff')
		setTextColor('restart', 'ffffff')
		setTextColor('opt', 'ffffff')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 2 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ff00ff')
		setTextColor('opt', 'ffffff')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 3 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffffff')
		setTextColor('opt', 'ff00ff')
		setTextColor('quit', 'ffffff')
	end
	if optionSelected == 4 then
		setTextColor('resume', 'ffffff')
		setTextColor('restart', 'ffffff')
		setTextColor('opt', 'ffffff')
		setTextColor('quit', 'ff0000')
	end

	if (keyboardJustPressed('W') or keyboardJustPressed('UP')) then
		chooseOption(-1)
		playSound('ASHL/nega/ng_move')	
	elseif (keyboardJustPressed('S') or keyboardJustPressed('DOWN')) then
		chooseOption(1)
		playSound('ASHL/nega/ng_move')
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
