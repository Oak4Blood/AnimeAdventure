wait(3)

local gmaae = workspace

for i, v in pairs(gmaae:GetChildren()) do
    if v.Name == "weather" then
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "IsFarming"
        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 200, 0, 175)
        frame.Position = UDim2.new(0.5, 270, 0.5, -150)
        frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        frame.Parent = screenGui

        local toggleButton = Instance.new("TextButton")
        toggleButton.Size = UDim2.new(0, 180, 0, 60)
        toggleButton.Position = UDim2.new(0, 10, 0, 20)
        toggleButton.Text = "ON"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleButton.Font = Enum.Font.SourceSans
        toggleButton.TextSize = 24
        toggleButton.Parent = frame

        toggleButton.MouseButton1Click:Connect(function()
            _G.isfarming = not _G.isfarming
            if _G.isfarming then
                toggleButton.Text = "ON"
                toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                print(_G.isfarming)
            else
                toggleButton.Text = "OFF"
                toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                print(_G.isfarming)
            end
        end)

        local destroyButton = Instance.new("TextButton")
        destroyButton.Size = UDim2.new(0, 180, 0, 60)
        destroyButton.Position = UDim2.new(0, 10, 0, 90)
        destroyButton.Text = "Destroy GUI"
        destroyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        destroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        destroyButton.Font = Enum.Font.SourceSans
        destroyButton.TextSize = 24
        destroyButton.Parent = frame
        destroyButton.MouseButton1Click:Connect(function()
            screenGui:Destroy()
        end)
    end
end
