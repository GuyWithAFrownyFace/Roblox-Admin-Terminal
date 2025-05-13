
local commandRegistry = require(script.Parent.CommandSchema)

local parser = {}

function parser.ParseCommand(input)
	local prefix = "!"
	input = input:match("^%s*(.-)%s*$") -- trim leading/trailing spaces

	if input:lower():sub(1, #prefix) ~= prefix:lower() then
		return nil
	end

	local commandStr = input:sub(#prefix + 1)
	local parts = {}

	-- Extract quoted sections first
	for quoted in commandStr:gmatch("%b\"\"") do
		table.insert(parts, quoted:sub(2, -2)) -- remove quotes
		commandStr = commandStr:gsub(quoted, "", 1)
	end

	-- Extract remaining words
	for word in commandStr:gmatch("%S+") do
		table.insert(parts, word)
	end

	if #parts == 0 then return nil end

	local commandName = parts[1]:lower()
	local commandDef = commandRegistry[commandName]
	if not commandDef then return nil end

	local schemaArgs = commandDef.args or {}
	local args = {}
	local i = 2

	for index, argName in ipairs(schemaArgs) do
		if index == #schemaArgs then
			-- Last argument captures the rest
			args[argName] = table.concat(parts, " ", i)
		else
			args[argName] = parts[i]
		end
		i += 1
	end

	return {
		command = commandName,
		args = args
	}
end

return parser
