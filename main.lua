-- Universal Script Hub with Rayfield UI
-- Features: VFly, Speed/Jump Hacks, FPS Boost, Tool System

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "Universal Hub | Infinity VFly",
    LoadingTitle = "Loading Universal Script Hub...",
    LoadingSubtitle = "by Infinity",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UniversalHub",
        FileName = "Configuration"
    },
    Discord = {
        Enabled = true,
        Invite = "invitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Universal Hub",
        Subtitle = "Key System",
        Note = "Join discord for key",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"KEY"}
    }
})

-- Main Tabs
local MainTab = Window:CreateTab("Main Features", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local VisualTab = Window:CreateTab("Visual", 4483362458)
local ToolTab = Window:CreateTab("Tools", 4483362458)

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- Local Player
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Fly Variables
local Flying = false
local FlySpeed = 50
local FlyKey = "F"
local BodyVelocity

-- Speed/Jump Variables
local SpeedEnabled = false
local JumpEnabled = false
local OriginalWalkSpeed = 16
local OriginalJumpPower = 50
local SpeedMultiplier = 2
local JumpMultiplier = 2

-- FPS Boost Variables
local FPSBoostEnabled = false
local OriginalGraphicsSettings = {}

-- Tool System
local ToolSystemEnabled = false
local JumpBoostTool

-- VFly Function
local function ToggleFly()
    if Flying then
        if BodyVelocity then
            BodyVelocity:Destroy()
            BodyVelocity = nil
        end
        Flying = false
        Humanoid.PlatformStand = false
    else
        BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        BodyVelocity.Parent = HumanoidRootPart
        
        Flying = true
        Humanoid.PlatformStand = true
        
        local FlyConnection
        FlyConnection = RunService.Heartbeat:Connect(function()
            if not Flying or not BodyVelocity or not Character or not HumanoidRootPart then
                FlyConnection:Disconnect()
                return
            end
            
            local Camera = Workspace.CurrentCamera
            local Direction = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                Direction = Direction + Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                Direction = Direction - Camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                Direction = Direction - Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                Direction = Direction + Camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                Direction = Direction + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                Direction = Direction - Vector3.new(0, 1, 0)
            end
            
            if Direction.Magnitude > 0 then
                Direction = Direction.Unit * FlySpeed
            end
            
            BodyVelocity.Velocity = Vector3.new(Direction.X, Direction.Y, Direction.Z)
        end)
    end
end

-- Keybind for Fly
UserInputService.InputBegan:Connect(function(Input, GameProcessed)
    if not GameProcessed and Input.KeyCode == Enum.KeyCode[FlyKey] then
        ToggleFly()
    end
end)

-- Fly Toggle Button
local FlyToggle = MainTab:CreateToggle({
    Name = "V-Fly (Press F)",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        if Value ~= Flying then
            ToggleFly()
        end
    end,
})

-- Fly Speed Slider
local FlySpeedSlider = MainTab:CreateSlider({
    Name = "Fly Speed",
    Range = {1, 200},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value)
        FlySpeed = Value
    end,
})

-- Speed Hack
local SpeedToggle = PlayerTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(Value)
        SpeedEnabled = Value
        if SpeedEnabled then
            OriginalWalkSpeed = Humanoid.WalkSpeed
            Humanoid.WalkSpeed = OriginalWalkSpeed * SpeedMultiplier
        else
            Humanoid.WalkSpeed = OriginalWalkSpeed
        end
    end,
})

-- Speed Multiplier
local SpeedMultiplierSlider = PlayerTab:CreateSlider({
    Name = "Speed Multiplier",
    Range = {1, 10},
    Increment = 0.5,
    CurrentValue = 2,
    Flag = "SpeedMultiplier",
    Callback = function(Value)
        SpeedMultiplier = Value
        if SpeedEnabled then
            Humanoid.WalkSpeed = OriginalWalkSpeed * SpeedMultiplier
        end
    end,
})

