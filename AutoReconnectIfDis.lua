repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
print("Auto Disconnect Enabled")
local lp, po, ts = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')

po.ChildAdded:Connect(function(a)
    if a.Name == 'ErrorPrompt' then
        wait(5)
        local plydisreason = po.ErrorPrompt.MessageArea.ErrorFrame.ErrorMessage.Text
        print(plydisreason)

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
            print("Sent")
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
            print("Sent")
        end

        local plyname = lp.Name
        local TIME_ZONE = 7
        local date = os.date("!*t")
        local hour = (date.hour + TIME_ZONE) % 24
        local ampm = hour < 12 and "AM" or "PM"
        local timestamp = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)
        local url = _G.webhook_url

        SendMessage(url, "Disconnected")

        local embed = {
            ["title"] = plyname,
            ["description"] = "Disconnected",
            ["color"] = 0xff0000,
            ["fields"] = {
                { ["name"] = "Reason", ["value"] = plydisreason },
                { ["name"] = "Time", ["value"] = timestamp }
            },
            ["footer"] = { ["text"] = "Rejoining" }
        }
        SendMessageEMBED(url, embed)

        while true do
            ts:Teleport(8304191830)
            wait(2)
        end
    end
end)
