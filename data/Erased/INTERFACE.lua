--INTERFACE

function onCreate()
	setProperty('timeBarBG.visible',false)
	setProperty('timeBar.visible',false)
	setProperty('timeTxt.visible',false)
	setProperty('scoreTxt.visible',false)
	setProperty('scoreTxt.visible',false)
	makeLuaText('MYmessage', '. . .', 1280, 0, (downscroll and 114 or 680));
	setTextBorder("MYmessage", 2, '000000')
	setTextAlignment('MYmessage', 'CENTER')
	setTextSize('MYmessage', 10)
	if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('MYmessage') end
  
end
