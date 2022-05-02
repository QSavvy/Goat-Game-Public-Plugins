---@type Plugin
local plugin = ...
plugin.name = "Rules"
plugin.author = "Dingus"
plugin.description = "Rules"














plugin.commands['/rules'] = {
	info = 'Shows the rules',
	usage = '',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param man Human?
	---@param args string[]
	call = function (ply, man, args)
		assert(#args <= 1, 'usage')

        ply:sendMessage("    [RULES]")
		ply:sendMessage("1) Be nice. Play fair.")
        ply:sendMessage("2) No soundboards on deathcam/lobby.")
        ply:sendMessage("3) Don't be racist/homophobic. Very hard I know.")
        ply:sendMessage("[By joining this server, you agree to these rules.]")


	end
}

plugin.commands['/credits'] = {
	info = 'Credits!',
	usage = '',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param man Human?
	---@param args string[]
	call = function (ply, man, args)
		assert(#args <= 1, 'usage')

        ply:sendMessage("    [Thank you to these people]")
		ply:sendMessage("1")
        ply:sendMessage("2")
        ply:sendMessage("3")



	end
}