-- Jump Hack
local JumpToggle = PlayerTab:CreateToggle({
    Name = "Jump Hack",
    CurrentValue = false,
    Flag = "JumpToggle",
    Callback = function(Value)
        JumpEnabled = Value
        if JumpEnabled then
            OriginalJumpPower = Humanoid.JumpPower
            Humanoid.JumpPower = OriginalJumpPower * JumpMultiplier
        else
            Humanoid.JumpPower = OriginalJumpPower
        end
    end,
})

-- Jump Multiplier
local JumpMultiplierSlider = PlayerTab:CreateSlider({
    Name = "Jump Multiplier",
    Range = {1, 10},
    Increment = 0.5,
    CurrentValue = 2,
    Flag = "JumpMultiplier",
    Callback = function(Value)
        JumpMultiplier = Value
        if JumpEnabled then
            Humanoid.JumpPower = OriginalJumpPower * JumpMultiplier
        end
    end,
})

-- FPS Boost Function
local function ApplyFPSBoost()
    if FPSBoostEnabled then
        -- Save original settings
        OriginalGraphicsSettings.GraphicsQualityLevel = settings().Rendering.QualityLevel
        OriginalGraphicsSettings.ShadowMap = Lighting.GlobalShadows
        OriginalGraphicsSettings.ShadowQuality = Lighting.ShadowQuality
        
        -- Apply FPS Boost settings
        settings().Rendering.QualityLevel = 1
        Lighting.GlobalShadows = false
        Lighting.ShadowQuality = Enum.ShadowQuality.Disabled
        
        -- Reduce particles
        for _, particle in pairs(Workspace:GetDescendants()) do
            if particle:IsA("ParticleEmitter") or particle:IsA("Trail") then
                particle.Enabled = false
            end
        end
    else
        -- Restore original settings
        settings().Rendering.QualityLevel = OriginalGraphicsSettings.GraphicsQualityLevel or 10
        Lighting.GlobalShadows = OriginalGraphicsSettings.ShadowMap or true
        Lighting.ShadowQuality = OriginalGraphicsSettings.ShadowQuality or Enum.ShadowQuality.High
    end
end

-- FPS Boost Toggle
local FPSBoostToggle = VisualTab:CreateToggle({
    Name = "FPS Boost",
    CurrentValue = false,
    Flag = "FPSBoostToggle",
    Callback = function(Value)
        FPSBoostEnabled = Value
        ApplyFPSBoost()
    end,
})

-- Additional Visual Settings
local NoFogToggle = VisualTab:CreateToggle({
    Name = "Remove Fog",
    CurrentValue = false,
    Flag = "NoFogToggle",
    Callback = function(Value)
        if Value then
            Lighting.FogEnd = 1000000
            Lighting.FogStart = 999999
        else
            Lighting.FogEnd = OriginalGraphicsSettings.FogEnd or 100000
            Lighting.FogStart = OriginalGraphicsSettings.FogStart or 0
        end
    end,
})

local FullBrightToggle = VisualTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = function(Value)
        if Value then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            Lighting.Ambient = OriginalGraphicsSettings.Ambient or Color3.new(0.5, 0.5, 0.5)
            Lighting.Brightness = OriginalGraphicsSettings.Brightness or 1
            Lighting.OutdoorAmbient = OriginalGraphicsSettings.OutdoorAmbient or Color3.new(0.5, 0.5, 0.5)
        end
    end,
})

-- Jump Boost Tool System
local function CreateJumpBoostTool()
    if JumpBoostTool and JumpBoostTool.Parent then
        JumpBoostTool:Destroy()
    end
    
    JumpBoostTool = Instance.new("Tool")
    JumpBoostTool.Name = "Jump Booster"
    JumpBoostTool.CanBeDropped = false
    
    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(1, 1, 1)
    Handle.Parent = JumpBoostTool
    Handle.Transparency = 1
    
    -- Tool activation
    JumpBoostTool.Activated:Connect(function()
        if Character and Humanoid then
            local currentVelocity = HumanoidRootPart.Velocity
            HumanoidRootPart.Velocity = Vector3.new(currentVelocity.X, 150, currentVelocity.Z)
        end
    end)
    
    JumpBoostTool.Parent = LocalPlayer.Backpack
