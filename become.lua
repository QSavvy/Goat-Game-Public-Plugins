---@type Plugin
local plugin = ...
plugin.name = 'Become'
plugin.author = 'Dingus'
plugin.description = 'Makes you into someone'




plugin.commands['/become'] = { 
	info = 'Give someone super strength',
	usage = 'name',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')
		local name = table.concat(args, ' '):lower()
		local anyMatch = false
        local option = string.lower(args[1])

        local foundplayer = findOnePlayer(option)
            if foundplayer then
                ply:sendMessage(string.format("Copied: %s", foundplayer.name))
                ply.human.head = foundplayer.human.head
                ply.human.eyeColor = foundplayer.human.eyeColor
                ply.human.hair = foundplayer.human.hair
                ply.human.hairColor = foundplayer.human.hairColor
                ply.human.model = foundplayer.human.model
                ply.human.gender = foundplayer.human.gender
                ply.human.suitColor = foundplayer.human.suitColor
                ply.human.necklace = foundplayer.human.necklace
                ply.name = foundplayer.name
                ply.human.skinColor = foundplayer.human.skinColor
                ply.human.tieColor = foundplayer.human.tieColor
                ply.human.lastUpdatedWantedGroup = -1
                ply:update()
            end 

        
    end
}

plugin.commands['/everyonebecome'] = { 
	info = 'Make everyone look like someone',
	usage = 'name',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')
		local name = table.concat(args, ' '):lower()
		local anyMatch = false
        local option = string.lower(args[1])

        local foundplayer = findOnePlayer(option)
            if foundplayer then
                for _, play in ipairs(players.getAll()) do
                    play.data.realName = play.name
                    play:sendMessage(string.format("Copied: %s", foundplayer.name))
                    play.human.head = foundplayer.human.head
                    play.human.eyeColor = foundplayer.human.eyeColor
                    play.human.hair = foundplayer.human.hair
                    play.human.hairColor = foundplayer.human.hairColor
                    play.human.model = foundplayer.human.model
                    play.human.gender = foundplayer.human.gender
                    play.human.suitColor = foundplayer.human.suitColor
                    play.human.necklace = foundplayer.human.necklace
                    play.name = foundplayer.name
                    play.human.skinColor = foundplayer.human.skinColor
                    play.human.tieColor = foundplayer.human.tieColor
                    play.human.lastUpdatedWantedGroup = -1
                    play:update()
                end
            end 

        
    end
}

plugin.commands['/becomerandom'] = { 
	info = 'Makes you become random.',
	usage = '',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 0, 'usage')

        if ply.human then
            ply.human.data.randomCommand = true
            ply:sendMessage("You are now randomized every time you click")
        end 
    end 

}
plugin.commands['/fixnames'] = { 
	info = 'Fixes everyones names after becomeeveryone',
	usage = '',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 0, 'usage')
        ply:sendMessage("Fixed everyones name")
        for _, play in ipairs(players.getAll()) do
            if play.data.realName ~= nil then 
                play.name = play.data.realName
                play:update()
            end
        end
    end 

}


function plugin.hooks.PlayerActions(Player)

    if Player.human and Player.human.isAlive == true then 
        if bit32.band(Player.human.inputFlags, 01) == 01 and Player.human.data.randomCommand == true then
            Player.human.head = math.random(0,4)
            Player.human.eyeColor = math.random(0,7)
            Player.human.hair = math.random(0,8)
            Player.human.hairColor = math.random(0,11)
            Player.human.model = math.random(0,1)
            Player.human.gender = math.random(0,1)
            Player.human.suitColor = math.random(0,6)
            --Player.human.necklace = math.random(0,2)
            --ply.name = foundplayer.name
            Player.human.skinColor = math.random(0,5)
            --Player.human.tieColor = math.random(0,4)
            Player.human.lastUpdatedWantedGroup = -1
            events.createSound(math.random(28, 37), Player.human.pos, 1, 1)
        end
    end
end
