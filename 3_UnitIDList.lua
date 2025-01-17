wait(3)

local gmaae = workspace

for i, v in pairs(gmaae:GetChildren()) do
    if v.Name == "weather" then

local getunitid = game:GetService("ReplicatedStorage")._FX_CACHE
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Unit_ID_List"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local destroyButton = Instance.new("TextButton")
destroyButton.Size = UDim2.new(0, 25, 0, 25)
destroyButton.Position = UDim2.new(0.76, 0, 0.05, 0)
destroyButton.Text = "X"
destroyButton.TextSize = 14
destroyButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
destroyButton.Parent = screenGui
destroyButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local searchBar = Instance.new("TextBox")
searchBar.Size = UDim2.new(0.5, 0, 0.05, 0)
searchBar.Position = UDim2.new(0.25, 0, 0.05, 0)
searchBar.PlaceholderText = "Search by Name"
searchBar.TextSize = 14
searchBar.Text = ""
searchBar.Parent = screenGui

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0.5, 0, 0.7, 0)
scrollingFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.Parent = screenGui

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = scrollingFrame

local function displayUnits(searchTerm)
    for _, child in pairs(scrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    for i, v in pairs(getunitid:GetDescendants()) do
        if v.Name == "CollectionUnitFrame" then
            local unitName = v.name.Text
            local unitId = v._uuid.Value
            local unitlv = v.Main.Level.Text
            if string.find(string.lower(unitName), string.lower(searchTerm)) then
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, -20, 0, 100)
                frame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                frame.BorderSizePixel = 1
                frame.Parent = scrollingFrame

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Size = UDim2.new(1, -10, 0.5, -5)
                nameLabel.Position = UDim2.new(0, 5, 0, 5)
                nameLabel.Text = "Name: " .. unitName .. " Level: " .. unitlv
                nameLabel.TextSize = 14
                nameLabel.TextXAlignment = Enum.TextXAlignment.Left
                nameLabel.BackgroundTransparency = 1
                nameLabel.Parent = frame

                local idLabel = Instance.new("TextLabel")
                idLabel.Size = UDim2.new(1, -10, 0.5, -5)
                idLabel.Position = UDim2.new(0, 5, 0.5, 0)
                idLabel.Text = "UUID: " .. unitId
                idLabel.TextSize = 14
                idLabel.TextXAlignment = Enum.TextXAlignment.Left
                idLabel.BackgroundTransparency = 1
                idLabel.Parent = frame

                local copyButton = Instance.new("TextButton")
                copyButton.Size = UDim2.new(0.2, 0, 0.3, 0)
                copyButton.Position = UDim2.new(0.79, 0, 0.1, 0)
                copyButton.Text = "Copy"
                copyButton.TextSize = 12
                copyButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
                copyButton.Parent = frame
                copyButton.MouseButton1Click:Connect(function()
                    setclipboard(unitId)
                    print("Copied to clipboard: " .. unitId)
                end)

                local EquipButton = Instance.new("TextButton")
                EquipButton.Size = UDim2.new(0.2, 0, 0.2, 0)
                EquipButton.Position = UDim2.new(0.79, 0, 0.4, 0)
                EquipButton.Text = "Equip"
                EquipButton.TextSize = 12
                EquipButton.BackgroundColor3 = Color3.fromRGB(167, 22, 255)
                EquipButton.Parent = frame
                EquipButton.MouseButton1Click:Connect(function()

                local args = {
                   [1] = unitId
                }

                game:GetService("ReplicatedStorage").endpoints.client_to_server.equip_unit:InvokeServer(unpack(args))
                end)
            end
        end
    end

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
    end)
end

local refreshButton = Instance.new("TextButton")
refreshButton.Size = UDim2.new(0.15, 0, 0.05, 0)
refreshButton.Position = UDim2.new(0.25, 0, 0.87, 0)
refreshButton.Text = "Refresh Units"
refreshButton.TextSize = 14
refreshButton.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
refreshButton.Parent = screenGui
refreshButton.MouseButton1Click:Connect(function()
    displayUnits(searchBar.Text)
end)

displayUnits("")

searchBar.Changed:Connect(function(property)
    if property == "Text" then
        displayUnits(searchBar.Text)
    end
end)
end
end
