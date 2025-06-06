local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()
local Window = l:CreateWindow({
    Title = "",
    SubTitle = "",
    TabWidth = 0,
    Size = UDim2.fromOffset(0, 0),
    Acrylic = false,
    Theme = "Dark",
})
l:Destroy()

task.wait(0.05)



local v = {version = "Test V0.01", alpha = true}
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
    Content = "Script Free para sempre\n qualquer bug report em:\n",
    Buttons = {
        {
            Title = "Confirm",
            Callback = function()
                print("Confirmed the dialog.")
            end
        }
    }
})

-- tabs

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

-- Variáveis do player

local rs = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer
local stamina = player:WaitForChild("PlayerStats"):WaitForChild("Stamina")
local jointeam = rs.Packages.Knit.Services.TeamService.RE.Select


-- Variáveis valor


local stam = false
local teams = {"Home", "Away"}
local positeams = {"CF", "LW", "RW", "CM", "GK"}
local team = "Home"
local positeam = "CF"
local jt = false

-- script

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
                    task.wait()
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
    Title = "Team\n",
    Description = "Escolha o time para entrar!\n",
    Values = positeams,
    Multi = false,
    Default = positeam,
})
Dropposi:OnChanged(function(Value)
    positeam = Value
    print(positeam)
end)








-- repetições 
--[[

task.spawn(function()
        while true do 
            if jt then
                if tempo == 0 then 
                    -- script 
                end
            end
            task.wait()
        end
    end)
]] 
