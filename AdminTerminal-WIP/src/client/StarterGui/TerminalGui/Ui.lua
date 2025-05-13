local plr = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local remote = replicatedStorage.TerminalRemotes.TerminalCommand
local outputRemote = replicatedStorage.TerminalRemotes.MessageType
local messageHandler = require(script.MessageHandler)

local sharedFolder = replicatedStorage.Shared
local parseModule = require(sharedFolder.ParseInput)

local terminalGui = script.Parent
local textInput = terminalGui.TerminalSimpelUi.TextInput
local textOutput = terminalGui.TerminalSimpelUi.ScrollingFrame.TextOutput


textInput.FocusLost:Connect(function(enterPressed)
	if not enterPressed then return end

	local input = textInput.Text
	textInput.Text = "..."
	local commandName, args = parseModule.ParseCommand(input)
	args = args or {} -- ensure it's never nil

	remote:FireServer(commandName, unpack(args)) -- Sends command, then each arg individually
	
end)

outputRemote.OnClientEvent:Connect(function(text, messageType)
	messageHandler.printMessage(text, messageType)
end)