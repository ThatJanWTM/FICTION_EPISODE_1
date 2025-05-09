point = false

function goodNoteHit(index, column, type, isSustain)
	if isSustain then
		point = true
	end
	if not getPropertyFromGroup('notes', index, 'nextNote') then
		point = false
	end
end

function noteMiss()
	point = false
end

function onUpdate()
	if point == true then
		addScore(1)
	end
end