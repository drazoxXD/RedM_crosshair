CreateThread(function()
    local aiming = false
    while true do
        Wait(500)
        local isAiming = IsPlayerFreeAiming(PlayerId())
        if isAiming ~= aiming then
            aiming = isAiming
            if aiming then
                SendNUIMessage("xhairShow")
                Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_IN_FAST_TRAVEL_MENU"))
            else
                SendNUIMessage("xhairHide")
                Citizen.InvokeNative(0x8BC7C1F929D07BF3 ,GetHashKey("HUD_CTX_IN_FAST_TRAVEL_MENU")) 
            end
        end
    end
end)

-- aimsleep = 1000
-- CreateThread(function ()
--     while true do
--         if IsPlayerFreeAiming(PlayerId()) then
--             aimsleep = 1
--         else
--             aimsleep = 1000
--         end
--         Wait(aimsleep)
--     end
-- end)