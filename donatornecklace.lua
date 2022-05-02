---@type Plugin
local plugin = ...
plugin.name = "Donator perks"
plugin.author = "Dingus"
plugin.description = "Gives donators perks"


donatorList = { -- phone numbers must be in this format (xxxxxxx)
    1111111,
    2222222,
}

plugin.commands['/necklace'] = { 
	info = 'Select necklace, donator only',
	usage = 'Small, Big, None.',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')

        local option = string.lower(args[1])
        for k, v in ipairs(donatorList) do
            if v == ply.account.phoneNumber then 
                if option == "small" then
                    ply.account.data.necklacepreference = 1
                    ply.human.necklace = 1
                    ply.human.lastUpdatedWantedGroup = -1
                    ply:sendMessage("Necklace set to: Small!") 
                    ply:sendMessage("Thank you for donating!!") 
                elseif option == "big" then
                    ply.account.data.necklacepreference = 2
                    ply.human.necklace = 2
                    ply.human.lastUpdatedWantedGroup = -1
                    ply:sendMessage("Necklace set to: Big!") 
                    ply:sendMessage("Thank you for donating!!") 
                elseif option == "none" then
                    ply.account.data.necklacepreference = 0
                    ply.human.necklace = 0
                    ply.human.lastUpdatedWantedGroup = -1
                    ply:sendMessage("Necklace set to: None!") 
                    ply:sendMessage("Thank you for donating!!") 
                else
                    ply:sendMessage("Not a valid option")
                end 
            end
        end 
    end

} 

plugin:addHook("PostHumanCreate", function(Human)
	if Human.player.isBot ~= true then	
		for k, v in ipairs(donatorList) do
            if Human.player.account.phoneNumber == v then 
                Human.player.data.isDonator = true
				Human.necklace = Human.player.account.data.necklacepreference or math.random(1,2)
				Human.player:sendMessage(string.format("%s! Thank you for donating! <3", Human.player.name))
            end
        end 
    end
end)

plugin.commands['/donatorcolor'] = { 
	info = 'Donator only colors',
	usage = 'Yellow, LGreen, LBlue', -- Black, Blue, Pink, Red, White, Green.
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')

        local option = string.lower(args[1])
        for k, v in ipairs(donatorList) do
            if v == ply.account.phoneNumber then 
                if option == "yellow" then
                    if ply.human.model == 0 then -- if shirt 
                        ply.account.data.colorpicked = 2
                        ply.human.suitColor = 2
                        ply.human.lastUpdatedWantedGroup = -1
                        ply:sendMessage(string.format("Your shirt color is: %s", option))
                        ply:sendMessage("Thank you for donating! <3")
                    else
                        ply:sendMessage("You cant change color in a suit")
                    end
                elseif option == "lgreen" then
                    if ply.human.model == 0 then -- if shirt 
                        ply.account.data.colorpicked = 3
                        ply.human.suitColor = 3
                        ply.human.lastUpdatedWantedGroup = -1
                        ply:sendMessage(string.format("Your shirt color is: %s", option))
                        ply:sendMessage("Thank you for donating! <3")
                    else
                        ply:sendMessage("You cant change color in a suit")
                    end
                elseif option == "lblue" then
                    if ply.human.model == 0 then -- if shirt 
                        ply.account.data.colorpicked = 4
                        ply.human.suitColor = 4
                        ply.human.lastUpdatedWantedGroup = -1
                        ply:sendMessage(string.format("Your shirt color is: %s", option))
                        ply:sendMessage("Thank you for donating! <3")
                    else
                        ply:sendMessage("You cant change color in a suit")
                    end
                else
                    ply:sendMessage("Not a valid option")
                end 
            end
        end 
    end

} 

plugin.commands['/donatortie'] = { 
	info = 'Donator only tie colors',
	usage = 'Green, orange, red, pink, purple, blue', 
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')

        local option = string.lower(args[1])
        for k, v in ipairs(donatorList) do
            if v == ply.account.phoneNumber then 
                if ply.human.tieColor ~= 0 then 

                    if option == "green" then
                        if ply.human.model ~= 0 then -- if not shirt 
                            ply.human.tieColor = 1
                            ply.human.lastUpdatedWantedGroup = -1
                            ply:sendMessage(string.format("Your tie color is: %s", option))
                            ply:sendMessage("Thank you for donating! <3")
                        else
                            ply:sendMessage("You cant change ties in a shirt")
                        end
                    elseif option == "orange" then
                        if ply.human.model ~= 0 then -- if not shirt 
                            ply.human.tieColor = 2
                            ply.human.lastUpdatedWantedGroup = -1
                            ply:sendMessage(string.format("Your tie color is: %s", option))
                            ply:sendMessage("Thank you for donating! <3")
                        else
                            ply:sendMessage("You cant change ties in a shirt")
                        end
                    elseif option == "red" then
                        if ply.human.model ~= 0 then -- if shirt 
                            ply.human.tieColor = 3
                            ply.human.lastUpdatedWantedGroup = -1
                            ply:sendMessage(string.format("Your tie color is: %s", option))
                            ply:sendMessage("Thank you for donating! <3")
                        else
                            ply:sendMessage("You cant change ties in a shirt")
                        end
                    elseif option == "pink" then
                        if ply.human.model ~= 0 then -- if shirt 
                            ply.human.tieColor = 4
                            ply.human.lastUpdatedWantedGroup = -1
                            ply:sendMessage(string.format("Your tie color is: %s", option))
                            ply:sendMessage("Thank you for donating! <3")
                        else
                            ply:sendMessage("You cant change ties in a shirt")
                        end
                    elseif option == "purple" then
                        if ply.human.model ~= 0 then -- if shirt 
                            ply.human.tieColor = 10
                            ply.human.lastUpdatedWantedGroup = -1
                            ply:sendMessage(string.format("Your tie color is: %s", option))
                            ply:sendMessage("Thank you for donating! <3")
                        else
                            ply:sendMessage("You cant change ties in a shirt")
                        end
                    elseif option == "blue" then
                        if ply.human.model ~= 0 then -- if shirt 
                            ply.human.tieColor = 9
                            ply.human.lastUpdatedWantedGroup = -1
                            ply:sendMessage(string.format("Your tie color is: %s", option))
                            ply:sendMessage("Thank you for donating! <3")
                        else
                            ply:sendMessage("You cant change ties in a shirt")
                        end
                    else
                        ply:sendMessage("Not a valid option")
                    end 
                else
                    ply:sendMessage("You dont have a tie")
                end
            end
        end 
    end

} 