end

-- Tool System Toggle
local ToolSystemToggle = ToolTab:CreateToggle({
    Name = "Jump Boost Tool",
    CurrentValue = false,
    Flag = "ToolSystemToggle",
    Callback = function(Value)
        ToolSystemEnabled = Value
        if ToolSystemEnabled then
            CreateJumpBoostTool()
        elseif JumpBoostTool then
            JumpBoostTool:Destroy()
        end
    end,
})

-- Tool Power Slider
local ToolPowerSlider = ToolTab:CreateSlider({
    Name = "Tool Jump Power",
    Range = {50, 500},
    Increment = 10,
    Suffix = "power",
    CurrentValue = 150,
    Flag = "ToolPower",
    Callback = function(Value)
        if JumpBoostTool then
            JumpBoostTool.Activated:Connect(function()
                if Character and Humanoid then
                    local currentVelocity = HumanoidRootPart.Velocity
                    HumanoidRootPart.Velocity = Vector3.new(currentVelocity.X, Value, currentVelocity.Z)
                end
            end)
        end
    end,
})

-- Character Added Handler
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
    HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    
    -- Re-apply settings
    if SpeedEnabled then
        Humanoid.WalkSpeed = OriginalWalkSpeed * SpeedMultiplier
    end
    if JumpEnabled then
        Humanoid.JumpPower = OriginalJumpPower * JumpMultiplier
    end
    if Flying then
        ToggleFly() -- Turn off and on again
        task.wait(0.5)
        ToggleFly()
    end
    if ToolSystemEnabled then
        task.wait(1)
        CreateJumpBoostTool()
    end
end)

-- Anti-AFK
local VirtualInputManager = game:GetService("VirtualInputManager")
local AFKConnection
local function SetupAntiAFK()
    if AFKConnection then
        AFKConnection:Disconnect()
    end
    
    AFKConnection = RunService.Heartbeat:Connect(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        task.wait(1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    end)
end

-- Anti-AFK Toggle
local AntiAFKToggle = MainTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "AntiAFKToggle",
    Callback = function(Value)
        if Value then
            SetupAntiAFK()
        elseif AFKConnection then
            AFKConnection:Disconnect()
        end
    end,
})

-- Noclip Feature
local NoclipEnabled = false
local NoclipConnection

local function NoclipLoop()
    if Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end

local NoclipToggle = PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        NoclipEnabled = Value
        if NoclipEnabled then
            NoclipConnection = RunService.Stepped:Connect(NoclipLoop)
        elseif NoclipConnection then
            NoclipConnection:Disconnect()
        end
    end,
})

-- ESP Feature (Simple)
local ESPEnabled = false
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESP_Objects"
ESPFolder.Parent = Workspace

local function CreateESP(player)
    if player == LocalPlayer then return end
    
    local character = player.Character
    if not character then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = player.Name .. "_ESP"
    highlight.Adornee = character
    highlight.Parent = ESPFolder
    highlight.FillColor = Color3.new(1, 0, 0)
    highlight.OutlineColor = Color3.new(1, 1, 0)
    highlight.FillTransparency = 0.5
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end

local ESPToggle = VisualTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        ESPEnabled = Value
        if ESPEnabled then
            ESPFolder:ClearAllChildren()
            for _, player in pairs(Players:GetPlayers()) do
                CreateESP(player)
            end
            Players.PlayerAdded:Connect(CreateESP)
        else
            ESPFolder:ClearAllChildren()
        end
    end,
})

-- Initialize ESP for existing players
for _, player in pairs(Players:GetPlayers()) do
    CreateESP(player)
end

-- Notification when script loads
Rayfield:Notify({
    Title = "Universal Script Hub Loaded",
    Content = "V-Fly, Speed/Jump Hacks, FPS Boost & Tools Enabled!",
    Duration = 6.5,
    Image = 4483362458,
})

-- Destroy UI Button
local DestroyButton = MainTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})
