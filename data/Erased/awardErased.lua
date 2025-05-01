function onCreate()
	if achievementExists('her_secret') and not isAchievementUnlocked('her_secret') then 
		unlockAchievement('her_secret')
	end
end