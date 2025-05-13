local Enums = require(script.Parent.EnumsModule)
local Settings = {}

Settings.PermissionLevels = {
	[1091579815] = Enums.PermissionLevel.Owner,
	--[87654321] = Enums.PermissionLevel.Admin, examples
	--[55555555] = Enums.PermissionLevel.Mod, examples
}

Settings.CommandPermissions = {
	kick = Enums.PermissionLevel.Mod,
	ban = Enums.PermissionLevel.Admin,
	warn = Enums.PermissionLevel.Mod,
	
}

return Settings