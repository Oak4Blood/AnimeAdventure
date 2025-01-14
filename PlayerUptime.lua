print("Player uptime executed")
wait(4)
local countsec = _G.uptimedelay

count = 0

local http = game:GetService("HttpService")
local url = _G.playeruptimewebhook

local function SendMessageEMBED(url, embed)
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["username"] = "User Tracker",
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

    local minutesToAdd = countsec / 60

    local embed = {
        ["title"] = game.Players.LocalPlayer.Character.Name,
        ["color"] = color,
        ["fields"] = {
            { ["name"] = "🟢 Online", ["value"] = string.format("%.2f minute", count) },
        },
        ["footer"] = { ["text"] = getFormattedDateTime() }
    }
    
    SendMessageEMBED(url, embed)

    count = count + minutesToAdd

    wait(countsec)
end
