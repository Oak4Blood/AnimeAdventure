print("Player uptime executed")
wait(4)
local countsec = _G.uptimedelay

count = 0

local http = game:GetService("HttpService")
local url = _G.playeruptimewebhook

local function checkwhereami()
    local workspace = game:GetService("Workspace")
    if workspace:FindFirstChild("_waves_started") and workspace._wave_num then
        wavenum = workspace._wave_num.Value
    else
        wavenum = nil
    end
end

local function SendMessageEMBED(url, embed)
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["username"] = "📹 Wireless CCTV Camera",
        ["avatar_url"] = "https://4.imimg.com/data4/WT/XE/MY-34431755/wireless-cctv-camera.jpg",
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = { ["text"] = embed.footer.text },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
    }
    local body = http:JSONEncode(data)
    http_request({ Url = url, Method = "POST", Headers = headers, Body = body })
end

while _G.playeruptime do
    wait(0.5)

    function randomHexColor()
        local randomColor = math.random(0, 0xFFFFFF)
        return randomColor
    end

    local color = randomHexColor()

    local function getFormattedDateTime()
        return os.date("%Y-%m-%d %H:%M:%S")
    end
    checkwhereami()
    local minutesToAdd = countsec / 60
    local playert = game.Players.LocalPlayer.Character.Name
    local embed = {
        ["title"] = "||"..playert.."||",
        ["color"] = color,
        ["fields"] = {
            { ["name"] = "🟢 Online", ["value"] = string.format("%.2f minute", count) },
            { 
                ["name"] = "🌊 Wave", 
                ["value"] = wavenum and tostring(wavenum) or "Player in lobby"
            },
        },
        ["footer"] = { ["text"] = getFormattedDateTime() }
    }
    
    SendMessageEMBED(url, embed)

    count = count + minutesToAdd

    wait(countsec)
end
