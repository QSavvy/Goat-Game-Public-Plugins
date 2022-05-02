---@type Plugin
local plugin = ...
plugin.name = "peehaha"
plugin.author = "Dingus"
plugin.description = "ISNT PEE IN SUBROSA SOOOOO FUNNNYYY??? 20 dollars."


function plugin.hooks.PlayerActions(Player)
    if Player.human and bit32.band(Player.inputFlags, 262144) == 262144 then 
        local pissbone = Player.human:getRigidBody(0)
        events.createBullet(9, pissbone.pos, (Vector(0, -Player.human.viewPitch/2, 0) + (-pissbone.rot:getRight()*2)/10), nil)
    end


end
