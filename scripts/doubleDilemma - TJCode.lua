function onCreate()
	-- Loads Double Dilemma if BF is player and opponent (gf not needed)
	if dadName == 'bf' and boyfriendName == 'bf' then
		loadSong('double-dilemma', 0)
	end
end