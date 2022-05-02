---@type Plugin
local plugin = ...
plugin.name = 'stronk'
plugin.author = 'Dingus'
plugin.description = 'gives someone super strength'




plugin.commands['/stronk'] = { 
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
                foundplayer:sendMessage("You have super strength!")
                ply:sendMessage(string.format("Gave %s super strength", foundplayer.name))
                local zero = foundplayer.human:getRigidBody(0)
                local one = foundplayer.human:getRigidBody(1)
                local two = foundplayer.human:getRigidBody(2)
                local three = foundplayer.human:getRigidBody(3)
                local four = foundplayer.human:getRigidBody(4)
                local five = foundplayer.human:getRigidBody(5)
                local six = foundplayer.human:getRigidBody(6)
                local seven = foundplayer.human:getRigidBody(7)
                local eight = foundplayer.human:getRigidBody(8)
                local nine = foundplayer.human:getRigidBody(9)
                local ten = foundplayer.human:getRigidBody(10)
                local eleven = foundplayer.human:getRigidBody(11)
                local twelve = foundplayer.human:getRigidBody(12)
                local thirteen = foundplayer.human:getRigidBody(13)
                local fourteen = foundplayer.human:getRigidBody(14)
                local fifthteen = foundplayer.human:getRigidBody(15)

                zero.mass = zero.mass * 7
                one.mass = one.mass * 7
                two.mass = two.mass * 7
                three.mass = three.mass * 7 
                four.mass = four.mass * 7
                five.mass = five.mass * 7
                six.mass = six.mass * 7
                seven.mass = seven.mass * 7
                eight.mass = eight.mass * 7
                nine.mass = nine.mass * 7
                ten.mass = ten.mass * 7
                eleven.mass = eleven.mass * 7
                twelve.mass = twelve.mass * 7
                thirteen.mass = thirteen.mass * 7
                fourteen.mass = fourteen.mass * 7
                fifthteen.mass = fifthteen.mass * 7
            end 

        
    end
}

