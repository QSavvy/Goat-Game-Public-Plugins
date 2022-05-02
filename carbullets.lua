---@type Plugin
local plugin = ...
plugin.name = 'Car bullets'
plugin.author = 'Dingus'
plugin.description = 'Makes bullets cars'



local carbullets


plugin.commands['/carbullets'] = {
	info = 'turns on car bullets',
	canCall = function (ply) return ply.isAdmin end,
	---@param ply Player
	call = function (ply)

        if carbullets ~= true then 
            carbullets = true 
            ply:sendMessage("Car bullets enabled")
        elseif carbullets == true then
            carbullets = false
            ply:sendMessage("Car bullets disabled")
        end 
        
	end
}


function plugin.hooks.PostBulletCreate(bullet)
    if carbullets == true then 
        local car = vehicles.create(vehicleTypes.getByName("Town Car"), bullet.pos, yawToRotMatrix(bullet.player.human.viewYaw), math.random(0,5))
        car.rigidBody.vel:add(Vector(bullet.vel.x / 7, bullet.vel.y / 7, bullet.vel.z / 7))
        car.data.isBulletCar = true
    end


end       


function plugin.hooks.Logic()
    for _, veh in ipairs(vehicles.getAll()) do
        if veh.data.isBulletCar == true then

            if veh.data.bulTimer == nil then 
                veh.data.bulTimer = 0
            end
        end

        if veh.data.bulTimer ~= nil then 
            if tick == 59 then
                if veh.data.bulTimer <= 20 then
                    veh.data.bulTimer = veh.data.bulTimer + 1 
                end 
      
                if veh.data.bulTimer == 20 then 
                    veh:remove()
                end
            end
        end
    end

        

end





