color = false

--Stops Cam Zooming + Cloud Scrolling Stuff
function onCreate()
	setProperty('camZoomingMult',0)

	--All the cloud stuff
	createInstance('h3atClouds', 'flixel.addons.display.FlxBackdrop', {})
	loadGraphic('h3atClouds', 'ASHL/Clouds')
	scaleObject('h3atClouds', 6, 6, false)
	setProperty('h3atClouds.y', -390)
	setProperty('h3atClouds.alpha', 0.5)
	setProperty('h3atClouds.velocity.x', -100)

	addInstance('h3atClouds', true)
end

function onUpdate()
	if color == false then
		setTimeBarColors('00FF00', '004000')
		color = true
	end
end
