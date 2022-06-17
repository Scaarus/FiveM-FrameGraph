Citizen.CreateThread(function()
    Index = 0
    while true do
        FrameCount = GetFrameCount()
        Citizen.Wait(1000)
        SendNUIMessage({
            type = "update",
            index = Index,
            frames = GetFrameCount() - FrameCount
        })
        Index = Index + 1
    end
end)

TriggerEvent('chat:addSuggestion', '/fpsavg', 'Average FPS over the given duration', {
    { name = "duration", help = "How long to record FPS in seconds" }
})

RegisterCommand("fpsavg", function(_, args, _)
    local duration = tonumber(args[1])
    if duration == nil then
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = false,
            args = { "FrameGraph", "`"..tostring(args[1]).."` is not a valid number."}
        })
        return
    end

    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = false,
        args = { "FrameGraph", "Measuring FPS for "..duration.." seconds."}
    })

    local frameCount = GetFrameCount()
    Citizen.Wait(tonumber(args[1]) * 1000)
    local average = (GetFrameCount() - frameCount) / duration

    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = false,
        args = { "FrameGraph", "Average FPS over "..duration.." seconds: "..average}
    })
end, false)

TriggerEvent('chat:addSuggestion', '/fps', 'Toggle the FPS graph', {})

RegisterCommand("fps", function(_, _, _)
    SendNUIMessage({ type = "toggle" })
end, false)
