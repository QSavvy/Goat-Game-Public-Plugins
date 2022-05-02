---@type Plugin
local plugin = ...
plugin.name = "Global Chat"
plugin.author = "Dingus"
plugin.description = "Sends all chat messages to global chat"

-- so epic
function plugin.hooks.PlayerChat(Player, String)
    local strLower = string.lower(String)
    if Player.human then
        chat.announceWrap(string.format("%s: %s", Player.name, String))
    end 
end 

