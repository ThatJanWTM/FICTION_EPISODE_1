--Funny little checks and stuff
local what = true
local how = true

function onUpdate()
	if inGameOver and what then
		what = false
		
		--Changes the Image depending on whether you got shiny or not
		if boyfriendName == 'h3atrHD' then
			makeLuaSprite('deadSnow', 'deadSnow', 0, 0)
			addLuaSprite('deadSnow', true)
			setObjectCamera('deadSnow', 'hud')
		elseif boyfriendName == 'h3atrHDShiny' then
			makeLuaSprite('deadSnow-shiny', 'deadSnow-shiny', 0, 0)
			addLuaSprite('deadSnow-shiny', true)
			setObjectCamera('deadSnow-shiny', 'hud')
		end
        
        -- Set up properties for the game over screen.
		setProperty("healthBarBG.visible", false)
		setProperty('scoreTxt.visible', false)
		setProperty("healthBar.visible", false)
		setProperty('camGame.visible', false)
        
		--I don't think this function_stop actually functions properly in this script but it works so idc
		return Function_Stop
	end
end