_G.webhook = true
wait(2)
print("Webhook Executed")
local waved = _G.EndAtWave
if waved == 0 then
    waves = "Infinite"
else
    waves = _G.EndAtWave
end

local http = game:GetService("HttpService")
local url = _G.webhook_url
local function SendMessageEMBED(url, embed)
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["username"] = "🧐 Nosey Guy",
        ["avatar_url"] = "https://www.collinsdictionary.com/images/full/bush_132902558.jpg",
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
    print("Message Sent")
end

function randomHexColor()
    local randomColor = math.random(0, 0xFFFFFF)
    
    return randomColor
end

local color = randomHexColor()
function getRandomFooterText()
    local footerMessages = {
        "Replaying",
        "Waiting for Replay",
        "Match in Progress",
        "Next Round Incoming",
        "Game Continues",
        "Battle Ongoing",
        "New Challenge",
        "Preparing for Next Wave",
        "Using script?",
        "Stay Focus!",
        "Hi Plum!"
    }
    return footerMessages[math.random(1, #footerMessages)]
end

function getRandomInfoPattern()
    local InfoPattern = {
        1,
        2,
        3
    }
    return InfoPattern[math.random(1, #InfoPattern)]
end

wait()

while _G.webhook do
    wait()
    if workspace:FindFirstChild("_waves_started") and workspace._DATA.GameFinished.Value == true then
        local players = game:GetService("Players")
        local workspace = game:GetService("Workspace")
        local player = players.LocalPlayer
        local playerGui = player.PlayerGui
        local stats = player._stats
        local realresultsUI = playerGui.ResultsUI
        repeat
            wait()
        until realresultsUI.Enabled == true
        wait(0.5)
        local resultsUI = realresultsUI.Holder
        local plyname = player.Character.Name
        local winorlose = resultsUI.Title.Text
        local act = resultsUI.LevelName.Text
        local gemsvalue = stats.gem_amount.Value
        local wavenum = workspace._wave_num.Value
        local goldsvalue = stats.gold_amount.Value
        local plylevel = playerGui.spawn_units.Lives.Main.Desc.Level.Text
        local ingamereward = playerGui.Waves.HealthBar.IngameRewards.GemRewardTotal.Holder.Main.Amount.Text
        local killse = stats.kills.Value
        local timer = resultsUI.Middle.Timer.Text
        local xp = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.XPReward.Main.Amount.Text
        local function getFormattedDateTime()
            return os.date("%Y-%m-%d %H:%M:%S")
        end
        local randompattern = getRandomInfoPattern()
        if randompattern == 1 then
            local embed = {
                ["title"] = "||" .. plyname .. "|| <---- Press to view Username",
                ["color"] = color,
                ["fields"] = {
                    { ["name"] = "🗺️ Act", ["value"] = act },
                    { ["name"] = "🏆 Result", ["value"] = winorlose },
                    { ["name"] = "⏳ Total Time", ["value"] = timer },
                    { ["name"] = "🌊 Waves Completed", ["value"] = tostring(wavenum)  .. " | Replay at wave: " .. waves },
                    { ["name"] = "🍀 Level", ["value"] = tostring(plylevel) },
                    { ["name"] = "🌟 XP", ["value"] = tostring(xp) },
                    { ["name"] = "💎 Gems", ["value"] = tostring(gemsvalue) },
                    { ["name"] = "💰 Gold", ["value"] = tostring(goldsvalue) },
                    { ["name"] = "⚔️ Total Kills", ["value"] = tostring(killse) },
                    { ["name"] = "💠 Match Reward", ["value"] = ingamereward.." Gems" },
                    { ["name"] = "⏰ Real Life Time", ["value"] = getFormattedDateTime() }
                },
                ["footer"] = { ["text"] = getRandomFooterText() }
            }
            SendMessageEMBED(url, embed)
        end
        
        if randompattern == 2 then
        
        local embed = {
            ["title"] = "||" .. plyname .. "|| <---- Press to view Username",
            ["color"] = color,
            ["fields"] = {
                { ["name"] = "🗺️ Act", ["value"] = "Act: " .. act, ["inline"] = true },
                { ["name"] = "🏆 Result", ["value"] = "Result: " .. winorlose, ["inline"] = true },
                { ["name"] = "⏳ Total Time", ["value"] = "Total Time: " .. timer, ["inline"] = true },
                { ["name"] = "🌊 Waves Completed", ["value"] = tostring(wavenum) .. " | Replay at wave: " .. waves, ["inline"] = true },
                { ["name"] = "🍀 Level", ["value"] = tostring(plylevel), ["inline"] = true },
                { ["name"] = "🌟 XP", ["value"] = tostring(xp), ["inline"] = true },
                { ["name"] = "💎 Gems", ["value"] = tostring(gemsvalue), ["inline"] = true },
                { ["name"] = "💰 Gold", ["value"] = tostring(goldsvalue), ["inline"] = true },
                { ["name"] = "⚔️ Total Kills", ["value"] = tostring(killse), ["inline"] = true },
                { ["name"] = "💠 Match Reward", ["value"] = ingamereward .. " Gems", ["inline"] = true },
                { ["name"] = "⏰ Real Life Time", ["value"] = getFormattedDateTime(), ["inline"] = false }
            },
            ["footer"] = { ["text"] = getRandomFooterText() }
        }
            SendMessageEMBED(url, embed)
        end
        
        if randompattern == 3 then
            local embed = {
                ["title"] = "||" .. plyname .. "|| <---- Press to view Username",
                ["color"] = color,
                ["fields"] = {
                    { ["name"] = "🗺️ Act", ["value"] = "Act: " .. act, ["inline"] = true },
                    { ["name"] = "🏆 Result", ["value"] = "Result: " .. winorlose, ["inline"] = true },
                    { ["name"] = "⏳ Total Time", ["value"] = "Total Time: " .. timer, ["inline"] = true },
                    { ["name"] = "🌊 Waves Completed", ["value"] = tostring(wavenum) .. " | Replay at wave: " .. waves, ["inline"] = true },
                    { ["name"] = "🍀 Level", ["value"] = tostring(plylevel), ["inline"] = true },
                    { ["name"] = "🌟 XP", ["value"] = tostring(xp), ["inline"] = true },
                    { ["name"] = "💎 Gems", ["value"] = tostring(gemsvalue), ["inline"] = true },
                    { ["name"] = "💰 Gold", ["value"] = tostring(goldsvalue), ["inline"] = true },
                    { ["name"] = "⚔️ Total Kills", ["value"] = tostring(killse), ["inline"] = true },
                    { ["name"] = "💠 Match Reward", ["value"] = ingamereward .. " Gems", ["inline"] = true },
                    { ["name"] = "⏰ Real Life Time", ["value"] = getFormattedDateTime(), ["inline"] = false }
                },
                ["footer"] = { ["text"] = getRandomFooterText() }
            }
        
        local formattedFields = "```" .. 
            "🗺️ Act: " .. act .. "\n" ..
            "🏆 Result: " .. winorlose .. "\n" ..
            "⏳ Total Time: " .. timer .. "\n" ..
            "🌊 Waves Completed: " .. tostring(wavenum) .. " | Replay at wave: " .. waves .. "\n" ..
            "🍀 Level: " .. tostring(plylevel) .. "\n" ..
            "🌟 XP: " .. tostring(xp) .. "\n" ..
            "💎 Gems: " .. tostring(gemsvalue) .. "\n" ..
            "💰 Gold: " .. tostring(goldsvalue) .. "\n" ..
            "⚔️ Total Kills: " .. tostring(killse) .. "\n" ..
            "💠 Match Reward: " .. ingamereward .. " Gems\n" ..
            "⏰ Real Life Time: " .. getFormattedDateTime() .. "\n" ..
            "```"
        
        embed["fields"] = { 
            { ["name"] = "End Game Info", ["value"] = formattedFields, ["inline"] = false }
        }
            SendMessageEMBED(url, embed)
        end        
        _G.webhook = false
    end
end
