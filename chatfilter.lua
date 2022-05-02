---@type Plugin
local plugin = ...
plugin.name = "Chat Filter"
plugin.author = "Dingus"
plugin.description = "Check all chat messages for prohibited words"







local swearTable = {
    "nigger",
    "faggot",
    "tranny",
    "fag",
    "n1gger",
    "n i g g e r",
    "n 1 g g e r",
    "n1gg3r",
}



function plugin.hooks.EventMessage(speakerType, string, speakerID, volumeLevel) -- anti n word 
    local message = string.lower(string)
    for k, v in ipairs(swearTable) do
        if string.find(message, v) then 
            return hook.override
        else 
        end
    end 
end

function plugin.hooks.PlayerChat(Player, String) -- anti n word 
    local message = string.lower(String)
    for k, v in ipairs(swearTable) do
        if string.find(message, v) then 
            Player:sendMessage("Your message has been forwarded to an admin")
            adminLog(string.format("[CHAT FILTER] %s (%s) said '%s' at [%s]", Player.name, Player.account.phoneNumber, message, os.date('%Y-%m-%d %H:%M:%S')))
            log(string.format("[CHAT FILTER] %s (%s) said '%s' at [%s]", Player.name, Player.account.phoneNumber, message, os.date('%Y-%m-%d %H:%M:%S')))
            return hook.override
        else 
        end
    end 
end 