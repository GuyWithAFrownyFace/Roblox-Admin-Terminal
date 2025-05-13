local commandReg = require(script.Parent.Commands.CommandRegistry)
local messageRemote = game.ReplicatedStorage.TerminalRemotes.MessageType

local Core = {}

function Core:ExecuteCommand(plr, commandName, commandArgs)
	local command = commandReg.Commands[commandName]
	if command then
		print("[CORE] Executing:", commandName, "Args:", commandArgs)
		command.execute(plr, commandArgs)
	else
		messageRemote:FireClient(plr, `Command not found, {commandName}`, "error" )
	end
end

return Core
