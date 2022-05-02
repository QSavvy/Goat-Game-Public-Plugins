local plugin = ...
plugin.name = 'Cough'
plugin.author = 'Dingus'
plugin.description = 'makes u cough'
local coughmessages = {
	"*cough*",
    "oof",
    "hnng",
    "guuhh",
    "*hoofgfg*",
    "*COOOOf*",
    "*HOOH*",
    "COUUUUUF",
    "*SPshGUG*",
    "HUUHNGg",
    "*COUGH COUGH*",
    "*sniff*",
    "splooge",
    "IM COOOOOFING",
    "hyucc",

}
local function cough(human)
    local head = human:getRigidBody(3)
    human:addVelocity(Vector(0,0.02,0))
    human:speak(string.format("%s", coughmessages[math.random(#coughmessages)]), 1)
    if math.random(0,10) == 10 then 
        events.createBulletHit(1, head.pos, normal)
    else 
        events.createSound(41, head.pos, 1, math.random(0.7,2))
    end
end
plugin.commands["/covid"] = {
	info = "makes you cough",
	usage = "",
	call = function(ply)
        if ply.human then 
            if ply.human.data.isCoughing ~= true then
                cough(ply.human)
                ply:sendMessage("You are now coughing haha")
                ply.human.data.isCoughing = true 
            else 
                ply.human.data.isCoughing = nil
                ply:sendMessage("Fauchi Ouchie!! :DD")
            end
        else
            ply:sendMessage("You gotta be alive to use this")
        end
    end
} 
function plugin.hooks.HumanLimbInverseKinematics (man, boneT, boneB, dest, rot, vecA, float, floatRot, floatStr, vecB, vecC, flags)
    if man.data.isCoughing == true and man.isAlive then 
        if math.random(0,700) == 1 then
            cough(man)
        end
    end
end 