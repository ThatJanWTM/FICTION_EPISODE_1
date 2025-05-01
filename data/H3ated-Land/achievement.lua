function onCreatePost()
	if dadName == 'LilSnow-Shiny' and boyfriendName == 'Slimey-Shiny' and gfName == 'rockyShiny' then
		unlockAchievement("shinyTriple")
	end
end
function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("h3atedLand_nomiss")
	end
end