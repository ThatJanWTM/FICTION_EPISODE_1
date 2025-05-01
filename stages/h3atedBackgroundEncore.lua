color = false

function onUpdate()
	if color == false then
		setTimeBarColors('00FF00', '004000')
		color = true
	end
end

function onCreate()
	
end


function onCreate()

	--sets Character object groups

	--PicoCode
	markAsPicoCapable()

	--All the back stars stuff
	createInstance('h3atBackStars', 'flixel.addons.display.FlxBackdrop', {})
	loadGraphic('h3atBackStars', 'h3atr/encore/h3atrstars')
	scaleObject('h3atBackStars', 6, 6, false)
	setProperty('h3atBackStars.y', 525)
	setProperty('h3atBackStars.x', 61)
	setProperty('h3atBackStars.alpha', 0.25)
	setProperty('h3atBackStars.velocity.x', -100)

	setObjectOrder('h3atBackStars', 2);
	addInstance('h3atBackStars', false)


	--All the front stars stuff
	createInstance('h3atFrontStars', 'flixel.addons.display.FlxBackdrop', {})
	loadGraphic('h3atFrontStars', 'h3atr/encore/h3atrclouds')
	scaleObject('h3atFrontStars', 6, 6, false)
	setProperty('h3atFrontStars.y', 525)
	setProperty('h3atFrontStars.x', 61)
	setProperty('h3atFrontStars.alpha', 0.5)
	setProperty('h3atFrontStars.velocity.x', 150)

	setObjectOrder('h3atFrontStars', 8);
	addInstance('h3atFrontStars', false)

end