handsup = false
animation = {
    dict = "missminuteman_1ig_2",
    anim = "handsup_enter"
}

RegisterCommand("handsup", function()
    if not handsup then
        local src = source
        if not HasAnimDictLoaded(animation.dict) then
            RequestAnimDict(animation.dict)
            while not HasAnimDictLoaded(animation.dict) do
                Citizen.Wait(1)
            end
        end
        TaskPlayAnim(PlayerPedId(), animation.dict, animation.anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        handsup = true

        Citizen.CreateThread(function()
            while handsup do
                Citizen.Wait(1)
                DisableControlAction(0, 24)
                DisableControlAction(0, 25)
                DisableControlAction(0, 69)
                DisableControlAction(0, 70)
                DisableControlAction(0, 92)
                DisableControlAction(0, 114)
                DisableControlAction(0, 257)
                DisableControlAction(0, 331)
            end
        end)
    else 
        ClearPedTasks(PlayerPedId())
        handsup = false
    end
end)
RegisterKeyMapping("handsup", "Handsup command", "keyboard", "X")