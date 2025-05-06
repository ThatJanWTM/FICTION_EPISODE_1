--This code is completely utterly useless and serves no purpose
--This is because Double Dilemma used to be a secret song, but was made naturally accessable by release
--Thus this code remains as the remnant of what use to be a secret
--Remaining here as a reminder, that you can do "id dadName ==" as a command, which is kinda useful i think


function onCreate()
	-- Loads Double Dilemma if BF is player and opponent (gf not needed)
	if dadName == 'bf' and boyfriendName == 'bf' then
		loadSong('double-dilemma', 0)
	end
end