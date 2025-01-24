print("Drop Notifier Executed")
wait(2)
repeat wait() until game:IsLoaded()
_G.dropget = true
local alldrops = {}
local gameFinishedNotified = false

local function countDrops(drops)
    local dropCounts = {}
    for _, drop in ipairs(drops) do
        dropCounts[drop] = (dropCounts[drop] or 0) + 1
    end
    return dropCounts
end

while _G.dropget do
    wait()
    local drop = game:GetService("Players").LocalPlayer.PlayerGui
    for _, x in pairs(drop:GetChildren()) do
        if x.Name == "DropObtainedGUI" then
            local toget = x.messages

            for _, v in pairs(toget:GetChildren()) do
                if v.Name == "Frame" then
                    local text = v.Tex.Text
                    print(text)
                    table.insert(alldrops, text)
                    wait(0.1)
                    v:Destroy()
                end
            end
        end
    end

    local function SendMessageEMBED(url, embed)
        local headers = { ["Content-Type"] = "application/json" }
        local data = {
            ["username"] = "🏹 Drop Hunter",
            ["avatar_url"] = "https://media.istockphoto.com/id/1389359043/photo/stacks-of-coins.jpg?s=612x612&w=0&k=20&c=d4HU_uDKO7ksjWZ_ROFKJn26eeqlwslCf8KIvKU2tcM=",
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
        
        local httpService = game:GetService("HttpService")
        local body = httpService:JSONEncode(data)
        http_request({ Url = url, Method = "POST", Headers = headers, Body = body })
    end
    
    local function randomHexColor()
        return math.random(0, 0xFFFFFF)
    end
    local color = randomHexColor()
    local function getFormattedDateTime()
        return os.date("%Y-%m-%d %H:%M:%S")
    end

    if workspace:FindFirstChild("_waves_started") and workspace._DATA.GameFinished.Value == true and not gameFinishedNotified then
        wait(1)
        gameFinishedNotified = true

        local dropCounts = countDrops(alldrops)
        local dropSummary = {}
        for item, count in pairs(dropCounts) do
            table.insert(dropSummary, item .. " : " .. count .. "x")
        end

        local embed = {
            ["title"] = "||"..game.Players.LocalPlayer.Character.Name.."||",
            ["color"] = color,
            ["fields"] = {
                { ["name"] = "Drop Obtained", ["value"] = table.concat(dropSummary, "\n") }
            },
            ["footer"] = { ["text"] = getFormattedDateTime() }
        }
        SendMessageEMBED(_G.webhook_url, embed)
    end
end
