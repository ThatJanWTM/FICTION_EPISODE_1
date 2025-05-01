--Real Health Drain that I was struggling to make work because LUA sucks for some reason even tho it was my own fault cause I accidentally duplicated the script twice

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.01);
    end
end
