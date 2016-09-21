```
ThirdPersonController backdoor / Server takeover 

Discovered @ 07.08.15 by HeX

Updated @ 21.09.16 by RyanJGray

(I have no idea where the new backdoor code is being used as I ripped it directly from the 
backdoor developers website. I would presume it is still being used in ThirdPersonController.)

"autocontentupdater.lua" creates a timer that runs every 300 seconds (5 minutes)
and reports the value of ConVar "hostport" (The port the server is running on.) to the
website "http://thisisreallylegit.appspot.com/iujchfsdacj" with the parameter "?port=hostportvaluehere".

"iujchfsdacj.lua" contains the payload code as explained below (Prettified so you can read it.)

That webpage replies back with a payload that the server should run (Uses RunString to execute this.)
the payload creates the console command "XJX3LNWQO1S58PJ1fza0" which performs some anti-detection
measures such as disabling ULX logging on the server so it is untraceable.

This backdoor adds console commands that will do the following: Set self user group, Set a players user group,
Remove all online admins usergroups and kick them, Remove a players user group, Execute commands on the server,
Give a player ULX access to everything, Get all user groups on the server and send a POST request to a webpage on
the backdoor's website "http://thisisreallylegit.appspot.com/post_server" (Again with the parameter "?port=hostportvaluehere") and also 
with the following parameters: (In the POST request and in this order.)

server_name, rcon, gamemodename, map, serverport, serverpass, currentplayers, maxplayers, updateage

If you feel like spamming his logs then use HeX's "3rd_tft.lua" file to fill his log with random stuff.

Protection:
. Read and understand all code you run on your servers.
. Override RunString/RunStringEx/CompileString to prevent running remote HTTP payloads.
```
