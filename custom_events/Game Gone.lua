--Credit Team Fiction--
function onEvent(name, value1, value2)
	if name == "Game Gone" then
		setProperty('camHUD.visible', false)
		setProperty('camGame.visible', false)
	end
end