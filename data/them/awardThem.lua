function onCreate()
	if achievementExists('them_secret') and not isAchievementUnlocked('them_secret') then 
		unlockAchievement('them_secret')
	end
end