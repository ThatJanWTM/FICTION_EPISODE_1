function onCreatePost()
	setProperty('timeBarBG.visible',false)
	setProperty('timeBar.visible',false)
	setProperty('timeTxt.visible',false)
	setProperty('scoreTxt.visible',false)
	setProperty('scoreTxt.visible',false)
	makeLuaText('theirMessage', 'It does not matter, just have fun', 1280, 0, (downscroll and 114 or 680));
	setTextBorder("theirMessage", 2, '000000')
	setTextAlignment('theirMessage', 'CENTER')
	setTextSize('theirMessage', 20)
	if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('theirMessage') end
  
end