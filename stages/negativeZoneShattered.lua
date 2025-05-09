color = false

function onUpdate()
	if color == false then
		setTimeBarColors('FF00FF', '400040')
		color = true
	end
end

function onCreate()

	--All the front stars stuff
	createInstance('h3atFrontStars', 'flixel.addons.display.FlxBackdrop', {})
	loadGraphic('h3atFrontStars', 'h3atr/encore/h3atrclouds')
	scaleObject('h3atFrontStars', 6, 6, false)
	setProperty('h3atFrontStars.y', 525)
	setProperty('h3atFrontStars.x', 61)
	setProperty('h3atFrontStars.alpha', 0.1)
	setProperty('h3atFrontStars.velocity.x', 150)

	setObjectOrder('h3atFrontStars', 8);
	addInstance('h3atFrontStars', false)

end