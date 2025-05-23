--Blah blah, they emote on combo of 50 and 200 so it's easy--

function goodNoteHit()
	if combo == 50 then
		playAnim("gf", "cheer")
		setProperty('gf.specialAnim', true)
	end
	if combo == 200 then
		playAnim("gf", "cheer")
		setProperty('gf.specialAnim', true)
	end
end