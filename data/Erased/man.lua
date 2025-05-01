debug = false

man = getRandomInt(1, 50)
click = false

function onStartCountdown()
	if man == 25 and not isAchievementUnlocked('egg') then
		--Cursor
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
		
		--Makes Hud Invis
		setProperty("healthBarBG.visible", false)
		setProperty('scoreTxt.visible',false)
		setProperty("healthBar.visible", false)
		setProperty('camGame.visible', false)
		
		--Adds Tree
		makeAnimatedLuaSprite('tree', 'tree', 400, 200)
		addAnimationByPrefix('tree','loop','tree', 8);
		addLuaSprite('tree', false)
		setObjectCamera('tree', 'hud')
		scaleObject('tree', 2, 2)
		setProperty('tree.antialiasing', false);
		
		--Adds the interactionBlock sprite, which is actually the sprite you are clicking on (it's usually invisible unless debug is on)
		makeLuaSprite('clickBox', 'clickBox', 550, 300)
		scaleObject('clickBox', 8, 12)
		setObjectCamera('clickBox', 'hud')
		setProperty('clickBox.antialiasing', false);
		addLuaSprite('clickBox', 'true')
			if debug == true then
				setProperty('clickBox.alpha', 1);
			else
				setProperty('clickBox.alpha', 0);
			end
		
		--Sound Related
		playMusic('man', 1, true)
		return Function_Stop;
	elseif man == 25 and isAchievementUnlocked('egg') then
		runTimer('delayAgain', 20)
		playMusic('wind', 0.5, true)
		
		setProperty("healthBarBG.visible", false)
		setProperty('scoreTxt.visible',false)
		setProperty("healthBar.visible", false)
		setProperty('camGame.visible', false)
		
		makeAnimatedLuaSprite('tree', 'tree', 400, 200)
		addAnimationByPrefix('tree','loop','tree', 8);
		addLuaSprite('tree', false)
		setObjectCamera('tree', 'hud')
		scaleObject('tree', 2, 2)
		setProperty('tree.antialiasing', false);
		
		return Function_Stop;
		
	end
end

function onCreatePost()
	if man == 25 then
		-- More HUD Stuff
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
	end
end


--Actual functionality
function onUpdate()
	if (getMouseX('hud') > getProperty('clickBox.x') and 
		getMouseY('hud') > getProperty('clickBox.y') and 
		getMouseX('hud') < getProperty('clickBox.x') + getProperty('clickBox.width') and 
		getMouseY('hud') < getProperty('clickBox.y') + getProperty('clickBox.height') and 
		mouseClicked('left')) and click == false then
		
		click = true
		removeLuaSprite('clickBox', 'true')
		playSound('egg')
		stopSound()
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
		runTimer('delay', 6)
		if achievementExists('egg') and not isAchievementUnlocked('egg') and man == 25 then 
			unlockAchievement('egg')
		end
	end
end

function onTimerCompleted(tag)
	if tag == "delay" then
		removeLuaSprite('tree', false)
		playMusic('wind', 0.5, true)
		runTimer('delayAgain', 20)
	end
	if tag == "delayAgain" then
		restartSong()
	end
end