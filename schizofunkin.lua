local enabled = false
local reverseSchizoEnabled = false
setProperty('skipArrowStartTween', true)
function onCreatePost()
	luaDebugMode = true
	changeEnabled(false)
	--setProperty('cpuControlled', true)
end

--[[function onUpdatePost(elapsed)
	if keyboardJustPressed('G') then
		changeEnabled(not enabled)
	end

	if keyboardJustPressed('H') then
		reverseSchizoEnabled = not reverseSchizoEnabled
		setProperty('vocals.volume', reverseSchizoEnabled and 0 or 1)
		setProperty('boyfriend.visible', not reverseSchizoEnabled)
		setProperty('iconP1.visible', not reverseSchizoEnabled)
		setProperty('healthBar.rightBar.visible', not reverseSchizoEnabled)
		--setProperty('cpuControlled', reverseSchizoEnabled)
		for i = 0, getProperty('opponentStrums.length') do
			setProperty('playerStrums.members['..i..'].alpha', not reverseSchizoEnabled and 1 or 0)
		end
	end
end]]

function goodNoteHit()
	setProperty('vocals.volume', reverseSchizoEnabled and 0 or 1)
end

function onSongStart()
	--setPropertyFromClass('flixel.FlxG', 'sound.music.volume', enabled and 1 or 0)
end

function changeEnabled(en)
	enabled = en
	setProperty('dadGroup.visible', enabled)
	setProperty('gfGroup.visible', enabled)
	setProperty('iconP2.visible', enabled)
	setProperty('healthBar.leftBar.visible', enabled)
	setProperty('opponentVocals.volume', enabled and 1 or 0)
	for i = 0, getProperty('opponentStrums.length') do
		setProperty('opponentStrums.members['..i..'].alpha', enabled and 1 or 0)
	end
	--setPropertyFromClass('flixel.FlxG', 'sound.music.volume', enabled and 1 or 0)
end