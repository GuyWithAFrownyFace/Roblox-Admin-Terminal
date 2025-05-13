local outputText = script.Parent.Parent.TerminalSimpelUi.ScrollingFrame.TextOutput

local terminalUi = {}

function terminalUi.printMessage(text, messageType)
	local colorPrefix = ""

	if messageType == "error" then
		colorPrefix = "[ERROR] "
	elseif messageType == "info" then
		colorPrefix = "[INFO] "
	elseif messageType == "success" then
		colorPrefix = "[OK] "
	end
	
	outputText.Text ..= `\n\n{colorPrefix}{text}`
end


return terminalUi
