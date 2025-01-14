_G.autoreplay = true
print("AutoReplay Executed")

while _G.autoreplay do

wait(1)

local gmaae = workspace

for  i, v in pairs(gmaae:GetChildren()) do
if v.Name == "_waves_started" then

local checkend = workspace._DATA.GameFinished.Value

if checkend == true then
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local playerGui = player.PlayerGui
    local realresultsUI = playerGui.ResultsUI
    repeat
        wait()
    until realresultsUI.Enabled == true
    wait(1.5)

local args = {
    [1] = "replay"
}

game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("set_game_finished_vote"):InvokeServer(unpack(args))
    
wait(1)

local args = {
    [1] = "replay"
}

game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("set_game_finished_vote"):InvokeServer(unpack(args))

_G.autoreplay = false
end
end
end
end