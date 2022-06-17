Citizen.CreateThread(function()
    Index = 0
    while true do
        FrameCount = GetFrameCount()
        Citizen.Wait(1000)
        SendNUIMessage({
            index = Index,
            frames = GetFrameCount() - FrameCount
        })
        Index = Index + 1
    end
end)