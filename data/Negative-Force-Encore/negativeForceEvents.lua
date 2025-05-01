function onCreate()
	addHaxeLibrary("Lib", "openfl")
	setProperty('skipCountdown', true)
	setProperty('camHUD.visible', false)
	setProperty('camGame.visible', false)
	precacheImage("characters/secret/ABC")
	precacheImage("SpotEye")
end

function setFullScreen(gaga)
	setPropertyFromClass("openfl.Lib", "application.window.fullscreen", gaga)
end

function setWindowTitle(title)
	setPropertyFromClass("openfl.Lib", "application.window.title", title)
end

function toggleHUD(visible)
	setProperty('strumLineNotes', visible)
	setProperty('timeBarBG', visible)
	setProperty('timeBar', visible)
	setProperty('timeTxt', visible)
	setProperty('iconP1', visible)
	setProperty('iconP2', visible)
	setProperty('scoreTxt', visible)
	setProperty('healthBarBG', visible)
	setProperty('healthBar', visible)
end

local stepActions = {	
	[1] = function()
		setFullScreen(false)
		setWindowTitle("NEGATIVE")
	end,
	[4] = function() setWindowTitle("NEGATIVE FORCE") end,
	[8] = function() setWindowTitle("NEGATIVE FORCE EN-") end,
	[12] = function() setWindowTitle("NEGATIVE FORCE ENCORE") end,
	[16] = function()
		setProperty('camHUD.visible', true)
		setProperty('camGame.visible', true)
	end,
	[272] = function()
		setWindowTitle("THE CHANGE")
		makeLuaSprite('SpotEye', 'ASHL/nega/SpotEye', 0, 0)
		setObjectCamera('SpotEye', 'HUD')
		scaleObject('SpotEye', 5, 6)
		addLuaSprite('SpotEye', true)
		setProperty('SpotEye.visible', true)
	end,
	[528] = function()
		setWindowTitle("THE PLAN")
		setProperty('SpotEye.visible', false)
	end,
	[784] = function()
		setWindowTitle("THE DROP")
		setProperty('SpotEye.visible', true)
	end,
	[1040] = function()
		setWindowTitle("THE PLAN")
		setProperty('SpotEye.visible', false)
	end,
	[1296] = function()
		setWindowTitle("THE FALL")
		setProperty('SpotEye.visible', true)
	end,
	[1552] = function()
		setProperty('camGame.visible', false)
		toggleHUD(false)
		setProperty('Negative.visible', false)
		setProperty('SpotEye.visible', false)
		setProperty('dad.alpha', 0)
		setProperty('bf.alpha', 0)
		setFullScreen(true)
		setWindowTitle("THE MEETING")
	end,
	[1584] = function()
		setProperty('camGame.visible', true)
		setWindowTitle("why you not in fullscreen")
		toggleHUD(true)
		setProperty('dad.alpha', 50)
	end,
	[1840] = function()
		setWindowTitle("▯▯▯▯")
		toggleHUD(false)
		setProperty('camGame.visible', false)
		makeAnimatedLuaSprite('Static', 'ASHL/nega/Static', 0, 0)
		addAnimationByPrefix('Static','loop','static',30,true)
		setFullScreen(false)
	end
}

function onStepHit()
	if stepActions[curStep] then
		stepActions[curStep]()
	end
end

function onDestroy()
	setWindowTitle("FNF: Fiction Overload")
end

function  onGameOver()
	setWindowTitle("TRY AGAIN.")
end