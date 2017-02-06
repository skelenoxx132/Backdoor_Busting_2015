Another Workshop backdoor...

Discovered @ November 2016 by Niku


**DSGp27HY.lua: The backdoor code itself, has code for sending POST requests to the domain "gameserverenforcer.com". Appears to fetch Lua code from that domain and RunString's it.**

**help.cfg: Lua code that is pulled from the aforementioned domain and RunString'd. Adds two global functions "root" and "root1". The "root" function sets the usergroup of the player that executes the command "sv_root_access" to "superadmin" if the player name matches: "King Niku", "The Ruler", "root" or "PVT Travolta" (No SteamID checks eww.) The function "root1" runs a console command on the server state when the command "sv_run_command" is executed (Again with the same name checks as before.)**
