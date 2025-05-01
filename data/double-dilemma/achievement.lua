function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("double_nomiss")
	end
end