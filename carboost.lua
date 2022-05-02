---@type Plugin
local plugin = ...
plugin.name = 'Become'
plugin.author = 'Dingus'
plugin.description = 'Makes you into someone'


function plugin.hooks.PlayerActions(Player)

    if Player.human and Player.human.isAlive == true and Player.isAdmin then 
        if Player.human.vehicle and bit32.band(Player.human.inputFlags, 16) == 16 then
            
            Player.human.vehicle.rigidBody.vel:add(-((Player.human.vehicle.rigidBody.rot:getRight())/20))
            --Player.human.vehicle.rigidBody.vel:add(((Player.human.vehicle.rigidBody.rot:getUp())/1))
            --events.createExplosion(Player.human.vehicle.pos)

        end
        if Player.human.vehicle and bit32.band(Player.human.inputFlags, 04) == 04 then
            
            --Player.human.vehicle.rigidBody.vel:add(-((Player.human.vehicle.rigidBody.rot:getRight())/20))
            Player.human.vehicle.rigidBody.vel:add(((Player.human.vehicle.rigidBody.rot:getUp())/20))
            --events.createExplosion(Player.human.vehicle.pos)

        end
        if Player.human.vehicle and bit32.band(Player.human.inputFlags, 08) == 08 then
            
            --Player.human.vehicle.rigidBody.vel:add(-((Player.human.vehicle.rigidBody.rot:getRight())/20))
            Player.human.vehicle.rigidBody.vel:add(((Player.human.vehicle.rigidBody.rot:getRight())/20))
            --events.createExplosion(Player.human.vehicle.pos)

        end
    end
end