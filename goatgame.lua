---@type Plugin
local plugin = ...
plugin.name = "Goat Game Commands"
plugin.author = "Dingus"
plugin.description = "Commands used for all of my gamemodes"

plugin.commands['/gravity'] = { 
	info = 'Change the gravity',
	usage = 'name',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		--assert(#args >= 1, 'usage')
        local option = string.lower(args[1])

        if option then 
			server.gravity = server.defaultGravity * option 
			chat.announce(string.format("Gravity changed to %s", option))
        end
    end
}



plugin.commands['/goat'] = { 
	info = 'Kills you and respawns.',
	usage = '',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 0, 'usage')
		if ply.human then
			local victim = ply.human
			local rigidBodyMan = victim:getRigidBody(0)
			for i = 1,5 do
				events.createBulletHit(1, rigidBodyMan.pos, normal)
			end
			--events.createSound(25, rigidBodyMan.pos)
			rigidBodyMan.vel:add(Vector(math.random(0.1, 1), math.random(0.1, 1), math.random(0.1, 1)))
			--events.createSound(25, victim.pos, 1, 1)
			victim.isAlive = false
		else
			ply:sendMessage("You gotta be alive to use this dummy!")
		end
			

	end
}




plugin.commands['/discord'] = {
	info = 'Show the Discord link',
	usage = '',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param man Human?
	---@param args string[]
	call = function (ply, man, args)
		assert(#args <= 1, 'usage')

        ply:sendMessage("Link goes here")

	end
}



plugin.commands['/launch'] = {
	info = 'Launch yourself',
	usage = '',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param man Human?
	---@param args string[]
	call = function (ply, man, args)
		assert(#args <= 1, 'usage')
		assert(man, 'Not spawned in')


		local victimMan = ply.human

		if victimMan.isAlive == true then
			if victimMan.data.launchamount == nil then
				victimMan.data.launchamount = true
				victimMan:addVelocity(Vector((math.sin(victimMan.viewYaw) * 2), 1, -(math.cos(victimMan.viewYaw) * 2)))
				events.createExplosion(victimMan.pos)
			else
				ply:sendMessage("You already launched")
			end
		end


	end
}
