wait(4)

print("End at ".._G.EndAtWave.." set!")

wait(60)
local endat = _G.EndAtWave
while true do
    wait(5)
local gmaae = workspace
for  i, v in pairs(gmaae:GetChildren()) do
    if v.Name == "_waves_started" then

        local wavenum = workspace._wave_num.Value

        if wavenum == endat then
local tofind = workspace:WaitForChild("_UNITS")
for _, v in pairs(tofind:GetDescendants()) do
    if v.Name == "fakehead" and v.Parent and v.Parent:IsA("Model") then
        local sell = v.Parent.Name
        local units = workspace:WaitForChild("_UNITS"):GetChildren()

        for _, unit in pairs(units) do
            if unit.Name == sell then
                local args = {
                    [1] = unit
                }
                local success, err = pcall(function()
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(unpack(args))
                end)

                if not success then
                    warn("Error upgrading unit: " .. tostring(err))
                end
                
                wait(0.5)
            end
        end
    end
end
end
end
end
end