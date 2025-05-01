-- simple script that changes the note color on the opponent's side
-- made by broster (@broster)
function setNoteColorDad(note, color1, color2, color3)
    setPropertyFromGroup('opponentStrums', note, 'rgbShader.r', getColorFromHex(color1))
    setPropertyFromGroup('opponentStrums', note, 'rgbShader.g', getColorFromHex(color2))
    setPropertyFromGroup('opponentStrums', note, 'rgbShader.b', getColorFromHex(color3))
    setPropertyFromGroup('opponentStrums', note, 'rgbShader.enabled', false)

    for i = 0, getProperty('unspawnNotes.length')-1 do
            if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --specifically changes the notes on the opponent's side
                if getPropertyFromGroup('unspawnNotes', i, 'noteData') == note then
                    setPropertyFromGroup('unspawnNotes', i, 'rgbShader.r', getColorFromHex(color1))
                    setPropertyFromGroup('unspawnNotes', i, 'rgbShader.g', getColorFromHex(color2))
                    setPropertyFromGroup('unspawnNotes', i, 'rgbShader.b', getColorFromHex(color3))
                end
            end
    end
end

function getColorFromHex(hex)
    if(hex:sub(0,2) == '0x') then hex = hex:sub(3) end
    if(#hex < 6) then hex = 'ff' .. hex end
    return tonumber('0x' .. hex)
end

function onCreatePost()
    --              ID  red       green     blue
    setNoteColorDad(0, '3e43ff', 'FFFFFF', '000260');
    setNoteColorDad(1, 'fffa3e', 'FFFFFF', '605200');
    setNoteColorDad(2, '3e43ff', 'FFFFFF', '000260');
    setNoteColorDad(3, 'fffa3e', 'FFFFFF', '605200');
end