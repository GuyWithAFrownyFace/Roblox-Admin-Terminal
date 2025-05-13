local settingsMod = require(game.ReplicatedStorage.Shared.SettingsModule)
local messageRemote = game.ReplicatedStorage.TerminalRemotes.MessageType

local commandRegistry = {}
local players = game:GetService("Players")

commandRegistry.Commands = {
	["kick"] = {
		args = {"target", "reason"},
		execute = function(plr, args)
			local target = players:FindFirstChild(args.target)
			local reason = args.reason

			if target then
				target:Kick(`You were kicked by {plr.Name} for {reason ~= "" and reason or "no reason given"}`)
			else
				messageRemote:FireClient(plr, `Target player not found, {args.target}`, "error")
			end
		end,
	},

	["warn"] = {
		args = {"target", "reason"},
		execute = function(plr, args)
			local serverStorage = game:GetService("ServerStorage")
			local warnGui = serverStorage.Guis:FindFirstChild("WarnGui")

			local target = players:FindFirstChild(args.target)
			local message = args.reason

			if target and warnGui then
				local newWarn = warnGui:Clone()
				newWarn.Parent = target:WaitForChild("PlayerGui")
				newWarn.Frame.Subject.Text = (`You are being warned for {message ~= "" and message or "(no reason given)"} \n\nrepeated warnings can lead to bans.`)
				local exitButton = newWarn.Frame.Exit
				exitButton.MouseButton1Click:Connect(function()
					newWarn:Destroy()
				end)
			elseif not target then
				messageRemote:FireClient(plr, `Target player not found, {args.target}`, "error")
			elseif not warnGui then
				messageRemote:FireClient(plr, "Gui not found in server storage", "error")
			end
		end,
	},
}

return commandRegistry
