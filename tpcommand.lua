---@type Plugin
local plugin = ...
plugin.name = "TP Command"
plugin.author = "Dingus"
plugin.description = "Adds a TP command that anyone can use to TP to set locations"


plugin.commands['/tp'] = { -- Only works on round map
	info = 'Pretty easy to get what this does, not case sensitive',
	usage = 'Burger, Soccer, SWT1, SWT2, CasinoFloor, CasinoRoof, Arena, Spike, TallBox, Rio, Skybridge, Connector, Suburb, Mall, Hondo, Silo, Silo 2.\n Not case sensitive.',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')
		local person = ply.human
		local tpto = string.lower(args[1])

		if tpto == "burger" then
			person:teleport(Vector(1466, 50, 1468))
			end
			
		if tpto == "swt1" then
			person:teleport(Vector(1110, 137, 1402))
			end	
		if tpto == "swt2" then
			person:teleport(Vector(1147, 137, 1475))
			end
		if tpto == "casinofloor" then
			person:teleport(Vector(1995, 50, 1463))
			end
		if tpto == "casinoroof" then
			person:teleport(Vector(1989, 101, 1480))
			end
		if tpto == "spike" then
			person:teleport(Vector(1051, 165, 1782))
			end	
		if tpto == "soccer" then
			person:teleport(Vector(1727, 29, 1733))
			end		
		if tpto == "tallbox" then
			person:teleport(Vector(1998.38, 166, 1494))
			end	
		if tpto == "rio" then
			person:teleport(Vector(1734, 77, 991))
			end	
		if tpto == "skybridge" then
			person:teleport(Vector(1240, 70, 1780))
			end	
		if tpto == "connector" then
			person:teleport(Vector(1266, 117, 1572))
			end			
		if tpto == "suburb" then
			person:teleport(Vector(1856, 41, 1509))
			end
		if tpto == "mall" then
			person:teleport(Vector(1341, 50, 1339))
			end		
		if tpto == "silo" then
			person:teleport(Vector(1721, 77, 1309))
			end
		if tpto == "silo2" then
			person:teleport(Vector(1614, 57, 1082))
			end		
		if tpto == "arena" then
			person:teleport(Vector(1739.32, 47, 1536.90))
			end	
		if tpto == "hondo" then
			person:teleport(Vector(1695, 49, 1259))
			end	
	end
}