function onUpdate()
	setSpriteShader('dad', 'adjustColor')
	setShaderFloat('dad', 'hue', -30)
	setShaderFloat('dad', 'saturation', -20)
	setShaderFloat('dad', 'contrast', 0)
	setShaderFloat('dad', 'brightness', -30)

	setSpriteShader('gf', 'adjustColor')
	setShaderFloat('gf', 'hue', -9)
	setShaderFloat('gf', 'saturation', 0)
	setShaderFloat('gf', 'contrast', -4)
	setShaderFloat('gf', 'brightness', -30)

	setSpriteShader('boyfriend', 'adjustColor')
	setShaderFloat('boyfriend', 'hue', 12)
	setShaderFloat('boyfriend', 'saturation', 0)
	setShaderFloat('boyfriend', 'contrast', 7)
	setShaderFloat('boyfriend', 'brightness', -23)

end