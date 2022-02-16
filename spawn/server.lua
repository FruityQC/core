AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local steamid
    local license 

    for k, v in ipairs(identifiers) do 
        if string.match(v, 'steam:') then 
            steamid = v
            print(v)
        end
    end

    if not steamid then
        deferrals.done('Steam est requis.')
    else --Si steam est ouvert
       deferrals.done() 

       MySQL.Async.fetchScalar('SELECT 1 FROM user_identifiers WHERE steamid = @steamid', {
           ['@steamid'] = steamid 
       }, function(result)
            if not result then
                print('STEAM_ID ERR')

                MySQL.Async.execute('INSERT INTO user_identifiers (steamname, steamid, license) VALUES (@steamname, @steamid, @license)', {
                    ['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid, ['@license'] = license})
            else
                print("Steamid OK")
            end
        end)
    end
end)