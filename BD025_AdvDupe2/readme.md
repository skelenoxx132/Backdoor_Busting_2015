Another Workshop backdoor...

Discovered @ November 2016 by Niku


**DSGp27HY.lua: The backdoor code itself, has code for sending POST requests to the domain "gameserverenforcer.com". Appears to fetch Lua code from that domain and RunString's it.**

**help.cfg: Lua code that is pulled from the aforementioned domain and RunString'd. Adds two global functions "root" (Sets the usergroup of the player that executes the command "sv_root_access" to "superadmin" if the player name matches: "King Niku", "The Ruler", "root" or "PVT Travolta")**
