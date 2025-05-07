function onCreate()
	setPropertyFromClass("substates.StickerSubState", "STICKER_PACK", "h3ated")
end

function onCreatePost()
	setTextFont('scoreTxt', 'FictionPixel.ttf');
	setTextSize('scoreTxt', 16)
	setProperty('scoreTxt.antialiasing', false);
	setProperty('scoreTxt.borderSize', 2);
	
	setTextFont('timeTxt', 'FictionPixel.ttf');
	setTextSize('timeTxt', 32)
	setProperty('timeTxt.antialiasing', false);
	setProperty('timeTxt.borderSize', 4);

	setTextFont('JukeBoxText', 'FictionPixel.ttf');
	setTextSize('JukeBoxText', 16)
	setTextFont('JukeBoxSubText', 'FictionPixel.ttf');
	setTextSize('JukeBoxSubText', 24)

	loadGraphic('healthBar.bg', 'ASHL/healthBar')
	loadGraphic('timeBar.bg', 'ASHL/timeBar')
	
end