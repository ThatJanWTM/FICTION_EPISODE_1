local what = true
local how = true

function onUpdate()
	if inGameOver and what then
		what = false
		makeLuaSprite('deadSnow', 'deadSnow', 0, 0)
		addLuaSprite('deadSnow')
		setObjectCamera('deadSnow', 'hud')
		setProperty("healthBarBG.visible", false)
		setProperty('scoreTxt.visible',false)
		setProperty("healthBar.visible", false)
		setProperty('camGame.visible', false)
		return Function_Stop;
	end
end