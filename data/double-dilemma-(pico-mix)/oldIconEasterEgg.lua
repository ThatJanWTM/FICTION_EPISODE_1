oldIcon = false

function onUpdate()
	if oldIcon == false and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NINE') then
		oldIcon = true
		runHaxeCode([[iconP1.changeIcon('bf-old');]])
		unlockAchievement("oldIcon")
	elseif oldIcon == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.NINE') then
		oldIcon = false
		runHaxeCode([[iconP1.changeIcon('pico');]])
	end
end