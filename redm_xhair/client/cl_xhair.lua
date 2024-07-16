local debounceTime = 100
local lastSentTime = 0

CreateThread(function()
    local aiming = false
    while true do
        Wait(500)
        local isAiming = IsPlayerFreeAiming(PlayerId())
        local currentTime = GetGameTimer()

        if isAiming ~= aiming and currentTime - lastSentTime > debounceTime then
            aiming = isAiming
            lastSentTime = currentTime
            if aiming then
                SendNUIMessage("xhairShow")
                Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_IN_FAST_TRAVEL_MENU"))
            else
                SendNUIMessage("xhairHide")
                Citizen.InvokeNative(0x8BC7C1F929D07BF3, GetHashKey("HUD_CTX_IN_FAST_TRAVEL_MENU"))
            end
        end
        print(lastSentTime, currentTime)
    end
end)
