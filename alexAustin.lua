
---@type Plugin
local plugin = ...
plugin.name = 'Alex Austin'
plugin.author = 'Dingus'
plugin.description = 'lets ppl be ballllld LOLOLOL'





plugin.commands['/alexaustin'] = { -- hehe
info = 'Alex Austin.',
usage = '',
canCall = function (ply) return ply end,
---@param ply Player
---@param args string[]
call = function (ply, _, args)
    assert(#args >= 0, 'usage')
    local person = ply
    ply.human.hair = -1 
    person.human.lastUpdatedWantedGroup = -1
    person:sendMessage("You feel the urge to program.")
end 

}