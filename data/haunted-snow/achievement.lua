function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("hauntedSnow_nomiss")
	end
end