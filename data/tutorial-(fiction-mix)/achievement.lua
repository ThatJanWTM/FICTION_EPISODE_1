function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("tutorial_nomiss")
	end
end