secretMeatSticker = getRandomInt(1, 50)

function onCreate()
	if secretMeatSticker == 25 then
		setPropertyFromClass("substates.StickerSubState", "STICKER_SET", "casey")
		setPropertyFromClass("substates.StickerSubState", "STICKER_PACK", "all")
	else
		setPropertyFromClass("substates.StickerSubState", "STICKER_SET", "fiction-stickers-set-1")
	end
end

function onDestroy()
	if achievementExists('meat') and not isAchievementUnlocked('meat') and secretMeatSticker == 25 then 
		unlockAchievement('meat')
	end
end