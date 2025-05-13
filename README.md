Roblox Terminal Command System

🔏 Usage Terms  
- You may use/modify this code, but **you MUST**:  
  - Credit me (`@GuyWithAFrownyFace`)
  - Link back to this repo.  

DISCLAIMER:
This will NOT work in Rojo currently. The system is designed around the Roblox Studio hierarchy and uses GUI elements and assets that require Studio's built-in services and layout.

Overview

This project is a modular Terminal Command System for Roblox, designed to allow in-game execution of admin-style commands using a mock terminal UI. It includes:

Command parsing and routing

Permissions and security checks

UI terminal with scrollable output

Support for message types (e.g., error, info, success)

Pluggable commands (kick, warn, etc.)

Basic error messaging and execution feedback

(Planned) Features: autocomplete, audit logs

Folder Structure

ReplicatedStorage/

Shared/

SettingsModule.lua

ParseInput.lua

TerminalRemotes/

TerminalCommand (RemoteEvent)

MessageType (RemoteEvent)

ServerScriptService/

Core.lua (Command execution manager)

Security.lua (Permission checking per player and command)

CommandRegistry.lua (Registered commands and logic)

RemoteHub.lua (Handles TerminalCommand remote input)

StarterGui/

TerminalGui/

TerminalSimpleUi/

TextInput (TextBox)

ScrollingFrame/

TextOutput (TextLabel)

Ui (LocalScript)

MessageHandler.lua (ModuleScript)

Script Summaries

ParseInput.lua
Parses raw input from the terminal like "!kick bob spamming" into:

command = "kick"

args = { "bob", "spamming" }

SettingsModule.lua
Stores any game-specific configuration values used by other modules. Optional and customizable.

CommandRegistry.lua
A table-based registry that holds all supported commands and how they execute. Each command defines required argument names and execution logic. For example:

["kick"] = {
args = {"target", "reason"},
execute = function(plr, args) ...
}

Security.lua
Handles permission levels for players. Checks if a player is allowed to run a specific command. Unauthorized attempts are logged or blocked.

Core.lua
The command dispatcher. Given a valid command and arguments, it runs the logic from CommandRegistry. Assumes RemoteHub has already validated permissions.

RemoteHub.lua
Listens for terminal input via TerminalCommand remote event. Parses command name and args, checks permissions using Security, and executes the command if authorized. Otherwise, sends back a failure message or blocks execution.

Ui (LocalScript)
The terminal's client-side logic. Sends parsed input to the server when enter is pressed. Handles response messages via MessageType RemoteEvent. Detects invalid syntax and shows local error. Temporarily replaces input field text and restores it after a delay.

MessageHandler.lua
Handles formatted message output. Appends messages to TextOutput.Text. Supports newline spacing and type-specific prefixes like [ERROR], [INFO], [OK]. Can be expanded to support color formatting or severity levels.

Terminal Behavior

Player types a command like "!kick player1 too annoying"

Ui parses input and fires TerminalCommand

RemoteHub receives the command, checks permissions

If valid, Core runs the command logic from CommandRegistry

Result is sent back via MessageType and printed to the terminal output

Notes and Limitations

Not Rojo-compatible

Does not support auto-complete or tab suggestions

Basic security relies on permission levels (which can be expanded)

Easy to extend with new commands through CommandRegistry

To-Do / Future Plans

Add autocomplete for known commands

Implement audit logs (who used what command and when)

Save warnings or flags using DataStores

Expand command set: teleport, ban, giveitem, etc.

Example Commands

!kick co "griefing"
!warn noobmaster69 "suspicious actions"
!unknown → will print 'Command not found'

Built for modularity, extensibility, and direct in-game administration.

