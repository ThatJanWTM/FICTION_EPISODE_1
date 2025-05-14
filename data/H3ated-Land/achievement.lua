function onCreatePost()
	if dadName == 'h3atr-mini' and boyfriendName == 'slimey-mini-shiny' and gfName == 'sharpy-mini' then
		unlockAchievement("shinyTriple")
	end
end
function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("h3atedLand_nomiss")
	end
end