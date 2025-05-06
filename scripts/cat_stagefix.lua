local once = false

-- Mapping of stage names to GF position offsets
local gfOffsets = {
	ASHL = {x = 400, y = 0},
	h3atedBackground = {x = 900, y = 350},
	h3atedBackgroundEncore = {x = 900, y = 350},
	negaZone = {x = 900, y = 350},
	h3atedForests = {x = 700, y = 100}
}

function onUpdatePost()
	if not once and string.sub(gfName, 1, 3) == 'cat' then
		local offsets = gfOffsets[curStage]
		if offsets then
			once = true
			triggerEvent('Set Property', 'gf.x', tostring(offsets.x))
			triggerEvent('Set Property', 'gf.y', tostring(offsets.y))
		end
	end
end