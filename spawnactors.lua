---@type Plugin
local plugin = ...
plugin.name = "Actor Spawner"
plugin.author = "Dingus"
plugin.description = "Spawns bots of your choice"


plugin.commands['/spawnactor'] = {
	info = 'Lets you emote',
	usage = 'gold, mons, oxs',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, man, args)
		assert(#args >= 1, 'usage')
		local person = ply
		local option = string.lower(args[1])
        if option == "mons" then
            local pos = man.pos:clone()
		    pos.x = pos.x + (2 * math.cos(man.viewYaw - math.pi/2))
		    pos.y = pos.y + 0.2
		    pos.z = pos.z + (2 * math.sin(man.viewYaw - math.pi/2))
            local bot = players.createBot()
            if bot ~= nil then
                bot.name = ''
                bot.team = 1
                bot.gender = math.random(0,1)
                bot.skinColor = math.random(0, 6)
                bot.hairColor = math.random(1, 12)
                bot.hair = math.random(1, 9)
                bot.eyeColor = math.random(1, 8)
                bot.head = math.random(1, 5)
                bot.suitColor = 3
                bot.tieColor = 0
                bot.model = 1
                bot:update()

                local botMan = humans.create(pos, RotMatrix(1, 0, 0, 0, 1, 0, 0, 0, 1), bot)
                if not botMan then
                    bot:remove()
                    error('Could not create bot')
                end
            end
        elseif option == "oxs" then 
            local pos = man.pos:clone()
		    pos.x = pos.x + (2 * math.cos(man.viewYaw - math.pi/2))
		    pos.y = pos.y + 0.2
		    pos.z = pos.z + (2 * math.sin(man.viewYaw - math.pi/2))
            local bot = players.createBot()
            if bot ~= nil then
                bot.name = ''
                bot.team = 1
                bot.gender = math.random(0,1)
                bot.skinColor = math.random(0, 6)
                bot.hairColor = math.random(1, 12)
                bot.hair = math.random(1, 9)
                bot.eyeColor = math.random(1, 8)
                bot.head = math.random(1, 5)
                bot.suitColor = 2
                bot.tieColor = 0
                bot.model = 1
                bot:update()

                local botMan = humans.create(pos, RotMatrix(1, 0, 0, 0, 1, 0, 0, 0, 1), bot)
                if not botMan then
                    bot:remove()
                    error('Could not create bot')
                end
            end
        elseif option == "gold" then
            local pos = man.pos:clone()
		    pos.x = pos.x + (2 * math.cos(man.viewYaw - math.pi/2))
		    pos.y = pos.y + 0.2
		    pos.z = pos.z + (2 * math.sin(man.viewYaw - math.pi/2))
            local bot = players.createBot()
            if bot ~= nil then
                bot.name = ''
                bot.team = 1
                bot.gender = math.random(0,1)
                bot.skinColor = math.random(0, 6)
                bot.hairColor = math.random(1, 12)
                bot.hair = math.random(1, 9)
                bot.eyeColor = math.random(1, 8)
                bot.head = math.random(1, 5)
                bot.suitColor = 6
                bot.tieColor = 0
                bot.model = 1
                bot:update()

                local botMan = humans.create(pos, RotMatrix(1, 0, 0, 0, 1, 0, 0, 0, 1), bot)
                if not botMan then
                    bot:remove()
                    error('Could not create bot')
                end
            end
        end

    end
}