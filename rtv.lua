---@type Plugin
local plugin = ...
plugin.name = 'rtv'
plugin.author = 'Dingus'
plugin.description = 'Lets everyone vote to reset game, in my specific case that will change the spawn points'

rtvcount = 0
function plugin.hooks.Logic()
    if rtvcount >= 1 then
        if rtvcount >= #players.getNonBots() * 0.5 then
            server:reset()
            rtvcount = 0
            for _, ply in ipairs(players.getAll()) do
                ply:sendMessage("Map changed due to RTV")
                ply.data.rtv = false
                ply:sendMessage(string.format("Current map: %s", currentMap[2]))
            end
        end
    end
end 
plugin.commands['/rtv'] = {
	info = 'Rock the vote! Used to change maps',
	usage = '',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
        assert(#args <= 1, 'usage')
		local person = ply
        if ply.data.rtv ~= true then
            rtvcount = rtvcount + 1 
            for _, ply in ipairs(players.getAll()) do
                ply:sendMessage(string.format("%s wants to RTV! (%s / %s)", person.name, rtvcount, math.ceil(#players.getNonBots() * 0.5)))
                ply:sendMessage("/rtv to vote for a map change!")
            end
            ply.data.rtv = true
        else
            ply:sendMessage("You've already voted to RTV")
        end 
    end 

}

