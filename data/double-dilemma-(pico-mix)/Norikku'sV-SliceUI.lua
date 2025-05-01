-- Script made by Norikku. Remove this watermark if you want, just credit me. --
-----------  Settings!   -----------
local settings = {
    ['pixelAndBotplaySplashes'] = false, -- If false, notes won't splash when in a pixelated stage or in BotPlay.
    ['sustainHoldVibrating'] = false, -- If false, characters' sing animations will only play once when holding a note, eliminating the jankiness of the sustain notes at higher BPMs.
    ['staticOpponentStrums'] = false, -- If true, the opponent's note receptors won't glow when the they hit a note.
    ['thousandSeparators'] = true, -- If true, the score will add commas for every thousand.
    ['showComboPopUp'] = false, -- If true, a pop-up showing "COMBO" will show up alongside the combo numbers.
    ['legacyIconBounce'] = false, -- If true, the icon bounce will use lerps instead of a consistent tween.
}

------------------------------------------------------------------------- The actual code starts here. -------------------------------------------------------------------------------------
--------------------------------------------------- Don't touch anything after this part! (Unless you know what you're doing.) -------------------------------------------------------------

-------- CUSTOM FUNCTIONS, BABY! WOOOOOOOO- --------
function formatNumber(number) -- Adds a comma for every thousand on a number. In this case, it's only used for variables like the score.
    return settings.thousandSeparators and callMethodFromClass('flixel.util.FlxStringUtil', 'formatMoney', {number, false}) or number
end

function lerp(from, to, ratio) -- Smoothly "tweens" numbers. [CODE ALTERED FROM A POST IN https://love2d.org/forums/viewtopic.php?t=83180]
    return from + (to - from) * ratio
end

function doScaleBump(object, prevScale, targetScale, time, easing) -- A custom function I made for making an object's scale do a little bump. In this case, it's only used for the icons.
    if not settings.legacyIconBounce then
        scaleObject(object, prevScale, prevScale)
        doTweenX(''..object..'ScaleX', ''..object..'.scale', targetScale, time, easing)
        doTweenY(''..object..'ScaleY', ''..object..'.scale', targetScale, time, easing)
    end
end
----------------------------------------------------------------------

function onCreate()
    if getProperty('cpuControlled') then
        setHealth(2)
    end
    setProperty('camZoomingDecay', 3) -- This makes the camera zoom in faster.
end

function onCreatePost()
    if version <= '1.0' then -- Adding this check because 1.0 already puts he notes above everything else in the HUD.
        setObjectOrder('noteGroup', getObjectOrder('uiGroup') + 1)
    end
    if not middlescroll then
        for i = 0, getProperty('strumLineNotes.length') - 1 do
            setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') - 42)
        end
    end
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') and not settings.sustainHoldVibrating then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
        end
        if not pixelAndBotplaySplashes then
            if getPropertyFromClass('states.PlayState', 'isPixelStage') or getProperty('cpuControlled') then
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.disabled', true)
            end
        end
    end
    setHealthBarColors('FF0000', '66FF33')
    setProperty('scoreTxt.size', 16)
    setProperty('scoreTxt.borderSize', 1.2)
    setProperty('scoreTxt.antialiasing', true)
    setProperty('scoreTxt.alignment', 'right')
    setProperty('scoreTxt.x', getProperty('healthBar.x') - 800)
    setProperty('scoreTxt.y', getProperty('healthBar.y') + 30)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
end

function onUpdate(elapsed)
    setProperty('botplayTxt.visible', false)
	for i = 0, getProperty('notes.length') - 1 do
		sus = getPropertyFromGroup('notes', i, 'isSustainNote')
		susEnd = getPropertyFromGroup('notes', i, 'animation.curAnim.name'):find('holdend')
		if sus and susEnd and not getPropertyFromClass('states.PlayState', 'isPixelStage') then
		    setPropertyFromGroup('notes', i, 'scale.y', 0.7) ---- Squashing down the sustain note's nubs. They're a bit stretched in PE, which makes them look kinda ugly.
            setPropertyFromGroup('notes', i, 'offset.y', 10)
	    end
    end
end

function onUpdatePost(elapsed)
    for i, object in ipairs({'boyfriend', 'dad', 'gf'}) do
        setProperty(object..'.singDuration', settings.sustainHoldVibrating and getProperty(object..'.singDuration') or 8)
    end
    if getProperty('cpuControlled') then
        setProperty('iconP2.animation.curAnim.curFrame', 0)
        setProperty('scoreTxt.text', 'Bot Play Enabled')
    end
    if settings.legacyIconBounce then
        setProperty('iconP1.offset.y', (getProperty('iconP1.height') - getProperty('iconP1.frameHeight')) / -2)
        setProperty('iconP2.offset.y', (getProperty('iconP2.height') - getProperty('iconP2.frameHeight')) / -2)
        setProperty('iconP1.scale.x', lerp(getProperty('iconP1.scale.x'), 1, 0.325)) ---- I can never get the ratio right, so I improvised based of my memory.
        setProperty('iconP2.scale.x', lerp(getProperty('iconP2.scale.x'), 1, 0.325))
    end
end

function onSpawnNote(id, _, _, sustain)
    if sustain then
        setPropertyFromGroup('notes', id, 'multAlpha', 1)
    end
end

function opponentNoteHit(id, direction, noteType, sustain)
    if settings.staticOpponentStrums then
        callMethod('opponentStrums.members['..direction..'].playAnim', {'static', true})
    end
    if sustain then
        if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing' then
            setProperty('gf.holdTimer', 0)
        else
            setProperty('dad.holdTimer', 0)

        end
    end
end

function goodNoteHitPre(_, _, _, sustain)
    judgement = getPropertyFromGroup('notes', id, 'rating')
    if not sustain then
        if (getProperty('combo') + 1) < 10 then -- Don't ask why I'm adding 1. The pop-ups would spawn early if I didn't.
            if settings.showComboPopUp then
                setProperty('showCombo', false)
            end
            setProperty('showComboNum', false)
        else
            if settings.showComboPopUp then
                setProperty('showCombo', true)
            end
            setProperty('showComboNum', true)
        end
    end
end

function goodNoteHit(id, _, noteType, sustain)
    if sustain then
        if getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing' then
            setProperty('gf.holdTimer', 0)
        else
            setProperty('boyfriend.holdTimer', 0)
        end
    end
end

function noteMiss()
    playSound('missnote'..math.random(1,3)..'', 0.5)
end

function onEvent(eventName)
    if eventName == 'Change Character' then
        setHealthBarColors('FF0000', '66FF33')
    end
end

function onUpdateScore(miss)
    callMethodFromClass('flixel.tweens.FlxTween', 'cancelTweensOf', {instanceArg('scoreTxt'), {'scale.x', 'scale.y'}})
    setProperty('scoreTxt.text', 'Score:'..formatNumber(getProperty('songScore'))..'')
end

function onBeatHit()
    doScaleBump('iconP1', 1.2, 1, 0.15 / playbackRate, 'quadOut')
    doScaleBump('iconP2', 1.2, 1, 0.15 / playbackRate, 'quadOut')
end

function onCountdownTick()
    doScaleBump('iconP1', 1.2, 1, 0.15 / playbackRate, 'quadOut')
    doScaleBump('iconP2', 1.2, 1, 0.15 / playbackRate, 'quadOut')
end