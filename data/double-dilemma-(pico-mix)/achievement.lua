function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("doublePico_nomiss")
	end
end