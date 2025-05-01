function onCreate()
	setProperty('showComboNum', false);
end

--Shows Combo sprite when getting a combo of 10
function goodNoteHit()
	if combo == 9 then
		if songName == 'Double Dilemma' or songName == 'Double Dilemma Encore' or songName == 'Double Dilemma (Pico Mix)' or curStage == 'MSPaint Land' then
			setProperty('showComboNum', true);
		else
			setProperty('showCombo', true);
			setProperty('showComboNum', true);
		end
	end
end

--Removes Combo sprite when you miss
function noteMiss()
	setProperty('showCombo', false);
	setProperty('showComboNum', false);
end