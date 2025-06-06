game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Lucas Hub",
    Text = "Script Loading",
    Duration = 2.5
})

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

loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/BlueLock/refs/heads/main/Lucas_hub.lua"))()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Lucas Hub",
    Text = "Script Loaded",
    Duration = 20
})
