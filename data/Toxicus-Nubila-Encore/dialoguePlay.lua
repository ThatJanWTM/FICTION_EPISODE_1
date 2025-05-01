local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	doTweenAlpha('hpBarHi', 'healthBar', 1, 0.5, 'circOut')
	doTweenAlpha('scoreHi', 'scoreTxt', 1, 0.5, 'circOut')
	doTweenAlpha('bfIconHi', 'iconP1', 1, 0.5, 'circOut')
	doTweenAlpha('DadIconHi', 'iconP2', 1, 0.5, 'circOut')
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		doTweenAlpha('hpBarBye', 'healthBar', 0, 1, 'circOut')
		doTweenAlpha('scoreBye', 'scoreTxt', 0, 1, 'circOut')
		doTweenAlpha('bfIconBye', 'iconP1', 0, 1, 'circOut')
		doTweenAlpha('dadIconBye', 'iconP2', 0, 1, 'circOut')
		setPropertyFromGroup('opponentStrums', 0, 'alpha', 0);
		setPropertyFromGroup('opponentStrums', 1, 'alpha', 0);
		setPropertyFromGroup('opponentStrums', 2, 'alpha', 0);
		setPropertyFromGroup('opponentStrums', 3, 'alpha', 0);
		startDialogue('loreEncore/dialogueEncore', 'WeekSH/Welcome');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end