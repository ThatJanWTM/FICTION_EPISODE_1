--Cam Options--
bfZoom = 0.9 --The Zoom amount on the player (default is 1.05, but on mainStage it's 0.9)
dadZoom = 0.85 --The Zoom amount on the opponent (default is 1.05, but on mainStage it's 0.9)
gfZoom = 0.85 --The Zoom amount on the opponent (default is 1.05, but on mainStage it's 0.9)

editCamSpeed = false
camSpeed = 1 --The speed the camera should go (default is stage dependant but usually 1)

--Actual code, no need to modify these--

charTurn = 0

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
		if value1 == 'BF' then
			bfZoom = value2
		elseif value1 == 'Dad' then
			dadZoom = value2
		elseif value1 == 'GF' then
			gfZoom = value2

		end
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
	
 	