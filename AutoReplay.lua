_G.autoreplay = true
print("AutoReplay Executed")

local function replaytease()
    local function SendMessageEMBED(url, embed)
        local headers = { ["Content-Type"] = "application/json" }
        local data = {
            ["username"] = "👩‍💻 Your Private Assistant",
            ["avatar_url"] = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/caf1f59c-cbae-4e80-adf0-0717491aaad7/dga5nnp-471e7f06-245b-413c-803b-bbddb3d85090.jpg/v1/fill/w_768,h_1024,q_75,strp/sexy_secretary_b_8301f_by_incidesign_dga5nnp-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcL2NhZjFmNTljLWNiYWUtNGU4MC1hZGYwLTA3MTc0OTFhYWFkN1wvZGdhNW5ucC00NzFlN2YwNi0yNDViLTQxM2MtODAzYi1iYmRkYjNkODUwOTAuanBnIiwid2lkdGgiOiI8PTc2OCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.2k68_eMAZZ5DnzQB-kBzCLSuJWK5i6lhAqei_AwAdPE",
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

    local embed = {
        ["title"] = "รายงานค่ะท่าน!",
        ["color"] = color,
        ["fields"] = {
            { ["name"] = "รีเพลย์ Replay ให้คุณ "..game.Players.LocalPlayer.Character.Name, ["value"] = "เรียบร้อยค่ะ Success!" }
        },
        ["footer"] = { ["text"] = getFormattedDateTime() }
    }
    SendMessageEMBED(_G.webhook_url, embed)
end

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
replaytease()

_G.autoreplay = false
end
end
end
end
