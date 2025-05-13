local replicatedStorage = game:GetService("ReplicatedStorage")
local terminalCommand = replicatedStorage.TerminalRemotes.TerminalCommand
local messageRemote = replicatedStorage.TerminalRemotes.MessageType

local securityModule = require(script.Parent.Security)
local Core = require(script.Parent.Core)

terminalCommand.OnServerEvent:Connect(function(plr, commandData)
	if not commandData then
		messageRemote:FireClient(plr, "Command not found.", "error")
		return
	end
	
	local commandName = commandData.command
	local args = commandData.args

	

	print("[REMOTE] Received:", commandName, "Args:", args)

	if securityModule.CheckPermission(plr, commandName) then
		Core:ExecuteCommand(plr, commandName, args)
	else
		warn("[REMOTE] Permission denied for", plr.Name, commandData)
	end
end)
