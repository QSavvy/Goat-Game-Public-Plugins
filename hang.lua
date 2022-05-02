---@type Plugin
local plugin = ...
plugin.name = 'hang'
plugin.author = 'Dingus'
plugin.description = 'Snares someone in a rope trap'





plugin.commands['/hang'] = { 
	info = 'Hang a person by a rope',
	usage = 'name',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
        assert(#args >= 1, 'usage')
        local victim = findOnePlayer(table.remove(args, 1))
        local victimMan = victim.human
        assert(victimMan, 'Victim not spawned in')

        local rigidBodyMan = victimMan:getRigidBody(math.random(0,15))
		local rope = items.create(itemTypes[36], Vector(victimMan.pos.x, victimMan.pos.y + 10, victimMan.pos.z), orientations.n)
		rope.rigidBody:bondToLevel(Vector(0, 0, 0), Vector(victimMan.pos.x, victimMan.pos.y + 10, victimMan.pos.z))
		rope.rigidBody:bondTo(rigidBodyMan, Vector(0,-0.2,0), Vector(0,0,0))
    end
}

        


