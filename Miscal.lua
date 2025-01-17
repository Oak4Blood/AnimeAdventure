print("Anti afk is running")

-- Anti AFK Script
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

--Function to hide message
local function message()
    wait(2)
    local MessagGui = game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.messages
    MessagGui.Visible = false
end

-- Function to Show Gem
local function showgem()
    wait(3)
    local gemUI = game:GetService("Players").LocalPlayer.PlayerGui.spawn_units.Lives.Frame.Resource.Gem
    gemUI.Visible = true
    print("Gem UI set to visible")
end

-- Wait in lobby too long
local function lobbystuck()
    local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

ts:Teleport(game.PlaceId, p)
end


local function toggleui()
    local gmaae = workspace

for i, v in pairs(gmaae:GetChildren()) do
    if v.Name == "weather" then

local plyui = game:GetService("Players").LocalPlayer.PlayerGui

repeat
    wait()
until plyui:FindFirstChild("IsFarming") and plyui:FindFirstChild("Unit_ID_List")

local Farmgui = game:GetService("Players").LocalPlayer.PlayerGui.IsFarming
local UnitList = game:GetService("Players").LocalPlayer.PlayerGui.Unit_ID_List

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ToggleFarm"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 45, 0, 45)
Frame.Position = UDim2.new(0.768, 0, -0.03, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, 0, 1, 0)
Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Button.Text = "Hide"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSans
Button.TextSize = 15
Button.Parent = Frame

local isEnabled = false

Button.MouseButton1Click:Connect(function()
    isEnabled = not isEnabled
    if isEnabled then
        Button.Text = "Hide"
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Farmgui.Enabled = true
        UnitList.Enabled = true
    else
        Button.Text = "Show"
        Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        Farmgui.Enabled = false
        UnitList.Enabled = false
    end
end)
end
end
end

-- Auto Vote Start
local function vstart()
    local earth1 = workspace
for _, v in pairs(earth1:GetChildren()) do
    if v.Name == "_waves_started" then
        local vstart = game:GetService("Players").LocalPlayer.PlayerGui.VoteStart
repeat
    wait()
until vstart.Enabled == true
wait(0.5)
        game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
    end
end
end

-- Call Function
showgem()
message()
toggleui()
vstart()

for _, v in pairs(workspace:GetChildren()) do
    if v.Name == "weather" then
wait(300)
print("Player stay in lobby too long rejoining")
local function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = { ["Content-Type"] = "application/json" }
    local data = { ["content"] = message }
    local body = http:JSONEncode(data)

    http_request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })

    print("Message sent:", message)
end

local function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = { ["text"] = embed.footer.text }
            }
        }
    }
    local body = http:JSONEncode(data)

    http_request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })

    print("Embed sent:", embed.title)
end
local function getFormattedDateTime()
    return os.date("%Y-%m-%d %H:%M:%S")
end

SendMessage(url, "")
local embed = {
    ["title"] = plyname,
    ["description"] = "",
    ["color"] = 0x8A00FF,
    ["fields"] = {
        { ["name"] = "Player Rejoin", ["value"] = "Player stay in lobby too long rejoining" },
    },
    ["footer"] = { ["text"] = getFormattedDateTime() }
}
SendMessageEMBED(url, embed)
lobbystuck()
    end
end
