function onCreate()
	-- background shit
	makeLuaSprite('oldh3atrbg', 'oldh3atr/oldh3atrbg', -480, -30);
scaleObject('oldh3atrbg', 7, 7)
setProperty('oldh3atrbg.antialiasing', false);
	setScrollFactor('oldh3atrbg', 1, 1);

makeLuaSprite('oldh3atrground', 'oldh3atr/oldh3atrground', -470, -44);
scaleObject('oldh3atrground', 7, 7)
setProperty('oldh3atrground.antialiasing', false);
	setScrollFactor('oldh3atrground', 1, 1);

makeLuaSprite('oldh3atrbackest', 'oldh3atr/oldh3atrbackest', -470, -42);
scaleObject('oldh3atrbackest', 7, 7)
setProperty('oldh3atrbackest.antialiasing', false);
	setScrollFactor('oldh3atrbackest', 1, 1);
	addLuaSprite('oldh3atrbackest', false);
	addLuaSprite('oldh3atrbg', false);
	addLuaSprite('oldh3atrground', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end