--[[
    By ToufG#6291, please credit.
]]--

-------------------(change the word here)-------------------
local word = {
    'T',
    'H',
    'E',
    'M'
}
------------------------------------------------------------
local selected = 1
function onUpdate(elapsed)
    if keyboardJustPressed(word[selected]) then
        if selected < #word then
            selected = selected + 1
	    playSound ('scrollMenu')
        else
            secretWordTyped()
            selected = 1
        end
    end
end
function secretWordTyped()
    playSound ('secret/themTrigger')
    loadSong('them', 0)
end