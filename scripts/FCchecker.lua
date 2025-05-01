
--Sets the Hud Text Yellow/Gold to signify FC.
function onCreatePost()
	setTextColor('scoreTxt', 'ffff00')
end

--Reverts it to white when you miss.
function noteMiss()
	if misses == 1 then
		setTextColor('scoreTxt', 'ffffff')
	elseif misses == 20 then
		setTextColor('scoreTxt', 'ff0000')
	end
end