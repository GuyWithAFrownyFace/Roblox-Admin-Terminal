local Shared = game.ReplicatedStorage.Shared
local settings = require(Shared.SettingsModule)

local securityModule = {}



function securityModule.GetPermissionLevel(userId)
	return settings.PermissionLevels[userId] or 0 -- default: 0 = guest
end

function securityModule.CheckPermission(player, commandName)
	local userLevel = securityModule.GetPermissionLevel(player.UserId)
	local requiredLevel = settings.CommandPermissions[commandName] or math.huge -- unknown = locked
	
	
	print("[SECURITY] Checking:", player.Name, player.UserId, "Level:", userLevel, "Command:", commandName, "Required:", requiredLevel)

	return userLevel >= requiredLevel
end




return securityModule