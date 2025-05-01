--So that it only does it once.
once = false


--Changes GF's Stage Offsets so that the Cat isn't floating/in random places when spawned
function onUpdatePost()
	if string.sub(gfName, 1, 4) == 'cat' then
		if curStage == 'ASHL' and once == false then
			once = true
			triggerEvent('Set Property', 'gf.x', '400')
			triggerEvent('Set Property', 'gf.y', '0')
		end
		if curStage == 'h3atedbg' and once == false then
			once = true
			triggerEvent('Set Property', 'gf.x', '900')
			triggerEvent('Set Property', 'gf.y', '350')
		end
		if curStage == 'h3atedbgENC' and once == false then
			once = true
			triggerEvent('Set Property', 'gf.x', '900')
			triggerEvent('Set Property', 'gf.y', '350')
		end
		if curStage == 'NegativeZone' and once == false then
			once = true
			triggerEvent('Set Property', 'gf.x', '900')
			triggerEvent('Set Property', 'gf.y', '350')
		end
		if curStage == 'The Forest' and once == false then
			once = true
			triggerEvent('Set Property', 'gf.x', '700')
			triggerEvent('Set Property', 'gf.y', '100')
		end
	end
end
