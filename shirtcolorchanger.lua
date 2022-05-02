---@type Plugin
local plugin = ...
plugin.name = 'colorchanger'
plugin.author = 'Dingus'
plugin.description = 'lets players change colors'



plugin.commands['/color'] = {
	info = 'Changes your clothes color',
	usage = 'Black, Blue, Pink, Red, White, Green.',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')
		local person = ply
		local colorpick = string.lower(args[1])
		
      
		if colorpick == "black" then
			if person.human.model == 0 then -- if shirt 
				person.account.data.colorpicked = 9
				person.human.suitColor = 9
				person.human.lastUpdatedWantedGroup = -1
				person:sendMessage(string.format("Your shirt color is: %s", colorpick))
			else
				person:sendMessage("You cant change color in a suit")
			end
		elseif colorpick == "blue" then
			if person.human.model == 0 then -- if shirt 
            	person.account.data.colorpicked = 10
				person.human.suitColor = 10
				person.human.lastUpdatedWantedGroup = -1
            	person:sendMessage(string.format("Your shirt color is: %s", colorpick))
			else
				person:sendMessage("You cant change color in a suit")
			end
		elseif colorpick == "pink" then
			if person.human.model == 0 then -- if shirt 
            	person.account.data.colorpicked = 1
				person.human.suitColor = 1
				person.human.lastUpdatedWantedGroup = -1
            	person:sendMessage(string.format("Your shirt color is: %s", colorpick))
			else
				person:sendMessage("You cant change color in a suit")
			end
		elseif colorpick == "red" then
			if person.human.model == 0 then -- if shirt 
            	person.account.data.colorpicked = 5
				person.human.suitColor = 5
				person.human.lastUpdatedWantedGroup = -1
            	person:sendMessage(string.format("Your shirt color is: %s", colorpick))
			else
				person:sendMessage("You cant change color in a suit")
			end
		elseif colorpick == "white" then
			if person.human.model == 0 then -- if shirt 
            	person.account.data.colorpicked = 0
				person.human.suitColor = 0
				person.human.lastUpdatedWantedGroup = -1
            	person:sendMessage(string.format("Your shirt color is: %s", colorpick))
			else
				person:sendMessage("You cant change color in a suit")
			end
		elseif colorpick == "green" then
			if person.human.model == 0 then -- if shirt 
            	person.account.data.colorpicked = 11
				person.human.suitColor = 11
				person.human.lastUpdatedWantedGroup = -1
            	person:sendMessage(string.format("Your shirt color is: %s", colorpick))
			else
				person:sendMessage("You cant change color in a suit")
			end
		else
			person:sendMessage("Invalid Color!!")
		end

	end
}




