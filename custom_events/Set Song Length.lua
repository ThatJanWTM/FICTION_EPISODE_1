local defaultLength = 0
local idk = 0
local songPosition = 0
function onCreatePost()
    defaultLength = getPropertyFromClass('flixel.FlxG', 'sound.music.length')
    idk = defaultLength
    --debugPrint(tostring(defaultLength))
end
function onUpdate(elapsed)
end
function onUpdatePost(elapsed)
end
function onSongStart()
    defaultLength = getPropertyFromClass('flixel.FlxG', 'sound.music.length')
end
function stringSplit(str, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end
function stringTrim(s)
    return s:match( "^%s*(.-)%s*$" )
end
function onEvent(n, v1, v2)
    if n == 'Set Song Length' then
        local funnyyy = 0
        local fnuuyyy = 'linear'
        if v2 == '' then
            -- uhhhhh
        else
            funnyyy = stringTrim(stringSplit(v2, ',')[1])
            fnuuyyy = stringTrim(stringSplit(v2, ',')[2])
            fnuuyyy = fnuuyyy:lower()
            fnuuyyy = fnuuyyy:gsub(' ', '')
            fnuuyyy = fnuuyyy:gsub('step', 'Step')
            if stringEndsWith(fnuuyyy, 'in') then 
                fnuuyyy:gsub('in', 'In')
            elseif stringEndsWith(fnuuyyy, 'inout') then 
                fnuuyyy:gsub('inout', 'InOut')
            elseif stringEndsWith(fnuuyyy, 'out') then 
                fnuuyyy:gsub('out', 'Out')
            end
        end
        --debugPrint(funnyyy, ', ', fnuuyyy)
        if string.lower(v1) == 'default' then
            idk = defaultLength
        else
            idk = tonumber(v1)
        end
        if tonumber(funnyyy) <= 0 then
            setProperty('songLength', idk)
            songLength = idk
        elseif tonumber(funnyyy) > 0 then
            addHaxeLibrary('FunkinLua')
            addHaxeLibrary('flixel.FlxG') -- useless???
            addHaxeLibrary('flixel.system.FlxSound') -- useless???
            runHaxeCode([[
                var targetValue = ]]..idk..[[;
                var duration = ]]..funnyyy..[[;
                var tweenTag = 'songLengthTweenThingHahaFunnyHilarious';


                // tween shits //
                if(game.modchartTweens.exists(tweenTag)) {
                   game.modchartTweens.get(tweenTag).cancel();
                   game.modchartTweens.get(tweenTag).destroy();
                   game.modchartTweens.remove(tweenTag);
                }
				game.modchartTweens.set(tweenTag, FlxTween.tween(game, {songLength: targetValue}, duration, {ease: FlxEase.]]..fnuuyyy..[[,
                    onComplete: function(twn:FlxTween) {
                        game.callOnLuas('onTweenCompleted', [tweenTag]);
                        game.modchartTweens.remove(tweenTag);
                    }
                }));
            ]])
        end
    end
end