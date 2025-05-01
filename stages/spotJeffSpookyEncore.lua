color = false

function onUpdate()

	if color == false then
		setTimeBarColors('0000FF', '000040')
		color = true
	end
end

function onCreate()
	markAsPicoCapable()
end

--setSpriteShader('dad', 'adjustColor')
--setShaderFloat('dad', 'hue', -15)
--setShaderFloat('dad', 'saturation', 50)
--setShaderFloat('dad', 'contrast', 0)
--setShaderFloat('dad', 'brightness', 22)

--setSpriteShader('gf', 'adjustColor')
--setShaderFloat('gf', 'hue', -9)
--setShaderFloat('gf', 'saturation', 0)
--setShaderFloat('gf', 'contrast', -4)
--setShaderFloat('gf', 'brightness', -30)

--setSpriteShader('boyfriend', 'adjustColor')
--setShaderFloat('boyfriend', 'hue', 12)
--setShaderFloat('boyfriend', 'saturation', 0)
--setShaderFloat('boyfriend', 'contrast', 7)
--setShaderFloat('boyfriend', 'brightness', -23)