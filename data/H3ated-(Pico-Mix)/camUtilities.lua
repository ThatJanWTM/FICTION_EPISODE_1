--Cam Options--
bfZoom = 0.9 --The Zoom amount on the player (default is 1.05, but on mainStage it's 0.9)
dadZoom = 0.85 --The Zoom amount on the opponent (default is 1.05, but on mainStage it's 0.9)
gfZoom = 0.85 --The Zoom amount on the opponent (default is 1.05, but on mainStage it's 0.9)

editCamSpeed = false
camSpeed = 1 --The speed the camera should go (default is stage dependant but usually 1)



poopin = true


--Actual code, no need to modify these--
function onCreate()
	setProperty('camZooming', true)
	
	if editCamSpeed == true then
		setProperty('cameraSpeed', camSpeed)
	end
end

function onMoveCamera(focus)
	if focus == 'boyfriend' and poopin == true then
		setProperty('defaultCamZoom', bfZoom)
	end
	if focus == 'dad' and poopin == true then
		setProperty('defaultCamZoom', dadZoom)
	end
	if focus == 'gf' and poopin == true then
		setProperty('defaultCamZoom', gfZoom)
	end
end

function onEvent(name, value1, value2)
	if name == 'changeZoomNumber' then -- Change the name to your choice
		if value1 == 'BF' then
			bfZoom = value2
		elseif value1 == 'Dad' then
			dadZoom = value2
		elseif value1 == 'GF' then
			gfZoom = value2

		end
	end
end

function onStepHit()
	if curStep == 656 then
		poopin = false
		setProperty('camZooming', false)
		doTweenZoom('testZoomTween', 'game', 1.3, 17.47, 'linear')
	end
end


function onTweenCompleted()
	if tag == 'testZoomTween' then
		poopin = true
		setProperty('camZooming', true)
	end
end

