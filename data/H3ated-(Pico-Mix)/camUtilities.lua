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
	if focus == 'boyfriend' then
		charTurn = 1
	end
	if focus == 'dad' then
		charTurn = 2
	end
	if focus == 'gf' == true then
		charTurn = 3
	end
end

function onEvent(name, value1, value2)
	if name == 'changeZoomNumber' then -- Change the name to your choice
		if value1 == 'BF' and poopin == true then
			bfZoom = value2
		elseif value1 == 'Dad' and poopin == true then
			dadZoom = value2
		elseif value1 == 'GF' and poopin == true then
			gfZoom = value2

		end
	end
end

function onStepHit()
	if curStep == 656 then
		poopin = false
		setProperty('camZooming', false)
		doTweenAlpha('HUDleave', 'camHUD', 0, 8.735, 'linear')
		doTweenZoom('testZoomTween', 'game', 1.3, 17.47, 'linear')
	end
end


function onTweenCompleted()
	if tag == 'testZoomTween' then
		poopin = true
		doTweenAlpha('HUDback', 'camHUD', 1, 0.5, 'circOut')
		setProperty('camZooming', true)
	end
end

function onUpdate()
	if charTurn == 1 then
		setProperty('defaultCamZoom', bfZoom)
	elseif charTurn == 2 then
		setProperty('defaultCamZoom', dadZoom)
	elseif charTurn == 3 then
		setProperty('defaultCamZoom', gfZoom)
	end
end

