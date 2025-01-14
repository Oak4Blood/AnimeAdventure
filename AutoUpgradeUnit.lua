_G.autoupgrade = true
print("Auto upgrade unit Executed")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local earth = workspace

for  i, v in pairs(earth:GetChildren()) do
if v.Name == "_waves_started" then

while _G.autoupgrade do
    wait(2)

    local wavenum = workspace._wave_num.Value
    if wavenum >= 8 then
        local tofind = workspace:WaitForChild("_UNITS")
        for _, v in pairs(tofind:GetDescendants()) do
            if v.Name == "fakehead" and v.Parent and v.Parent:IsA("Model") then
                local upgrade = v.Parent.Name
                local units = workspace:WaitForChild("_UNITS"):GetChildren()
        
                for _, unit in pairs(units) do
                    if unit.Name == upgrade then
                        local args = {
                            [1] = unit
                        }
                        local success, err = pcall(function()
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unpack(args))
                        end)
        
                        if not success then
                            warn("Error upgrading unit: " .. tostring(err))
                        end
                        
                        wait(0.5)
                    end
                end
            end
        end

        if wavenum == 40 then
            _G.autoupgrade = false
        end
    end
end
end
end