wait(10)

repeat wait() until game:IsLoaded()
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local gmaae = workspace

for i, v in pairs(gmaae:GetChildren()) do
    if v.Name == "weather" then
        print("Lobby")
        wait(2)

        if _G.isfarming then
            local args = {
                [1] = "_lobbytemplategreen1"
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))

            wait(0.5)

            local args = {
                [1] = "_lobbytemplategreen1",
                [2] = "namek_infinite",
                [3] = false,
                [4] = "Hard"
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))

            wait(0.3)

            local args = {
                [1] = "_lobbytemplategreen1"
            }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
        elseif not _G.isfarming then
            print("Stopped Farming")
        end
    end
end