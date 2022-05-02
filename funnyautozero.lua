---@type Plugin
local plugin = ...
plugin.name = 'funnyauto'
plugin.author = 'Dingus'
plugin.description = 'Fixes the position of the auto and makes it shoot rly fast (its funny)'

for _, type in ipairs(itemTypes.getAll()) do -- auto
	if type.index == 0 then
        type.numHands = 2
		type.primaryGripRotation = 2.7
		type.primaryGripStiffness = 1
		type.rightHandPos = Vector(0, 0, 0)
        type.leftHandPos = Vector(0, 0, -0.2)
		type.mass = 1
        type.gunHoldingPos = Vector(-0.1, 0, 0.3)
        type.fireRate = 3
        type.bulletSpread = 0.5
        type.magazineAmmo = 10000
        type.bulletVelocity = 10
    end

end

