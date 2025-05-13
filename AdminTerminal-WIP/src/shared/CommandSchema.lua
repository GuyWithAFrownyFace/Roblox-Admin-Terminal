-- Shared/CommandSchema.lua

return {
	["kick"] = {
		args = {"target", "reason"},
		description = "Kicks a player with a reason"
	},

	["ban"] = {
		args = {"target", "reason", "duration"},
		description = "Bans a player with a reason and duration"
	},

	["warn"] = {
		args = {"target", "reason"},
		description = "Sends a warning message to a player"
	},
}
