---@type Plugin
local plugin = ...
plugin.name = 'Emotes'
plugin.author = 'Dingus'
plugin.description = 'emotes'


plugin.commands['/e'] = {
	info = 'Lets you emote',
	usage = 'wave, sex, surrender, handcuffed, zyzz, floss. (Very WIP)',
	canCall = function (ply) return ply end,
	---@param ply Player
	---@param args string[]
	call = function (ply, _, args)
		assert(#args >= 1, 'usage')
		local person = ply
		local option = string.lower(args[1])
		
      
		if option == "wave" then
			if ply.human then 
                ply.human.data.emoteChoice = "wave"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end 
		elseif option == "sex" then
			if ply.human then 
                ply.human.data.emoteChoice = "sex"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end
		
        elseif option == "surrender" then
			if ply.human then 
                ply.human.data.emoteChoice = "surrender"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end
	
    
		
        elseif option == "handcuffed" then
			if ply.human then 
                ply.human.data.emoteChoice = "handcuffed"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end
		
        elseif option == "zyzz" then
			if ply.human then 
                ply.human.data.emoteChoice = "zyzz"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end
		
        elseif option == "crossed" then
			if ply.human then 
                ply.human.data.emoteChoice = "crossed"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end
		elseif option == "floss" then
			if ply.human then 
                ply.human.data.emoteChoice = "floss"
                ply:sendMessage(string.format("Emote: %s", option))
                ply:sendMessage("Press E to stop emoting")
            end
		else
			person:sendMessage("Invalid Emote")
		end

	end
}



function plugin.hooks.HumanLimbInverseKinematics (man, boneT, boneB, dest, rot, vecA, float, floatRot, floatStr, vecB, vecC, flags)
    
    if man.data.emoteChoice ~= nil then
        if man.data.emoteChoice == "sex" then
            if tick > 30 then -- AWOOOOOOOGA

                if boneT == 2 and boneB == 7 then 
                    dest:set(Vector(-0.1, 0.1, -0.2))
                end 
                if boneT == 2 and boneB == 4 then 
                    dest:set(Vector(0.1, 0.1, -0.2))
                end 
            else 
                if boneT == 2 and boneB == 7 then 
                    dest:set(Vector(0.1, -0.1, 0.2))
                end 
                if boneT == 2 and boneB == 4 then 
                    dest:set(Vector(-0.1, -0.1, 0.2))
                end 
            end 
        elseif man.data.emoteChoice == "wave" then 

            if tick > 30 then 
                if boneT == 2 and boneB == 7 then -- arm sticking out
                    dest:set(Vector(1, 0.5, 0))
                    --rot:set(pitchToRotMatrix(0))
                    --floatStr = 90
                end 
                

            else
                if boneT == 2 and boneB == 7 then -- arm sticking out
                    --rot:set(pitchToRotMatrix(90))
                    dest:set(Vector(0, 1, 0))
                    --floatStr = 90
                    --print(rot.value)

                end 
                
            end 


        elseif man.data.emoteChoice == "surrender" then
            if boneT == 2 and boneB == 7 then -- arm sticking out
                --rot:set(rollToRotMatrix(-90))
                dest:set(Vector(0.2,0.9,0))
            end
            if boneT == 2 and boneB == 4 then -- arm sticking out
                --rot:set(rollToRotMatrix(90))
                dest:set(Vector(-0.2,0.9,0))
            end
            
        elseif man.data.emoteChoice == "handcuffed" then
            local yaw = 80
            local pitch = 50
            local roll = -70
            if boneT == 2 and boneB == 7 then -- arm sticking out
                --rot = 1
                rot:set(pitchToRotMatrix(math.rad(pitch)) * yawToRotMatrix(math.rad(yaw)) * rollToRotMatrix(math.rad(roll)))
                --rot:set(rollToRotMatrix(math.rad(20)))
                --dest:set(Vector(0,0,0))
            end
            if boneT == 2 and boneB == 4 then -- arm sticking out
                rot:set(pitchToRotMatrix(math.rad(pitch)) * yawToRotMatrix(math.rad(-yaw)) * rollToRotMatrix(math.rad(-roll)))
                --dest:set(Vector(0.1,0,-0.4))
            end
            
        elseif man.data.emoteChoice == "zyzz" then
            local yaw = 0
            local pitch = 0
            local roll = 0
            if boneT == 2 and boneB == 7 then -- arm sticking out
                --rot = 1
                --rot:set(pitchToRotMatrix(math.rad(pitch)) * yawToRotMatrix(math.rad(yaw)) * rollToRotMatrix(math.rad(roll)))
                --rot:set(rollToRotMatrix(math.rad(20)))
                dest:set(Vector(0.4,0.6,-0.2))
            end
            if boneT == 2 and boneB == 4 then -- arm sticking out
                --rot:set(pitchToRotMatrix(math.rad(pitch)) * yawToRotMatrix(math.rad(-yaw)) * rollToRotMatrix(math.rad(-roll)))
                dest:set(Vector(-0.3,-0.1,-0.2))
            end
            
        elseif man.data.emoteChoice == "crossed" then
            local yaw = 80
            local pitch = -10
            local roll = 0
            if boneT == 2 and boneB == 7 then -- arm sticking out
                --rot = 1
                rot:set(pitchToRotMatrix(math.rad(pitch)) * yawToRotMatrix(math.rad(yaw)) * rollToRotMatrix(math.rad(roll)))
                --rot:set(rollToRotMatrix(math.rad(20)))
                dest:set(Vector(0.4,-0.1,-0.3))
            end
            if boneT == 2 and boneB == 4 then -- arm sticking out
                rot:set(pitchToRotMatrix(math.rad(pitch)) * yawToRotMatrix(math.rad(-yaw)) * rollToRotMatrix(math.rad(-roll)))
                dest:set(Vector(-0.4,-0.1,-0.3))
            end
            
        elseif man.data.emoteChoice == "floss" then
            
            if tick > 30 then -- AWOOOOOOOGA
                --man:speak("WE LIKE FORTNITE", 1)
                if boneT == 2 and boneB == 7 then 
                    dest:set(Vector(-0.6, -0.5, -0.3))
                end 
                if boneT == 2 and boneB == 4 then 
                    dest:set(Vector(-0.6, -0.5, 0.3))
                end 
            else 
                if boneT == 2 and boneB == 7 then 
                    dest:set(Vector(0.6, -0.5, 0.3))
                end 
                if boneT == 2 and boneB == 4 then 
                    dest:set(Vector(0.6, -0.5,-0.3))
                end 
            end 
            
        else
         
        end  


    end




end 

function plugin.hooks.PlayerActions(Player)
    if Player.human and bit32.band(Player.inputFlags, 2048) == 2048 then 
        if Player.human.data.emoteChoice ~= nil then
            Player.human.data.emoteChoice = nil
        end
    end
end
function plugin.hooks.Logic()
    if tick == nil then 
        tick = 0
    end
    if tick < 60 then
		tick = tick + 1
	else  
		tick = 0
	end
end