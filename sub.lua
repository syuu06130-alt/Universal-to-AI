--[[
    Universal Script Hub
    Features: Infinite Yield, VFly, FPS Boost, Speed Hack, Jump Power, and more
    UI Library: Rayfield
]]

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Variables
local VFlyEnabled = false
local VFlySpeed = 1
local FPSBoostEnabled = false
local SpeedHackEnabled = false
local SpeedValue = 16
local JumpPowerEnabled = false
local JumpValue = 50
local InfiniteJumpEnabled = false

-- VFly Variables
local VFlyConnection
local VFlyGyro
local VFlyBodyVelocity

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "Universal Script Hub",
    LoadingTitle = "Script Hub Loading...",
    LoadingSubtitle = "by Script Creator",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ScriptHub",
        FileName = "HubConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

-- Main Tab
local MainTab = Window:CreateTab("🏠 Main", 4483362458)

-- Infinite Yield Section
local IYSection = MainTab:CreateSection("Infinite Yield")

local IYButton = MainTab:CreateButton({
    Name = "Execute Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        Rayfield:Notify({
            Title = "Infinite Yield",
            Content = "Infinite Yield has been executed!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- VFly Section
local VFlySection = MainTab:CreateSection("VFly (Vehicle Fly)")

local VFlyToggle = MainTab:CreateToggle({
    Name = "Enable VFly",
    CurrentValue = false,
    Flag = "VFlyToggle",
    Callback = function(Value)
        VFlyEnabled = Value
        if Value then
            StartVFly()
        else
            StopVFly()
        end
    end
})

local VFlySpeedSlider = MainTab:CreateSlider({
    Name = "VFly Speed",
    Range = {0.1, 5},
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 1,
    Flag = "VFlySpeed",
    Callback = function(Value)
        VFlySpeed = Value
    end
})

-- Movement Tab
local MovementTab = Window:CreateTab("🏃 Movement", 4483362458)

-- Speed Hack Section
local SpeedSection = MovementTab:CreateSection("Speed Hack")

local SpeedToggle = MovementTab:CreateToggle({
    Name = "Enable Speed Hack",
    CurrentValue = false,
    Flag = "SpeedHack",
    Callback = function(Value)
        SpeedHackEnabled = Value
        if Value then
            Humanoid.WalkSpeed = SpeedValue
        else
            Humanoid.WalkSpeed = 16
        end
    end
})

local SpeedSlider = MovementTab:CreateSlider({
    Name = "Speed Value",
    Range = {16, 500},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 16,
    Flag = "SpeedValue",
    Callback = function(Value)
        SpeedValue = Value
        if SpeedHackEnabled then
            Humanoid.WalkSpeed = Value
        end
    end
})

-- Jump Power Section
local JumpSection = MovementTab:CreateSection("Jump Power")

local JumpToggle = MovementTab:CreateToggle({
    Name = "Enable Jump Boost",
    CurrentValue = false,
    Flag = "JumpBoost",
    Callback = function(Value)
        JumpPowerEnabled = Value
        if Value then
            Humanoid.JumpPower = JumpValue
            if Humanoid.UseJumpPower == false then
                Humanoid.JumpHeight = JumpValue / 5
            end
        else
            Humanoid.JumpPower = 50
            Humanoid.JumpHeight = 7.2
        end
    end
})

local JumpSlider = MovementTab:CreateSlider({
    Name = "Jump Power Value",
    Range = {50, 500},
    Increment = 5,
    Suffix = " Power",
    CurrentValue = 50,
    Flag = "JumpValue",
    Callback = function(Value)
        JumpValue = Value
        if JumpPowerEnabled then
            Humanoid.JumpPower = Value
            if Humanoid.UseJumpPower == false then
                Humanoid.JumpHeight = Value / 5
            end
        end
    end
})

local InfiniteJumpToggle = MovementTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        InfiniteJumpEnabled = Value
    end
})

-- Performance Tab
local PerformanceTab = Window:CreateTab("⚡ Performance", 4483362458)

local FPSSection = PerformanceTab:CreateSection("FPS Boost")

local FPSBoostToggle = PerformanceTab:CreateToggle({
    Name = "Enable FPS Boost",
    CurrentValue = false,
    Flag = "FPSBoost",
    Callback = function(Value)
        FPSBoostEnabled = Value
        if Value then
            ApplyFPSBoost()
        else
            RevertFPSBoost()
        end
    end
})

-- VFly Functions
function StartVFly()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return end
    
    -- Create BodyGyro
    VFlyGyro = Instance.new("BodyGyro")
    VFlyGyro.P = 9e4
    VFlyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    VFlyGyro.cframe = RootPart.CFrame
    VFlyGyro.Parent = RootPart
    
    -- Create BodyVelocity
    VFlyBodyVelocity = Instance.new("BodyVelocity")
    VFlyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
    VFlyBodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
    VFlyBodyVelocity.Parent = RootPart
    
    -- VFly Loop
    VFlyConnection = RunService.Heartbeat:Connect(function()
        if VFlyEnabled and RootPart then
            local Camera = workspace.CurrentCamera
            local MoveDirection = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                MoveDirection = MoveDirection + (Camera.CFrame.LookVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                MoveDirection = MoveDirection - (Camera.CFrame.LookVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                MoveDirection = MoveDirection - (Camera.CFrame.RightVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                MoveDirection = MoveDirection + (Camera.CFrame.RightVector)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
            end
            
            VFlyBodyVelocity.velocity = MoveDirection * (50 * VFlySpeed)
            VFlyGyro.cframe = Camera.CFrame
        end
    end)
    
    Rayfield:Notify({
        Title = "VFly",
        Content = "VFly enabled! Use WASD + Space/Shift to fly",
        Duration = 3,
        Image = 4483362458
    })
end

function StopVFly()
    if VFlyConnection then
        VFlyConnection:Disconnect()
        VFlyConnection = nil
    end
    if VFlyGyro then
        VFlyGyro:Destroy()
        VFlyGyro = nil
    end
    if VFlyBodyVelocity then
        VFlyBodyVelocity:Destroy()
        VFlyBodyVelocity = nil
    end
    
    Rayfield:Notify({
        Title = "VFly",
        Content = "VFly disabled!",
        Duration = 3,
        Image = 4483362458
    })
end

-- FPS Boost Functions
function ApplyFPSBoost()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        end
    end
    
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
    
    Rayfield:Notify({
        Title = "FPS Boost",
        Content = "FPS Boost applied!",
        Duration = 3,
        Image = 4483362458
    })
end

function RevertFPSBoost()
    Rayfield:Notify({
        Title = "FPS Boost",
        Content = "FPS Boost disabled! Rejoin to fully revert.",
        Duration = 3,
        Image = 4483362458
    })
end

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Character Reset Handler
LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
    Humanoid = NewCharacter:WaitForChild("Humanoid")
    RootPart = NewCharacter:WaitForChild("HumanoidRootPart")
    
    -- Reapply settings
    wait(1)
    if SpeedHackEnabled then
        Humanoid.WalkSpeed = SpeedValue
    end
    if JumpPowerEnabled then
        Humanoid.JumpPower = JumpValue
    end
end)

-- Notification
Rayfield:Notify({
    Title = "Script Hub Loaded",
    Content = "All features loaded successfully!",
    Duration = 5,
    Image = 4483362458
})

print("Universal Script Hub loaded successfully!")
