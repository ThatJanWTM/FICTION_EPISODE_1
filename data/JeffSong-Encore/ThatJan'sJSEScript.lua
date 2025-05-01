function onStepHit()
	if curStep == 512 then
		setProperty('ej.visible', false);

		makeLuaSprite('evilSchoolBG', 'weeb/evilSchoolBG',-250, 70);
		setLuaSpriteScrollFactor('evilSchoolBG', 0.8, 0.9);
		scaleObject('evilSchoolBG', 6,6);
		setProperty('evilSchoolBG.antialiasing', false);
		makeLuaSprite('evilSchoolFG', 'weeb/evilSchoolFG', -125, 70);
		setLuaSpriteScrollFactor('evilSchoolFG', 0.8, 0.9);
		scaleObject('evilSchoolFG', 6,6);
          	setProperty('evilSchool.antialiasing', false);
		if not lowQuality then
			makeAnimatedLuaSprite('bgGhouls', 'weeb/bgGhouls',-150, 220);
			setLuaSpriteScrollFactor('bgGhouls', 0.8, 0.8);
			scaleObject('bgGhouls', 6, 6);
        		setProperty('bgGhouls.antialiasing', false);
	
			makeAnimatedLuaSprite('animatedEvilSchool', 'weeb/animatedEvilSchool',-900, -1000);
    			setLuaSpriteScrollFactor('animatedEvilSchool', 0.8, 0.8);		
			scaleObject('animatedEvilSchool',6,6);
			setProperty('animatedEvilSchool.antialiasing', false);
		
		
			end
		addLuaSprite('evilSchoolFG', false); --Added offscreen before it starts moving.
		addLuaSprite('evilSchoolBG', false);
	
    		addLuaSprite('animatedEvilSchool', false); --Added offscreen before it starts moving.
		addAnimationByPrefix('animatedEvilSchool', 'idle', 'background instance', 24, true);
		addLuaSprite('bgGhouls', false);
		addAnimationByPrefix('bgGhouls', 'idle', 'BG freaks glitch instance', 24, true);
		addantialiasing('bgGhouls',false);
	end
	if curStep == 768 then
		setProperty('ej.visible', true);
		setProperty('evilSchoolBG.visible', false);
		setProperty('evilSchoolFG.visible', false);
		setProperty('bgGhouls.visible', false);
		setProperty('animatedEvilSchool.visible', false);
	end
end

function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Fiction Overload")
end