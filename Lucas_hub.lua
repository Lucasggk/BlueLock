loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/BlueLock/refs/heads/main/Fix.name.ui.lua"))()

local v = {version = "Test /No dex/", alpha = true}
v.alpha = (v.alpha and "Alpha version") or "Release version" -- explicação do and: se a variável antes dele ex. (oi = true) local oi = oi and "x" or "z". se o oi for true ele aceita o primeiro valor caso contrário ele aceita o segundo valor
local vful = v.version .. " - " .. v.alpha
for i = 1, 10 do
    print("MADE BY LUCAS\nScript Version " .. vful)
end

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("BlueLockRiv")

local Window = Fluent:CreateWindow({
    Title = "Blue lock |",
    SubTitle = "Made by Lucas | Version: ".. vful,
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true,
})

Window:Dialog({
    Title = "MADE BY LUCAS :)",
    Buttons = {
        {
            Title = "Confirm",
            Callback = function()
                print("Confirmed the dialog.")
            end
        }
    }
})

local main = Window:AddTab({ 
    Title = "main",
    Icon = "home"
})

local misc = Window:AddTab({ 
    Title = "misc",
    Icon = "list"
})

local config = Window:AddTab({ 
    Title = "configurações",
    Icon = "settings"
})

InterfaceManager:BuildInterfaceSection(config)

config:AddButton({Title = "Delete ui", Callback = function() Fluent:Destroy() end })
config:AddButton({Title = "Rejoin", Description = "Reentra neste mesmo server", Callback = function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer) end })

local rs = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer
local stamina = player:WaitForChild("PlayerStats"):WaitForChild("Stamina")
local jointeam = rs.Packages.Knit.Services.TeamService.RE.Select
local bola = workspace:WaitForChild("Football"):WaitForChild("Hitbox")

local stam = false
local teams = {"Home", "Away"}
local positeams = {"CF", "LW", "RW", "CM", "GK"}
local team = "Home"
local positeam = "CF"
local jt = false

local section = main:AddSection("Boosts")

main:AddToggle("", {
    Title = "infinite stamina",
    Description = "inf stamina.",
    Default = false,
    Callback = function(Val)
        stam = Val
        if stam then
            task.spawn(function()
                while stam do
                    if stamina.Value ~= 100 then
                        stamina.Value = 100
                    end
                    task.wait(0.05)
                end
            end)
        end
    end
})

local section = main:AddSection("Auto join team")

main:AddToggle("", {
    Title = "Auto join team",
    Description = "Ativa/Desativa",
    Default = false,
    Callback = function(Val)
        jt = Val
    end
})

local Dropteam = main:AddDropdown("Dropdown", {
    Title = "Team\n",
    Description = "Escolha o time para entrar!\n",
    Values = teams,
    Multi = false,
    Default = team,
})

Dropteam:OnChanged(function(Value)
    team = Value
    print(team)
end)

local Dropposi = main:AddDropdown("Dropdown", {
    Title = "Posição\n",
    Description = "Escolha a posição para entrar!\n",
    Values = positeams,
    Multi = false,
    Default = positeam,
})

Dropposi:OnChanged(function(Value)
    positeam = Value
    print(positeam)
end)

local section = main:AddSection("Hitbox")

local Slider = main:AddSlider("", {
    Title = "HitBox (Bola)",
    Description = "Aumenta a hitbox da bola",
    Default = 3.5,
    Min = 3.5,
    Max = 15,
    Rounding = 1,
    Callback = function(Value)
        bola.Size = Vector3.new(Value, Value, Value)
        print(bola.Size)
    end
})

local posAlvo = Vector3.new(-1.6687114238739014, -321.43353271484375, 3.4761135578155518)
local maxDist = 50
local lastJoinAttempt = 0
local joinCooldown = 1 -- 1 segundo entre tentativas

task.spawn(function()
    while true do
        if jt then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local distancia = (hrp.Position - posAlvo).Magnitude
                local now = os.clock()
                if distancia <= maxDist and (now - lastJoinAttempt) >= joinCooldown then
                    lastJoinAttempt = now
                    jointeam:FireServer(team, positeam)
                end
            end
        end
        task.wait(0.5)
    end
end)
