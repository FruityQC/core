AddEventHandler('playerSpawned', function()
    TriggerServerEvent('FW:SpawnPlayer')
end)

RegisterNetEvent('FW:lastPosition')
AddEventHandler('FW:lastPosition'). function(PosX, PosY, PosZ)
    Citizen.Wait(1)

    local defaultModel = GetHashKey('csb_stripper_01')
    RequestModel(defaultModel)
    while not HasModelLoaded(defaultModel) do 
        Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaultModel)
    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        lastX, lastY, lastZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerServerEvent('FWLSavePlayerPosition')
    end
end)