function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("spookSong_nomiss")
	end
end