color = false

function onCreate()
	--All the cloud stuff
	createInstance('h3atClouds', 'flixel.addons.display.FlxBackdrop', {})
	loadGraphic('h3atClouds', 'h3atr/h3atrclouds')
	scaleObject('h3atClouds', 6, 6, false)
	setProperty('h3atClouds.y', 525)
	setProperty('h3atClouds.x', 61)
	setProperty('h3atClouds.alpha', 0.75)
	setProperty('h3atClouds.velocity.x', -100)

	setObjectOrder('h3atClouds', 3);
	addInstance('h3atClouds', false)

end


function onUpdate()
	if color == false then
		setTimeBarColors('00FF00', '004000')
		color = true
	end
end

--{
			--"x": 61,
			--"y": 104,
			--"scale": [
				--6,
				--6
			--],
			--"image": "h3atr/h3atrclouds",
			--"flipX": false,
			--"filters": 2,
			--"color": "FFFFFF",
			--"angle": 0,
			--"name": "h3atedClouds",
			--"antialiasing": false,
			--"flipY": false,
			--"scroll": [
				--1.15,
				--1.1
			--],
			--"alpha": 1,
			--"type": "sprite"
		--},