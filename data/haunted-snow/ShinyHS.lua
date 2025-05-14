veryIncreasedShinyOdds = true --cheater lol lmfao (higher rarities for showcases how else)

shinyPlayer = {true, "h3atr-playable", "h3atr-playable-shiny"} --1st value: shiny enabled, 2nd value: base character, 3rd value: shiny version
shinyOpponent = {false, "LilSnow", "LilSnow-Shiny"} --1st value: shiny enabled, 2nd value: base character, 3rd value: shiny version
shinyGF = {false, "rocky", "rockyShiny"} --1st value: shiny enabled, 2nd value: base character, 3rd value: shiny version

-- i'm annoyed, i'm gonna ruin the whole point of the script.
forceShinyPlayer = false
forceShinyOpponent = false
forceShinyGF = false

-- don't touch the rest ok?
countdownStart = false

isBFShiny = false
isOpponentShiny = false
isGFShiny = false

shinyChancePlr = 0
shinyChanceOpponent = 0
shinyChanceGF = 0

function onCreatePost()
    if shinyPlayer[1] == true then
        makeAnimatedLuaSprite("sparkBF", "shinySparkles", 0, 0)
        addAnimationByPrefix("sparkBF", "spark", "Shiny", 36, false)
        setProperty('sparkBF.antialiasing', false)
        scaleObject("sparkBF", 8, 8)

        setProperty("sparkBF.alpha", 0)
        setProperty("sparkBF.x", getProperty("boyfriend.x") - 0) -- bf x offset
        setProperty("sparkBF.y", getProperty("boyfriend.y") - 100) -- bf y offset
        addLuaSprite("sparkBF", true)
	
    end
    if shinyOpponent[1] == true then
        makeAnimatedLuaSprite("sparkDAD", "shinySparkles", 0, 0)
        addAnimationByPrefix("sparkDAD", "spark", "Shiny", 36, false)
        addLuaSprite("sparkDAD", true)
        setProperty('sparkDAD.antialiasing', false)
        scaleObject("sparkDAD", 6, 6)
	

        setProperty("sparkDAD.alpha", 0)
        setProperty("sparkDAD.x", getProperty("dad.x") - 125) -- dad x offset
        setProperty("sparkDAD.y", getProperty("dad.y") - 100) -- dad y offset
    end
    if shinyGF[1] == true then
        makeAnimatedLuaSprite("sparklesGF", "shinySparkles", 0, 0)
        addAnimationByPrefix("sparklesGF", "spark", "Shiny", 36, false)
        addLuaSprite("sparklesGF", true)
        setProperty('sparklesGF.antialiasing', false)
        scaleObject("sparklesGF", 6, 6)
	

        setProperty("sparklesGF.alpha", 0)
        setProperty("sparklesGF.x", getProperty("gf.x") - 125) -- gf x offset
        setProperty("sparklesGF.y", getProperty("gf.y") - 100) -- gf x offset
    end
end

function onStartCountdown()
    if veryIncreasedShinyOdds == true then
        shinyChancePlr = getRandomInt(2046, 2050)
        shinyChanceOpponent = getRandomInt(2046, 2050)
        shinyChanceGF = getRandomInt(2046, 2050)
    else
        shinyChancePlr = getRandomInt(1, 4096)
        shinyChanceOpponent = getRandomInt(1, 4096)
        shinyChanceGF = getRandomInt(1, 4096)
    end

    if countdownStart == false then
        runTimer("shinyTimer", 1)
        if shinyPlayer[1] == true then
            if boyfriendName == shinyPlayer[2] then
                if shinyChancePlr == 2048 or forceShinyPlayer == true then
                    isBFShiny = true
                    runTimer("shinySound", 0.3)
                    triggerEvent("Change Character", "bf", shinyPlayer[3])
		    addAchievementScore('shiny-teeth', 1)
		    setPropertyFromClass("substates.StickerSubState", "STICKER_PACK", "shiny")
                end
            end
        end
        if shinyOpponent[1] == true then
            if dadName == shinyOpponent[2] then
                if shinyChanceOpponent == 2048 or forceShinyOpponent == true then
                    isOpponentShiny = true
                    runTimer("shinySound", 0.3)
                    triggerEvent("Change Character", "dad", shinyOpponent[3])
                    addAchievementScore('shiny-teeth', 1)
		    setPropertyFromClass("substates.StickerSubState", "STICKER_PACK", "shiny")
                end
            end
        end
        if shinyGF[1] == true then
            if gfName == shinyGF[2] then
                if shinyChanceGF == 2048 or forceShinyGF == true then
                    isGFShiny = true
                    runTimer("shinySound", 0.3)
                    triggerEvent("Change Character", "gf", shinyGF[3])
                    addAchievementScore('shiny-teeth', 1)
		    setPropertyFromClass("substates.StickerSubState", "STICKER_PACK", "shiny")
                end
            end
        end
    end

    if countdownStart == false then
        return Function_Stop
    else
        return Function_Continue
    end
end

function onTimerCompleted(tag)
	if tag == "shinyTimer" then
        countdownStart = true
		startCountdown();
        setProperty("sparkBF.alpha", 0)
        setProperty("sparkDAD.alpha", 0)
        setProperty("sparklesGF.alpha", 0)
	
	end
    if tag == "shinySound" then
        playSound("ASHL/ShinySFX")
        if isBFShiny == true then
            setProperty("sparkBF.alpha", 1)
            playAnim("sparkBF", "spark", true)
        end
        if isOpponentShiny == true then
            setProperty("sparkDAD.alpha", 1)
            playAnim("sparkDAD", "spark", true)
        end
        if isGFShiny == true then
            setProperty("sparklesGF.alpha", 1)
            playAnim("sparklesGF", "spark", true)
        end
    end
end