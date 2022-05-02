---@type Plugin
local plugin = ...
plugin.name = 'Fixed Magnum'
plugin.author = 'Dingus & Sammy'
plugin.description = 'Fixes Magnum Positioning'

plugin.defaultConfig = {
    magnumItemTypeName = "Magnum"
}


for _, type in ipairs(itemTypes.getAll()) do
	if type.index == 5 then
        type.rightHandPos = (Vector(0, -0.125, 0))
        type.primaryGripStiffness = 1
        type.primaryGripRotation = 1.57
        type.secondaryGripStiffness = 1
        type.secondaryGripRotation = 1.57
        type.numHands = 2
        type.mass = 3
        type.gunHoldingPos = (Vector(0,-0.0625, 0.375)) --0.375
        type.leftHandPos = (Vector(0,-0.125,-0.125))
		type.bulletVelocity = 8
        --since this isn't defined i have to set it manually
        add = memory.getAddress(type)
        add = add + 20
        memory.writeByte(add,0)
    end
end


