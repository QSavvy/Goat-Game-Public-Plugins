---@type Plugin
local plugin = ...
plugin.name = 'TPA'
plugin.author = 'Dingus'
plugin.description = 'Adds the ability to request TP to someone'




plugin.commands['/tpa'] = { 
	info = 'Tp to a person!',
	usage = 'name',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')
		local name = table.concat(args, ' '):lower()
		local anyMatch = false
        local option = string.lower(args[1])

        
        if option ~= "accept" then
            local foundplayer = findOnePlayer(option)
            if foundplayer then
                ply:sendMessage(string.format('Sent a TP request to: %s', foundplayer.name))
                foundplayer:sendMessage(string.format('%s would like to TP to you', ply.name))
                foundplayer:sendMessage('/tpa accept to accept!')
                foundplayer.data.tparequestfrom = ply.name
                ply.data.tparequestto = foundplayer.name
            else
                ply:sendMessage('Cant find that player!')
            end
        elseif option == "accept" then
            if ply.data.tparequestfrom == nil then
                ply:sendMessage('No TP request found')
            elseif ply.data.tparequestfrom ~= nil then
                ply:sendMessage('Request accepted.')
                local foundplayer = findOnePlayer(ply.data.tparequestfrom)
                if foundplayer then
                    foundplayer.human:teleport(Vector(ply.human.pos.x, ply.human.pos.y + 2, ply.human.pos.z))
                    foundplayer.data.tparequestfrom = nil
                    foundplayer.data.tparequestto = nil
                    ply.data.tparequestfrom = nil
                    ply.data.tparequestto = nil
                    events.createSound(37, foundplayer.human.pos, 0.5, 1)
                end

            end
        end

    
    end

}

