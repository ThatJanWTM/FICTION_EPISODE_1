function onEndSong()
	if misses == 0 and not botPlay then
		unlockAchievement("spookSongPico_nomiss")
	end
end