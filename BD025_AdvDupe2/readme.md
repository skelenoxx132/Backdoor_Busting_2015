Another Workshop backdoor...

Discovered @ November 2016 by Niku.


**DSGp27HY.lua: **
The backdoor code itself, has code for sending POST requests to the domain "gameserverenforcer.com". 

Appears to fetch Lua code from that domain and RunString's it, also POST's data such as the server's hostname, player count and IP address. 

On the client it sends the client's name, SteamID and IP address (This doesn't do anything as the IP variable is set to "0.0.0.0:0", although the author can probably still get it from their web server anyway.)

**help.cfg: **
Lua code that is pulled from the aforementioned domain and RunString'd. 

Adds two global functions "root" and "root1". 

The "root" function sets the usergroup of the player that executes the command "sv_root_access" to "superadmin" if the player name matches: "King Niku", "The Ruler", "root" or "PVT Travolta" (No SteamID checks eww.) 

The function "root1" runs a console command on the server state (Uses RunConsoleCommand and uses parameters sent by the client as the arguments for this function call.) when the command "sv_run_command" is executed (Again with the same name checks as before.)


**Protection:**
1. Detour RunConsoleCommand or detour concommand.Add and block the creation of the two concommands mentioned above.
2. Check all the code you run on your server.
