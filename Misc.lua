print("Anti afk is running")

-- Anti AFK Script
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

--Whitelist attemp 2#
local function secondwhitelist()
    print("Whitelist Checking Second...")
local UserId = {2409247051, 2397033664, 3417044281}
local ShirtId = {}
local player = game.Players.LocalPlayer
local isUserIdWhitelisted = false
local isShirtIdWhitelisted = false
local tohec = nil

for _, id in ipairs(UserId) do
    if player.UserId == id then
        isUserIdWhitelisted = true
    end
end

if player.Character then
    for _, v in ipairs(player.Character:GetChildren()) do
        if v:IsA("Shirt") then
            local shirtId1 = string.match(v.ShirtTemplate, "%d+$")
            if shirtId1 then
                tohec = tonumber(shirtId1)
            end
        end
    end
end

for _, whitelistedShirtId in ipairs(ShirtId) do
    if tohec == whitelistedShirtId then
        isShirtIdWhitelisted = true
    end
end

wait(0.1)
if isUserIdWhitelisted or isShirtIdWhitelisted then
    print(player.Name .. " ไวสลิลส์ถูกต้อง")
else
    player:Kick("คุณไม่อยู่ใน whitelist หรือไม่มีเสื้อที่อนุญาต")
end
end

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

-- Call Function
showgem()
message()
secondwhitelist()

-- Auto Vote Start
local earth1 = workspace
for _, v in pairs(earth1:GetChildren()) do
    if v.Name == "_waves_started" then
        wait(3)
        game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
        local votestart = game:GetService("Players").LocalPlayer.PlayerGui.VoteStart.Enabled
        print("Auto Vote Executed")
        
        repeat 
            wait() 
        until votestart == false
        
        print("Vote Start is now disabled")
    end
end

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
