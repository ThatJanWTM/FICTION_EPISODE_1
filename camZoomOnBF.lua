--Blue is a BITCH BABY and he is fucking STUPID and REMOVED my CREDITS--

--Edit these values, it's easier--
---------------------------------
bfZoom = 0.5
dadZoom = 0.45


--11 Lines of Code--
---------------------------------
function onCreate()
	setProperty('camZooming', true)
end

function onMoveCamera(focus)
    if focus == 'boyfriend' then
		setProperty('defaultCamZoom', bfZoom)
	end
	if focus == 'dad' then
		setProperty('defaultCamZoom', dadZoom)
	end
end