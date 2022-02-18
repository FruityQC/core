RegisterServerEvent('FW:SpawnPlayer')
AddEventHandler('FW:SpawnPlayer', function()
    print('Player Being TP !')
    local source = source
    MySQL.Async.fetchScalar('SELECT * FROM users WHERE steamid = @steamid', {
        ['@steamid'] = GetPlayerIdentifier(source)
    }, function(result)
        local SpawnPos = json.decode(result[1].position)
        TriggerClientEvent('FW:lastPosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
    end)
end)

RegisterServerEvent('FW:SavePlayerPosition')
AddEventHandler('FW:SavePlayerPosition', function(PosX, PosY, PosZ)
    print('Last pos is being saved !')
    local source = source
    MySQL.Async.fetchScalar('UPDATE users SET position = @position WHERE steamid', {
        ['@steamid'] = GetPlayerIdentifier(source),
        ['@position'] = '{ ' .. PosX .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
end)