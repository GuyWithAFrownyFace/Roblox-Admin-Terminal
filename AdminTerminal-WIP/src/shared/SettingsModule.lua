local Enums = require(script.Parent.EnumsModule)
local Settings = {}

Settings.PermissionLevels = {
	--[1234567890] = Enums.PermissionLevel.Owner, examples
	--[87654321] = Enums.PermissionLevel.Admin, examples
	--[55555555] = Enums.PermissionLevel.Mod, examples
}

Settings.CommandPermissions = {
	kick = Enums.PermissionLevel.Mod,
	ban = Enums.PermissionLevel.Admin,
	warn = Enums.PermissionLevel.Mod,
	
}

return Settings
