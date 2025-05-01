--[[
    By ToufG#6291, please credit.
]]--

-------------------(change the word here)-------------------
local word = {
    'C',
    'A',
    'T'
}
------------------------------------------------------------
local selected = 1
local once = false
function onUpdate(elapsed)
    if keyboardJustPressed(word[selected]) and not once then
        if selected < #word then
            selected = selected + 1
	    playSound ('cat/catSelect')
        else
            secretWordTyped()
	    onAwardThing()
            selected = 1
        end
    end
end
function secretWordTyped()
	once = true
	onCat()
end


function onCat()
	if string.sub(gfName, 1, 4) == 'nene' then
		playSound ('cat/catSpeakerDenied')
		unlockAchievement('neneNope')
	else
		playSound ('cat/catSpeakerSound')
		triggerEvent('Change Character', 'GF', 'cat')
		unlockAchievement('cat')
	end
end