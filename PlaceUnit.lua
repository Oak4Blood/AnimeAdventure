_G.autounit = true
repeat wait() until game:IsLoaded()
wait(4)

print("Auto Place unit Executed")
local http = game:GetService("HttpService")
local url = _G.webhook_url
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
end
local function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["username"] = "🎯 Slave Tracker",
        ["avatar_url"] = "https://imagedelivery.net/LBWXYQ-XnKSYxbZ-NuYGqQ/43ff6df7-933b-4cfd-4aee-c8bf0d7b3700/avatarhd",
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
end

local function getFormattedDateTime()
    return os.date("%Y-%m-%d %H:%M:%S")
end

local players = game:GetService("Players")
local player = players.LocalPlayer

function randomHexColor()
    local randomColor = math.random(0, 0xFFFFFF)
    
    return randomColor
end

local color = randomHexColor()

local sentUnits = {}

while _G.autounit do
    wait(1)
    local gmaae = workspace
    for  i, v in pairs(gmaae:GetChildren()) do
        if v.Name == "_waves_started" then
            local wavenum = workspace._wave_num.Value
            wait(0.5)
            if _G.limitunit >= 1 and wavenum == 2 and not sentUnits["unit1"] then
                if _G.GroundOrHill == "Hill" or _G.GroundOrHill == "Ground" then
                local args = {
                    [1] = _G.unit_id,
                    [2] = _G.L1
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                sentUnits["unit1"] = true
            end

            if _G.GroundOrHill == "Automatic" then
                local args = {
                    [1] = _G.unit_id,
                    [2] = _G.Ground1
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                wait(0.2)
                local args = {
                    [1] = _G.unit_id,
                    [2] = _G.Hill1
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                sentUnits["unit1"] = true
            end

            local plyname = game.Players.LocalPlayer.Character.Name
            SendMessage(url)
            local embed = {
                ["title"] = "||" .. plyname .. "|| < Press to view Username",
                ["description"] = "",
                ["color"] = color,
                ["fields"] = {
                    {
                        ["name"] = "🗂️ Unit 1 Placed",
                        ["value"] = "||".._G.unit_id.."||"
                    }
                },
                ["footer"] = {
                    ["text"] = getFormattedDateTime().."น."
                }
            }
            SendMessageEMBED(url, embed)
            sentUnits["unit1"] = true
        end
        -------------------------------------------------------------------------------------------------------
            if _G.limitunit >= 2 and wavenum == 3 and not sentUnits["unit2"] then
                if _G.GroundOrHill == "Hill" or _G.GroundOrHill == "Ground" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.L2
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                end
    
                if _G.GroundOrHill == "Automatic" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Ground2
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    wait(0.2)
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Hill2
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                end
            local plyname = game.Players.LocalPlayer.Character.Name
            SendMessage(url)
            local embed = {
                ["title"] = "||" .. plyname .. "|| <- Press to view Username",
                ["description"] = "",
                ["color"] = color,
                ["fields"] = {
                    {
                        ["name"] = "🗂️ Unit 2 Placed",
                        ["value"] = "||".._G.unit_id.."||"
                    }
                },
                ["footer"] = {
                    ["text"] = getFormattedDateTime().."น."
                }
            }
            SendMessageEMBED(url, embed)
                sentUnits["unit2"] = true
            end
        ------------------------------------------------------------------------------------------------
            if _G.limitunit >= 3 and wavenum == 4 and not sentUnits["unit3"] then
                if _G.GroundOrHill == "Hill" or _G.GroundOrHill == "Ground" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.L3
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                end
    
                if _G.GroundOrHill == "Automatic" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Ground3
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    wait(0.2)
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Hill3
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                end
                local plyname = game.Players.LocalPlayer.Character.Name
                SendMessage(url)
                local embed = {
                    ["title"] = "||" .. plyname .. "|| <-- Press to view Username",
                    ["description"] = "",
                    ["color"] = color,
                    ["fields"] = {
                        {
                            ["name"] = "🗂️ Unit 3 Placed",
                            ["value"] = "||".._G.unit_id.."||"
                        }
                    },
                    ["footer"] = {
                        ["text"] = getFormattedDateTime().."น."
                    }
                }
                SendMessageEMBED(url, embed)
                sentUnits["unit3"] = true
            end
        -----------------------------------------------------------------------------------------------------------
            if _G.limitunit >= 4 and wavenum == 5 and not sentUnits["unit4"] then
                if _G.GroundOrHill == "Hill" or _G.GroundOrHill == "Ground" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.L4
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                end
    
                if _G.GroundOrHill == "Automatic" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Ground4
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    wait(0.2)
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Hill4
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                end
                local plyname = game.Players.LocalPlayer.Character.Name
                SendMessage(url)
                local embed = {
                    ["title"] = "||" .. plyname .. "|| <--- Press to view Username",
                    ["description"] = "",
                    ["color"] = color,
                    ["fields"] = {
                        {
                            ["name"] = "🗂️ Unit 4 Placed",
                            ["value"] = "||".._G.unit_id.."||"
                        }
                    },
                    ["footer"] = {
                        ["text"] = getFormattedDateTime().."น."
                    }
                }
                SendMessageEMBED(url, embed)
                sentUnits["unit4"] = true
            end
        -------------------------------------------------------------------------------------
            if _G.limitunit >= 5 and wavenum == 6 and not sentUnits["unit5"] then
                if _G.GroundOrHill == "Hill" or _G.GroundOrHill == "Ground" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.L5
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    sentUnits["unit5"] = true
                end
    
                if _G.GroundOrHill == "Automatic" then
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Ground5
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    wait(0.2)
                    local args = {
                        [1] = _G.unit_id,
                        [2] = _G.Hill5
                    }
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    sentUnits["unit5"] = true
                end
                local plyname = game.Players.LocalPlayer.Character.Name
                SendMessage(url)
                local embed = {
                    ["title"] = "||" .. plyname .. "|| <---- Press to view Username",
                    ["description"] = "",
                    ["color"] = color,
                    ["fields"] = {
                        {
                            ["name"] = "🗂️ Unit 5 Placed",
                            ["value"] = "||".._G.unit_id.."||"
                        }
                    },
                    ["footer"] = {
                        ["text"] = getFormattedDateTime().."น."
                    }
                }
                SendMessageEMBED(url, embed)
                sentUnits["unit5"] = true
            end
            --------------------------------------------------------------------------------------
            if wavenum == 15 then
                _G.autounit = false
        end
    end
    end
end
