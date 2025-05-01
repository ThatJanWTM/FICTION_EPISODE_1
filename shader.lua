local function getJustPressedKey(str)
	local b = keyboardJustPressed and keyboardJustPressed(str) or
		getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. str)
	return type(b) == "boolean" and b or false
end

local function getPressedKey(str)
	local b = keyboardPressed and keyboardPressed(str) or
		getPropertyFromClass("flixel.FlxG", "keys.pressed." .. str)
	return type(b) == "boolean" and b or false
end

local shaderName = "uh"

function onCreatePost()
	luaDebugMode = false
	reloadShader()
	
	runHaxeCode([[
		test_okay = function(?spr) {
			if (spr == null || spr.filters == null) return;
			spr.__cacheBitmap = null;
			spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
			spr.__cacheBitmapColorTransform = null;
		}
		
		test_updCam = function(?_) {
			test_okay(game.camGame.flashSprite);
			test_okay(game.camHUD.flashSprite);
			test_okay(game.camOther.flashSprite);
		}
	
		FlxG.signals.gameResized.add(test_updCam);
	]])
end

function onDestroy()
	runHaxeCode([[
		FlxG.signals.gameResized.remove(test_updCam);
	]])
end

function reloadShader()
	debugPrint("")
	
	runHaxeCode([[
		shaderName = "]] .. shaderName .. [[";
		game.camGame.flashSprite.filters = null;
		game.runtimeShaders.remove(shaderName);
		
		game.initLuaShader(shaderName);
		
		var shader0 = game.createRuntimeShader(shaderName);
		game.camGame.setFilters([new ShaderFilter(shader0)]);
	]])
end

function onUpdate()
	if (getJustPressedKey("PLUS") and getPressedKey("MINUS")) then
		reloadShader()
	
   end
end