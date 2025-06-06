local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() local Window = l:CreateWindow({ Title = "", SubTitle = "", TabWidth = 0, Size = UDim2.fromOffset(0, 0), Acrylic = false, Theme = "Dark", }) l:Destroy()
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


local player = game:GetService("Players").LocalPlayer
local stamina = player:WaitForChild("PlayerStats"):WaitForChild("Stamina")


-- Variáveis valor


local stam = false


-- script


main:AddToggle("", {
    Title = "infinite stamina\n",
    Description = "inf stamina.\n",
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
