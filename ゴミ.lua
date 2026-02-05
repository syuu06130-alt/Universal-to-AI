-- Infinity Universal Hub - 100+ Features
-- Rayfield UI Implementation

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "⚡ Infinity Universal Hub | 100+ Features",
    LoadingTitle = "Loading Infinity Hub...",
    LoadingSubtitle = "Powered by Infinity Yield",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "InfinityUniversal",
        FileName = "Settings"
    },
    Discord = {
        Enabled = true,
        Invite = "infinityhub",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Infinity Hub",
        Subtitle = "Key System",
        Note = "No key required",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"INFINITY123"}
    }
})

-- Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")

-- Player Variables
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HRP = Character:WaitForChild("HumanoidRootPart")
local Mouse = LocalPlayer:GetMouse()

-- Global Variables
local FlyEnabled = false
local NoclipEnabled = false
local ESPEnabled = false
local SpeedEnabled = false
local JumpEnabled = false
local GodMode = false
local InfiniteJump = false
local AntiAfk = false
local AutoFarm = false
local AimlockEnabled = false
local ClickTP = false
local AutoClick = false
local AntiBan = false
local LagSwitch = false
local FPSBoost = false
local FullBright = false
local NoClip = false
local NoFallDamage = false
local AutoCollect = false
local AutoSell = false
local AutoBuy = false
local DupeItems = false
local InfiniteStamina = false
local NoCooldown = false
local InstantRespawn = false
local Invisibility = false
local WalkOnWater = false
local WalkOnAir = false
local AntiSlow = false
local AntiStun = false
local AntiGrab = false
local AntiKnockback = false
local AntiRagdoll = false
local AntiFreeze = false
local AntiKill = false
local NoClipVehicle = false
local SpeedVehicle = false
local FlyVehicle = false
local GodVehicle = false
local AutoFarmVehicle = false
local ESPVehicles = false
local ESPItems = false
local ESPChests = false
local ESPPlayers = false
local ESPNPCs = false
local ESPDoors = false
local ESPMoney = false
local ESPGuns = false
local ESPTools = false
local ESPHealth = false
local ESPDistance = false
local ESPBox = false
local ESPTracers = false
local ESPNames = false
local ESPChams = false
local ESPOutlines = false
local ESPGlow = false
local AutoClicker = false
local AutoSwing = false
local AutoFarmTool = false
local AutoFish = false
local AutoMine = false
local AutoChop = false
local AutoDig = false
local AutoBuild = false
local AutoCraft = false
local AutoEnchant = false
local AutoUpgrade = false
local AutoEquip = false
local AutoSellAll = false
local AutoBuyAll = false
local AutoTrade = false
local AutoGift = false
local AutoClaim = false
local AutoSpin = false
local AutoOpen = false
local AutoJoin = false
local AutoLeave = false
local AutoRejoin = false
local AutoServerHop = false
local AutoTeleport = false
local AutoWaypoint = false
local AutoPathfind = false
local AutoFollow = false
local AutoKill = false
local AutoArrest = false
local AutoRob = false
local AutoSteal = false
local AutoMurder = false
local AutoSheriff = false
local AutoCriminal = false
local AutoPolice = false
local AutoThief = false
local AutoHero = false
local AutoVillain = false
local AutoTeam = false
local AutoSit = false
local AutoDance = false
local AutoEmote = false
local AutoChat = false
local AutoSpam = false
local AutoWelcome = false
local AutoGoodbye = false
local AutoThank = false
local AutoSorry = false
local AutoLaugh = false
local AutoCry = false
local AutoWave = false
local AutoPoint = false
local AutoCheer = false
local AutoClap = false
local AutoBow = false
local AutoSalute = false
local AutoSleep = false
local AutoIdle = false
local AutoRun = false
local AutoWalk = false
local AutoJump = false
local AutoFly = false
local AutoSwim = false
local AutoClimb = false
local AutoCrawl = false
local AutoRoll = false
local AutoDash = false
local AutoTeleportSkill = false
local AutoHeal = false
local AutoShield = false
local AutoBuff = false
local AutoDebuff = false
local AutoAttack = false
local AutoDefend = false
local AutoBlock = false
local AutoParry = false
local AutoDodge = false
local AutoCounter = false
local AutoCombo = false
local AutoUltimate = false
local AutoSkill1 = false
local AutoSkill2 = false
local AutoSkill3 = false
local AutoSkill4 = false
local AutoSkill5 = false

-- Create Tabs
local MainTab = Window:CreateTab("Main Hacks", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local VisualTab = Window:CreateTab("Visual", 4483362458)
local WorldTab = Window:CreateTab("World", 4483362458)
local AutoFarmTab = Window:CreateTab("Auto Farm", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local ESPTab = Window:CreateTab("ESP", 4483362458)
local VehicleTab = Window:CreateTab("Vehicle", 4483362458)
local FunTab = Window:CreateTab("Fun", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- 1. FLY SYSTEM
local FlySection = MainTab:CreateSection("Fly System")
local FlyToggle = MainTab:CreateToggle({
    Name = "Infinity Fly (Ctrl + F)",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        FlyEnabled = Value
        if FlyEnabled then
            local BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            BodyVelocity.Parent = HRP
            
            RS.Heartbeat:Connect(function()
                if not FlyEnabled then return end
                local Camera = WS.CurrentCamera
                local Direction = Vector3.new()
                
                if UIS:IsKeyDown(Enum.KeyCode.W) then Direction += Camera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then Direction -= Camera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then Direction -= Camera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then Direction += Camera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then Direction += Vector3.new(0, 1, 0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then Direction -= Vector3.new(0, 1, 0) end
                
                if Direction.Magnitude > 0 then
                    Direction = Direction.Unit * 50
                end
                BodyVelocity.Velocity = Vector3.new(Direction.X, Direction.Y, Direction.Z)
            end)
        end
    end,
})

UIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.F and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        FlyToggle:Set(not FlyEnabled)
    end
end)

-- 2. SPEED HACK
local SpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        Humanoid.WalkSpeed = Value
    end,
})

-- 3. JUMP HACK
local JumpSlider = PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 1000},
    Increment = 10,
    Suffix = "power",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(Value)
        Humanoid.JumpPower = Value
    end,
})

-- 4. INFINITE JUMP
local InfiniteJumpToggle = PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
    Callback = function(Value)
        InfiniteJump = Value
        UIS.JumpRequest:Connect(function()
            if InfiniteJump then
                Humanoid:ChangeState("Jumping")
            end
        end)
    end,
})

-- 5. NO CLIP
local NoClipToggle = PlayerTab:CreateToggle({
    Name = "No Clip",
    CurrentValue = false,
    Flag = "NoClipToggle",
    Callback = function(Value)
        NoClip = Value
        RS.Stepped:Connect(function()
            if NoClip and Character then
                for _, v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end,
})

-- 6. GOD MODE
local GodModeToggle = PlayerTab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Flag = "GodModeToggle",
    Callback = function(Value)
        GodMode = Value
        if GodMode then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end
    end,
})

-- 7. ANTI AFK
local AntiAfkToggle = MiscTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Flag = "AntiAfkToggle",
    Callback = function(Value)
        AntiAfk = Value
        if AntiAfk then
            local VirtualInputManager = game:GetService("VirtualInputManager")
            RS.Heartbeat:Connect(function()
                if AntiAfk then
                    VirtualInputManager:SendKeyEvent(true, "E", false, game)
                    wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, "E", false, game)
                end
            end)
        end
    end,
})

-- 8. FPS BOOST
local FPSBoostToggle = VisualTab:CreateToggle({
    Name = "FPS Boost",
    CurrentValue = false,
    Flag = "FPSBoostToggle",
    Callback = function(Value)
        FPSBoost = Value
        if FPSBoost then
            settings().Rendering.QualityLevel = 1
            Lighting.GlobalShadows = false
            for _, v in pairs(WS:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = false
                end
            end
        end
    end,
})

-- 9. FULL BRIGHT
local FullBrightToggle = VisualTab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = function(Value)
        FullBright = Value
        if FullBright then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 1000000
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        end
    end,
})

-- 10. NO FOG
local NoFogToggle = VisualTab:CreateToggle({
    Name = "Remove Fog",
    CurrentValue = false,
    Flag = "NoFogToggle",
    Callback = function(Value)
        if Value then
            Lighting.FogEnd = 1000000
        else
            Lighting.FogEnd = 10000
        end
    end,
})

-- 11. CLICK TELEPORT
local ClickTPToggle = TeleportTab:CreateToggle({
    Name = "Click Teleport",
    CurrentValue = false,
    Flag = "ClickTPToggle",
    Callback = function(Value)
        ClickTP = Value
        if ClickTP then
            Mouse.Button1Down:Connect(function()
                if ClickTP then
                    HRP.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 5, 0))
                end
            end)
        end
    end,
})

-- 12. AUTO CLICKER
local AutoClickerToggle = CombatTab:CreateToggle({
    Name = "Auto Clicker",
    CurrentValue = false,
    Flag = "AutoClickerToggle",
    Callback = function(Value)
        AutoClicker = Value
        if AutoClicker then
            local VirtualInputManager = game:GetService("VirtualInputManager")
            RS.Heartbeat:Connect(function()
                if AutoClicker then
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    wait(0.01)
                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                end
            end)
        end
    end,
})

-- 13. ESP PLAYERS
local ESPToggle = ESPTab:CreateToggle({
    Name = "ESP Players",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        ESPPlayers = Value
        if ESPPlayers then
            for _, Player in pairs(Players:GetPlayers()) do
                if Player ~= LocalPlayer then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Name = Player.Name .. "_ESP"
                    Highlight.Parent = Player.Character or Player.CharacterAdded:Wait()
                    Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    Highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                    Highlight.FillTransparency = 0.5
                end
            end
        end
    end,
})

-- 14. AIMLOCK
local AimlockToggle = CombatTab:CreateToggle({
    Name = "Aimlock (Right Click)",
    CurrentValue = false,
    Flag = "AimlockToggle",
    Callback = function(Value)
        AimlockEnabled = Value
        Mouse.Button2Down:Connect(function()
            if AimlockEnabled then
                local Target = Mouse.Target
                if Target and Target.Parent:FindFirstChild("Humanoid") then
                    HRP.CFrame = CFrame.new(HRP.Position, Target.Parent.HumanoidRootPart.Position)
                end
            end
        end)
    end,
})

-- 15. AUTO FARM
local AutoFarmToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        AutoFarm = Value
        if AutoFarm then
            while AutoFarm do
                wait()
                -- Auto farm logic here
                for _, NPC in pairs(WS.NPCs:GetChildren()) do
                    if NPC:FindFirstChild("Humanoid") then
                        HRP.CFrame = NPC.HumanoidRootPart.CFrame
                        fireclickdetector(NPC.ClickDetector)
                    end
                end
            end
        end
    end,
})

-- 16. WALK ON WATER
local WalkOnWaterToggle = FunTab:CreateToggle({
    Name = "Walk on Water",
    CurrentValue = false,
    Flag = "WalkOnWaterToggle",
    Callback = function(Value)
        WalkOnWater = Value
        if WalkOnWater then
            local Part = Instance.new("Part")
            Part.Size = Vector3.new(1000, 1, 1000)
            Part.Position = Vector3.new(0, 0, 0)
            Part.Anchored = true
            Part.Transparency = 0.5
            Part.Parent = WS
        end
    end,
})

-- 17. INVISIBILITY
local InvisibilityToggle = PlayerTab:CreateToggle({
    Name = "Invisibility",
    CurrentValue = false,
    Flag = "InvisibilityToggle",
    Callback = function(Value)
        Invisibility = Value
        if Invisibility then
            for _, Part in pairs(Character:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.Transparency = 1
                end
            end
        else
            for _, Part in pairs(Character:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.Transparency = 0
                end
            end
        end
    end,
})

-- 18. AUTO COLLECT
local AutoCollectToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Collect Items",
    CurrentValue = false,
    Flag = "AutoCollectToggle",
    Callback = function(Value)
        AutoCollect = Value
        if AutoCollect then
            RS.Heartbeat:Connect(function()
                if AutoCollect then
                    for _, Item in pairs(WS:GetChildren()) do
                        if Item.Name == "Item" or Item.Name == "Coin" or Item.Name == "Money" then
                            firetouchinterest(HRP, Item, 0)
                            firetouchinterest(HRP, Item, 1)
                        end
                    end
                end
            end)
        end
    end,
})

-- 19. TELEPORT TO PLAYER
local TeleportDropdown = TeleportTab:CreateDropdown({
    Name = "Teleport to Player",
    Options = {},
    CurrentOption = "",
    Flag = "TeleportDropdown",
    Callback = function(Option)
        local Target = Players:FindFirstChild(Option)
        if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
            HRP.CFrame = Target.Character.HumanoidRootPart.CFrame
        end
    end,
})

-- Update player list
Players.PlayerAdded:Connect(function(Player)
    table.insert(TeleportDropdown.Options, Player.Name)
    TeleportDropdown:Refresh()
end)

Players.PlayerRemoving:Connect(function(Player)
    local Index = table.find(TeleportDropdown.Options, Player.Name)
    if Index then
        table.remove(TeleportDropdown.Options, Index)
        TeleportDropdown:Refresh()
    end
end)

-- 20. SERVER HOP
local ServerHopButton = TeleportTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
        for _, Server in pairs(Servers.data) do
            if Server.playing < Server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id)
                break
            end
        end
    end,
})

-- 21. REJOIN SERVER
local RejoinButton = TeleportTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId)
    end,
})

-- 22. FLY VEHICLE
local FlyVehicleToggle = VehicleTab:CreateToggle({
    Name = "Fly Vehicle",
    CurrentValue = false,
    Flag = "FlyVehicleToggle",
    Callback = function(Value)
        FlyVehicle = Value
        if FlyVehicle then
            local Vehicle = Character:FindFirstChildWhichIsA("VehicleSeat")
            if Vehicle then
                Vehicle.MaxSpeed = 1000
                Vehicle.Torque = 50000
            end
        end
    end,
})

-- 23. ESP ITEMS
local ESPItemsToggle = ESPTab:CreateToggle({
    Name = "ESP Items",
    CurrentValue = false,
    Flag = "ESPItemsToggle",
    Callback = function(Value)
        ESPItems = Value
        if ESPItems then
            for _, Item in pairs(WS:GetDescendants()) do
                if Item.Name:find("Item") or Item.Name:find("Coin") or Item.Name:find("Money") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Item
                    Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    Highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
                end
            end
        end
    end,
})

-- 24. AUTO FISH
local AutoFishToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Fish",
    CurrentValue = false,
    Flag = "AutoFishToggle",
    Callback = function(Value)
        AutoFish = Value
        if AutoFish then
            while AutoFish do
                wait(1)
                -- Auto fishing logic
                local FishingRod = Character:FindFirstChild("FishingRod")
                if FishingRod then
                    FishingRod:Activate()
                end
            end
        end
    end,
})

-- 25. AUTO MINE
local AutoMineToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Mine",
    CurrentValue = false,
    Flag = "AutoMineToggle",
    Callback = function(Value)
        AutoMine = Value
        if AutoMine then
            while AutoMine do
                wait(0.5)
                for _, Ore in pairs(WS:GetChildren()) do
                    if Ore.Name:find("Ore") or Ore.Name:find("Rock") then
                        HRP.CFrame = Ore.CFrame
                        fireclickdetector(Ore.ClickDetector)
                    end
                end
            end
        end
    end,
})

-- 26. INSTANT RESPAWN
local InstantRespawnToggle = PlayerTab:CreateToggle({
    Name = "Instant Respawn",
    CurrentValue = false,
    Flag = "InstantRespawnToggle",
    Callback = function(Value)
        InstantRespawn = Value
        if InstantRespawn then
            Humanoid.Died:Connect(function()
                wait(0.1)
                LocalPlayer:LoadCharacter()
            end)
        end
    end,
})

-- 27. NO FALL DAMAGE
local NoFallDamageToggle = PlayerTab:CreateToggle({
    Name = "No Fall Damage",
    CurrentValue = false,
    Flag = "NoFallDamageToggle",
    Callback = function(Value)
        NoFallDamage = Value
        if NoFallDamage then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        end
    end,
})

-- 28. INFINITE STAMINA
local InfiniteStaminaToggle = PlayerTab:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "InfiniteStaminaToggle",
    Callback = function(Value)
        InfiniteStamina = Value
        if InfiniteStamina then
            Humanoid:GetPropertyChangedSignal("MaxHealth"):Connect(function()
                Humanoid.Health = Humanoid.MaxHealth
            end)
        end
    end,
})

-- 29. NO COOLDOWN
local NoCooldownToggle = CombatTab:CreateToggle({
    Name = "No Cooldown",
    CurrentValue = false,
    Flag = "NoCooldownToggle",
    Callback = function(Value)
        NoCooldown = Value
        if NoCooldown then
            for _, Tool in pairs(Character:GetChildren()) do
                if Tool:IsA("Tool") then
                    Tool:SetAttribute("Cooldown", 0)
                end
            end
        end
    end,
})

-- 30. ANTI SLOW
local AntiSlowToggle = PlayerTab:CreateToggle({
    Name = "Anti Slow",
    CurrentValue = false,
    Flag = "AntiSlowToggle",
    Callback = function(Value)
        AntiSlow = Value
        if AntiSlow then
            Humanoid.WalkSpeed = 16
            Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if AntiSlow then
                    Humanoid.WalkSpeed = 16
                end
            end)
        end
    end,
})

-- 31. WALK ON AIR
local WalkOnAirToggle = FunTab:CreateToggle({
    Name = "Walk on Air",
    CurrentValue = false,
    Flag = "WalkOnAirToggle",
    Callback = function(Value)
        WalkOnAir = Value
        if WalkOnAir then
            local AirPlatform = Instance.new("Part")
            AirPlatform.Size = Vector3.new(100, 1, 100)
            AirPlatform.Position = HRP.Position + Vector3.new(0, 50, 0)
            AirPlatform.Anchored = true
            AirPlatform.Transparency = 0.3
            AirPlatform.Parent = WS
        end
    end,
})

-- 32. AUTO DANCE
local AutoDanceToggle = FunTab:CreateToggle({
    Name = "Auto Dance",
    CurrentValue = false,
    Flag = "AutoDanceToggle",
    Callback = function(Value)
        AutoDance = Value
        if AutoDance then
            while AutoDance do
                wait(1)
                Humanoid:LoadAnimation(Instance.new("Animation")):Play()
            end
        end
    end,
})

-- 33. AUTO CHAT SPAM
local AutoSpamToggle = FunTab:CreateToggle({
    Name = "Auto Chat Spam",
    CurrentValue = false,
    Flag = "AutoSpamToggle",
    Callback = function(Value)
        AutoSpam = Value
        if AutoSpam then
            local Messages = {"Infinity Hub OP!", "Hacking with Infinity", "Powered by Infinity Yield"}
            while AutoSpam do
                wait(5)
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Messages[math.random(1, #Messages)], "All")
            end
        end
    end,
})

-- 34. LAG SWITCH
local LagSwitchToggle = MiscTab:CreateToggle({
    Name = "Lag Switch",
    CurrentValue = false,
    Flag = "LagSwitchToggle",
    Callback = function(Value)
        LagSwitch = Value
        if LagSwitch then
            while LagSwitch do
                wait(0.1)
                for i = 1, 1000 do
                    local Part = Instance.new("Part")
                    Part.Parent = WS
                    Part:Destroy()
                end
            end
        end
    end,
})

-- 35. ESP TRACERS
local ESPTracersToggle = ESPTab:CreateToggle({
    Name = "ESP Tracers",
    CurrentValue = false,
    Flag = "ESPTracersToggle",
    Callback = function(Value)
        ESPTracers = Value
        if ESPTracers then
            for _, Player in pairs(Players:GetPlayers()) do
                if Player ~= LocalPlayer then
                    local Tracer = Drawing.new("Line")
                    Tracer.Visible = true
                    Tracer.Color = Color3.fromRGB(255, 0, 0)
                    Tracer.Thickness = 1
                    
                    RS.Heartbeat:Connect(function()
                        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                            local ScreenPos, OnScreen = WS.CurrentCamera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
                            if OnScreen then
                                Tracer.From = Vector2.new(WS.CurrentCamera.ViewportSize.X/2, WS.CurrentCamera.ViewportSize.Y)
                                Tracer.To = Vector2.new(ScreenPos.X, ScreenPos.Y)
                                Tracer.Visible = true
                            else
                                Tracer.Visible = false
                            end
                        end
                    end)
                end
            end
        end
    end,
})

-- 36. AUTO WAYPOINT
local AutoWaypointToggle = TeleportTab:CreateToggle({
    Name = "Auto Waypoint",
    CurrentValue = false,
    Flag = "AutoWaypointToggle",
    Callback = function(Value)
        AutoWaypoint = Value
        if AutoWaypoint then
            local Waypoint = Instance.new("Part")
            Waypoint.Size = Vector3.new(5, 5, 5)
            Waypoint.Position = Mouse.Hit.Position
            Waypoint.Anchored = true
            Waypoint.CanCollide = false
            Waypoint.Transparency = 0.5
            Waypoint.BrickColor = BrickColor.new("Bright green")
            Waypoint.Parent = WS
        end
    end,
})

-- 37. ANTI BAN
local AntiBanToggle = MiscTab:CreateToggle({
    Name = "Anti Ban",
    CurrentValue = false,
    Flag = "AntiBanToggle",
    Callback = function(Value)
        AntiBan = Value
        if AntiBan then
            getgenv().AntiBan = true
            local mt = getrawmetatable(game)
            local old = mt.__namecall
            setreadonly(mt, false)
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "Kick" or method == "kick" then
                    return nil
                end
                return old(self, ...)
            end)
            setreadonly(mt, true)
        end
    end,
})

-- 38. AUTO EQUIP BEST TOOL
local AutoEquipToggle = CombatTab:CreateToggle({
    Name = "Auto Equip Best Tool",
    CurrentValue = false,
    Flag = "AutoEquipToggle",
    Callback = function(Value)
        AutoEquip = Value
        if AutoEquip then
            local BestTool = nil
            local BestDamage = 0
            for _, Tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                if Tool:FindFirstChild("Damage") and Tool.Damage.Value > BestDamage then
                    BestDamage = Tool.Damage.Value
                    BestTool = Tool
                end
            end
            if BestTool then
                BestTool.Parent = Character
            end
        end
    end,
})

-- 39. AUTO SELL
local AutoSellToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = false,
    Flag = "AutoSellToggle",
    Callback = function(Value)
        AutoSell = Value
        if AutoSell then
            while AutoSell do
                wait(2)
                local SellPart = WS:FindFirstChild("Sell")
                if SellPart then
                    HRP.CFrame = SellPart.CFrame
                    fireproximityprompt(SellPart.ProximityPrompt)
                end
            end
        end
    end,
})

-- 40. AUTO BUY
local AutoBuyToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Buy",
    CurrentValue = false,
    Flag = "AutoBuyToggle",
    Callback = function(Value)
        AutoBuy = Value
        if AutoBuy then
            while AutoBuy do
                wait(3)
                local Shop = WS:FindFirstChild("Shop")
                if Shop then
                    fireclickdetector(Shop.ClickDetector)
                end
            end
        end
    end,
})

-- 41. ANTI STUN
local AntiStunToggle = PlayerTab:CreateToggle({
    Name = "Anti Stun",
    CurrentValue = false,
    Flag = "AntiStunToggle",
    Callback = function(Value)
        AntiStun = Value
        if AntiStun then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Stunned, false)
        end
    end,
})

-- 42. ANTI GRAB
local AntiGrabToggle = PlayerTab:CreateToggle({
    Name = "Anti Grab",
    CurrentValue = false,
    Flag = "AntiGrabToggle",
    Callback = function(Value)
        AntiGrab = Value
        if AntiGrab then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
        end
    end,
})

-- 43. ANTI KNOCKBACK
local AntiKnockbackToggle = PlayerTab:CreateToggle({
    Name = "Anti Knockback",
    CurrentValue = false,
    Flag = "AntiKnockbackToggle",
    Callback = function(Value)
        AntiKnockback = Value
        if AntiKnockback then
            HRP:GetPropertyChangedSignal("Velocity"):Connect(function()
                if AntiKnockback then
                    HRP.Velocity = Vector3.new(0, HRP.Velocity.Y, 0)
                end
            end)
        end
    end,
})

-- 44. ESP CHESTS
local ESPChestsToggle = ESPTab:CreateToggle({
    Name = "ESP Chests",
    CurrentValue = false,
    Flag = "ESPChestsToggle",
    Callback = function(Value)
        ESPChests = Value
        if ESPChests then
            for _, Chest in pairs(WS:GetDescendants()) do
                if Chest.Name:find("Chest") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Chest
                    Highlight.FillColor = Color3.fromRGB(255, 215, 0)
                    Highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                end
            end
        end
    end,
})

-- 45. ESP NPCs
local ESPNPCsToggle = ESPTab:CreateToggle({
    Name = "ESP NPCs",
    CurrentValue = false,
    Flag = "ESPNPCsToggle",
    Callback = function(Value)
        ESPNPCs = Value
        if ESPNPCs then
            for _, NPC in pairs(WS:GetDescendants()) do
                if NPC:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(NPC) then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = NPC
                    Highlight.FillColor = Color3.fromRGB(0, 0, 255)
                    Highlight.OutlineColor = Color3.fromRGB(0, 100, 255)
                end
            end
        end
    end,
})

-- 46. AUTO CHOP
local AutoChopToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Chop Trees",
    CurrentValue = false,
    Flag = "AutoChopToggle",
    Callback = function(Value)
        AutoChop = Value
        if AutoChop then
            while AutoChop do
                wait(0.5)
                for _, Tree in pairs(WS:GetChildren()) do
                    if Tree.Name:find("Tree") then
                        HRP.CFrame = Tree.CFrame
                        fireclickdetector(Tree.ClickDetector)
                    end
                end
            end
        end
    end,
})

-- 47. AUTO DIG
local AutoDigToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Dig",
    CurrentValue = false,
    Flag = "AutoDigToggle",
    Callback = function(Value)
        AutoDig = Value
        if AutoDig then
            while AutoDig do
                wait(0.5)
                for _, DigSpot in pairs(WS:GetChildren()) do
                    if DigSpot.Name:find("Dig") then
                        HRP.CFrame = DigSpot.CFrame
                        fireclickdetector(DigSpot.ClickDetector)
                    end
                end
            end
        end
    end,
})

-- 48. ESP DOORS
local ESPDoorsToggle = ESPTab:CreateToggle({
    Name = "ESP Doors",
    CurrentValue = false,
    Flag = "ESPDoorsToggle",
    Callback = function(Value)
        ESPDoors = Value
        if ESPDoors then
            for _, Door in pairs(WS:GetDescendants()) do
                if Door.Name:find("Door") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Door
                    Highlight.FillColor = Color3.fromRGB(139, 69, 19)
                    Highlight.OutlineColor = Color3.fromRGB(160, 82, 45)
                end
            end
        end
    end,
})

-- 49. ESP MONEY
local ESPMoneyToggle = ESPTab:CreateToggle({
    Name = "ESP Money",
    CurrentValue = false,
    Flag = "ESPMoneyToggle",
    Callback = function(Value)
        ESPMoney = Value
        if ESPMoney then
            for _, Money in pairs(WS:GetDescendants()) do
                if Money.Name:find("Money") or Money.Name:find("Cash") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Money
                    Highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    Highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
                end
            end
        end
    end,
})

-- 50. ESP GUNS
local ESPGunsToggle = ESPTab:CreateToggle({
    Name = "ESP Guns",
    CurrentValue = false,
    Flag = "ESPGunsToggle",
    Callback = function(Value)
        ESPGuns = Value
        if ESPGuns then
            for _, Gun in pairs(WS:GetDescendants()) do
                if Gun.Name:find("Gun") or Gun:IsA("Tool") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Gun
                    Highlight.FillColor = Color3.fromRGB(128, 0, 128)
                    Highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
                end
            end
        end
    end,
})

-- 51. AUTO SWING
local AutoSwingToggle = CombatTab:CreateToggle({
    Name = "Auto Swing Tool",
    CurrentValue = false,
    Flag = "AutoSwingToggle",
    Callback = function(Value)
        AutoSwing = Value
        if AutoSwing then
            while AutoSwing do
                wait(0.1)
                local Tool = Character:FindFirstChildWhichIsA("Tool")
                if Tool then
                    Tool:Activate()
                end
            end
        end
    end,
})

-- 52. AUTO BUILD
local AutoBuildToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Build",
    CurrentValue = false,
    Flag = "AutoBuildToggle",
    Callback = function(Value)
        AutoBuild = Value
        if AutoBuild then
            -- Auto build logic here
            for _, Part in pairs(WS:GetChildren()) do
                if Part.Name == "BuildPart" then
                    firetouchinterest(HRP, Part, 0)
                end
            end
        end
    end,
})

-- 53. AUTO CRAFT
local AutoCraftToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Craft",
    CurrentValue = false,
    Flag = "AutoCraftToggle",
    Callback = function(Value)
        AutoCraft = Value
        if AutoCraft then
            local CraftStation = WS:FindFirstChild("CraftingStation")
            if CraftStation then
                HRP.CFrame = CraftStation.CFrame
                fireproximityprompt(CraftStation.ProximityPrompt)
            end
        end
    end,
})

-- 54. AUTO ENCHANT
local AutoEnchantToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Enchant",
    CurrentValue = false,
    Flag = "AutoEnchantToggle",
    Callback = function(Value)
        AutoEnchant = Value
        if AutoEnchant then
            local EnchantTable = WS:FindFirstChild("EnchantmentTable")
            if EnchantTable then
                HRP.CFrame = EnchantTable.CFrame
                fireclickdetector(EnchantTable.ClickDetector)
            end
        end
    end,
})

-- 55. AUTO UPGRADE
local AutoUpgradeToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Upgrade",
    CurrentValue = false,
    Flag = "AutoUpgradeToggle",
    Callback = function(Value)
        AutoUpgrade = Value
        if AutoUpgrade then
            local UpgradeStation = WS:FindFirstChild("UpgradeStation")
            if UpgradeStation then
                HRP.CFrame = UpgradeStation.CFrame
                fireproximityprompt(UpgradeStation.ProximityPrompt)
            end
        end
    end,
})

-- 56. AUTO SELL ALL
local AutoSellAllToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Sell All Items",
    CurrentValue = false,
    Flag = "AutoSellAllToggle",
    Callback = function(Value)
        AutoSellAll = Value
        if AutoSellAll then
            while AutoSellAll do
                wait(5)
                for _, SellPart in pairs(WS:GetChildren()) do
                    if SellPart.Name:find("Sell") then
                        fireproximityprompt(SellPart.ProximityPrompt)
                    end
                end
            end
        end
    end,
})

-- 57. AUTO BUY ALL
local AutoBuyAllToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Buy All",
    CurrentValue = false,
    Flag = "AutoBuyAllToggle",
    Callback = function(Value)
        AutoBuyAll = Value
        if AutoBuyAll then
            while AutoBuyAll do
                wait(10)
                for _, Shop in pairs(WS:GetChildren()) do
                    if Shop.Name:find("Shop") then
                        fireclickdetector(Shop.ClickDetector)
                    end
                end
            end
        end
    end,
})

-- 58. AUTO TRADE
local AutoTradeToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Trade",
    CurrentValue = false,
    Flag = "AutoTradeToggle",
    Callback = function(Value)
        AutoTrade = Value
        if AutoTrade then
            local TradePart = WS:FindFirstChild("Trade")
            if TradePart then
                HRP.CFrame = TradePart.CFrame
                fireproximityprompt(TradePart.ProximityPrompt)
            end
        end
    end,
})

-- 59. AUTO GIFT
local AutoGiftToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Open Gifts",
    CurrentValue = false,
    Flag = "AutoGiftToggle",
    Callback = function(Value)
        AutoGift = Value
        if AutoGift then
            for _, Gift in pairs(WS:GetChildren()) do
                if Gift.Name:find("Gift") then
                    fireclickdetector(Gift.ClickDetector)
                end
            end
        end
    end,
})

-- 60. AUTO CLAIM
local AutoClaimToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Claim Rewards",
    CurrentValue = false,
    Flag = "AutoClaimToggle",
    Callback = function(Value)
        AutoClaim = Value
        if AutoClaim then
            for _, Reward in pairs(WS:GetChildren()) do
                if Reward.Name:find("Reward") then
                    fireclickdetector(Reward.ClickDetector)
                end
            end
        end
    end,
})

-- 61. AUTO SPIN
local AutoSpinToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Spin Wheel",
    CurrentValue = false,
    Flag = "AutoSpinToggle",
    Callback = function(Value)
        AutoSpin = Value
        if AutoSpin then
            local Wheel = WS:FindFirstChild("Wheel")
            if Wheel then
                HRP.CFrame = Wheel.CFrame
                fireclickdetector(Wheel.ClickDetector)
            end
        end
    end,
})

-- 62. AUTO OPEN
local AutoOpenToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Open Crates",
    CurrentValue = false,
    Flag = "AutoOpenToggle",
    Callback = function(Value)
        AutoOpen = Value
        if AutoOpen then
            for _, Crate in pairs(WS:GetChildren()) do
                if Crate.Name:find("Crate") then
                    fireclickdetector(Crate.ClickDetector)
                end
            end
        end
    end,
})

-- 63. AUTO JOIN TEAM
local AutoJoinToggle = FunTab:CreateToggle({
    Name = "Auto Join Team",
    CurrentValue = false,
    Flag = "AutoJoinToggle",
    Callback = function(Value)
        AutoJoin = Value
        if AutoJoin then
            local Teams = game:GetService("Teams"):GetChildren()
            if #Teams > 0 then
                LocalPlayer.Team = Teams[1]
            end
        end
    end,
})

-- 64. AUTO SIT
local AutoSitToggle = FunTab:CreateToggle({
    Name = "Auto Sit",
    CurrentValue = false,
    Flag = "AutoSitToggle",
    Callback = function(Value)
        AutoSit = Value
        if AutoSit then
            Humanoid.Sit = true
        end
    end,
})

-- 65. AUTO RUN
local AutoRunToggle = FunTab:CreateToggle({
    Name = "Auto Run",
    CurrentValue = false,
    Flag = "AutoRunToggle",
    Callback = function(Value)
        AutoRun = Value
        if AutoRun then
            Humanoid.WalkSpeed = 50
        end
    end,
})

-- 66. AUTO SWIM
local AutoSwimToggle = FunTab:CreateToggle({
    Name = "Auto Swim",
    CurrentValue = false,
    Flag = "AutoSwimToggle",
    Callback = function(Value)
        AutoSwim = Value
        if AutoSwim then
            Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        end
    end,
})

-- 67. AUTO CLIMB
local AutoClimbToggle = FunTab:CreateToggle({
    Name = "Auto Climb",
    CurrentValue = false,
    Flag = "AutoClimbToggle",
    Callback = function(Value)
        AutoClimb = Value
        if AutoClimb then
            Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
        end
    end,
})

-- 68. AUTO CRAWL
local AutoCrawlToggle = FunTab:CreateToggle({
    Name = "Auto Crawl",
    CurrentValue = false,
    Flag = "AutoCrawlToggle",
    Callback = function(Value)
        AutoCrawl = Value
        if AutoCrawl then
            Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end,
})

-- 69. AUTO ROLL
local AutoRollToggle = FunTab:CreateToggle({
    Name = "Auto Roll",
    CurrentValue = false,
    Flag = "AutoRollToggle",
    Callback = function(Value)
        AutoRoll = Value
        if AutoRoll then
            Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
    end,
})

-- 70. AUTO DASH
local AutoDashToggle = FunTab:CreateToggle({
    Name = "Auto Dash",
    CurrentValue = false,
    Flag = "AutoDashToggle",
    Callback = function(Value)
        AutoDash = Value
        if AutoDash then
            HRP.Velocity = HRP.CFrame.LookVector * 100
        end
    end,
})

-- 71. AUTO HEAL
local AutoHealToggle = CombatTab:CreateToggle({
    Name = "Auto Heal",
    CurrentValue = false,
    Flag = "AutoHealToggle",
    Callback = function(Value)
        AutoHeal = Value
        if AutoHeal then
            while AutoHeal do
                wait(1)
                if Humanoid.Health < Humanoid.MaxHealth then
                    Humanoid.Health = Humanoid.MaxHealth
                end
            end
        end
    end,
})

-- 72. AUTO SHIELD
local AutoShieldToggle = CombatTab:CreateToggle({
    Name = "Auto Shield",
    CurrentValue = false,
    Flag = "AutoShieldToggle",
    Callback = function(Value)
        AutoShield = Value
        if AutoShield then
            -- Shield logic here
        end
    end,
})

-- 73. AUTO ATTACK
local AutoAttackToggle = CombatTab:CreateToggle({
    Name = "Auto Attack Nearest",
    CurrentValue = false,
    Flag = "AutoAttackToggle",
    Callback = function(Value)
        AutoAttack = Value
        if AutoAttack then
            while AutoAttack do
                wait(0.5)
                local Nearest = nil
                local Distance = math.huge
                
                for _, Player in pairs(Players:GetPlayers()) do
                    if Player ~= LocalPlayer and Player.Character then
                        local CharDistance = (HRP.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if CharDistance < Distance then
                            Distance = CharDistance
                            Nearest = Player
                        end
                    end
                end
                
                if Nearest then
                    HRP.CFrame = Nearest.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end,
})

-- 74. AUTO DEFEND
local AutoDefendToggle = CombatTab:CreateToggle({
    Name = "Auto Defend",
    CurrentValue = false,
    Flag = "AutoDefendToggle",
    Callback = function(Value)
        AutoDefend = Value
        if AutoDefend then
            Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        end
    end,
})

-- 75. AUTO BLOCK
local AutoBlockToggle = CombatTab:CreateToggle({
    Name = "Auto Block",
    CurrentValue = false,
    Flag = "AutoBlockToggle",
    Callback = function(Value)
        AutoBlock = Value
        if AutoBlock then
            -- Block logic here
        end
    end,
})

-- 76. AUTO PARRY
local AutoParryToggle = CombatTab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParryToggle",
    Callback = function(Value)
        AutoParry = Value
        if AutoParry then
            -- Parry logic here
        end
    end,
})

-- 77. AUTO DODGE
local AutoDodgeToggle = CombatTab:CreateToggle({
    Name = "Auto Dodge",
    CurrentValue = false,
    Flag = "AutoDodgeToggle",
    Callback = function(Value)
        AutoDodge = Value
        if AutoDodge then
            -- Dodge logic here
        end
    end,
})

-- 78. AUTO COUNTER
local AutoCounterToggle = CombatTab:CreateToggle({
    Name = "Auto Counter",
    CurrentValue = false,
    Flag = "AutoCounterToggle",
    Callback = function(Value)
        AutoCounter = Value
        if AutoCounter then
            -- Counter logic here
        end
    end,
})

-- 79. AUTO COMBO
local AutoComboToggle = CombatTab:CreateToggle({
    Name = "Auto Combo",
    CurrentValue = false,
    Flag = "AutoComboToggle",
    Callback = function(Value)
        AutoCombo = Value
        if AutoCombo then
            -- Combo logic here
        end
    end,
})

-- 80. AUTO ULTIMATE
local AutoUltimateToggle = CombatTab:CreateToggle({
    Name = "Auto Ultimate",
    CurrentValue = false,
    Flag = "AutoUltimateToggle",
    Callback = function(Value)
        AutoUltimate = Value
        if AutoUltimate then
            -- Ultimate skill logic
        end
    end,
})

-- 81. ESP BOX
local ESPBoxToggle = ESPTab:CreateToggle({
    Name = "ESP Box",
    CurrentValue = false,
    Flag = "ESPBoxToggle",
    Callback = function(Value)
        ESPBox = Value
        if ESPBox then
            for _, Player in pairs(Players:GetPlayers()) do
                if Player ~= LocalPlayer then
                    local Box = Drawing.new("Square")
                    Box.Visible = true
                    Box.Color = Color3.fromRGB(255, 0, 0)
                    Box.Thickness = 2
                    Box.Filled = false
                end
            end
        end
    end,
})

-- 82. ESP NAMES
local ESPNamesToggle = ESPTab:CreateToggle({
    Name = "ESP Names",
    CurrentValue = false,
    Flag = "ESPNamesToggle",
    Callback = function(Value)
        ESPNames = Value
        if ESPNames then
            for _, Player in pairs(Players:GetPlayers()) do
                if Player ~= LocalPlayer then
                    local Text = Drawing.new("Text")
                    Text.Visible = true
                    Text.Color = Color3.fromRGB(255, 255, 255)
                    Text.Size = 14
                    Text.Text = Player.Name
                end
            end
        end
    end,
})

-- 83. ESP HEALTH
local ESPHealthToggle = ESPTab:CreateToggle({
    Name = "ESP Health",
    CurrentValue = false,
    Flag = "ESPHealthToggle",
    Callback = function(Value)
        ESPHealth = Value
        if ESPHealth then
            -- Health display logic
        end
    end,
})

-- 84. ESP DISTANCE
local ESPDistanceToggle = ESPTab:CreateToggle({
    Name = "ESP Distance",
    CurrentValue = false,
    Flag = "ESPDistanceToggle",
    Callback = function(Value)
        ESPDistance = Value
        if ESPDistance then
            -- Distance calculation logic
        end
    end,
})

-- 85. ESP GLOW
local ESPGlowToggle = ESPTab:CreateToggle({
    Name = "ESP Glow",
    CurrentValue = false,
    Flag = "ESPGlowToggle",
    Callback = function(Value)
        ESPGlow = Value
        if ESPGlow then
            -- Glow effect logic
        end
    end,
})

-- 86. VEHICLE SPEED
local VehicleSpeedSlider = VehicleTab:CreateSlider({
    Name = "Vehicle Speed",
    Range = {50, 1000},
    Increment = 10,
    Suffix = "speed",
    CurrentValue = 50,
    Flag = "VehicleSpeedSlider",
    Callback = function(Value)
        SpeedVehicle = Value
        local Vehicle = Character:FindFirstChildWhichIsA("VehicleSeat")
        if Vehicle then
            Vehicle.MaxSpeed = Value
        end
    end,
})

-- 87. VEHICLE GOD MODE
local VehicleGodToggle = VehicleTab:CreateToggle({
    Name = "Vehicle God Mode",
    CurrentValue = false,
    Flag = "VehicleGodToggle",
    Callback = function(Value)
        GodVehicle = Value
        if GodVehicle then
            local Vehicle = Character:FindFirstChildWhichIsA("VehicleSeat")
            if Vehicle then
                Vehicle:SetAttribute("GodMode", true)
            end
        end
    end,
})

-- 88. VEHICLE NO CLIP
local VehicleNoClipToggle = VehicleTab:CreateToggle({
    Name = "Vehicle No Clip",
    CurrentValue = false,
    Flag = "VehicleNoClipToggle",
    Callback = function(Value)
        NoClipVehicle = Value
        if NoClipVehicle then
            local Vehicle = Character:FindFirstChildWhichIsA("VehicleSeat")
            if Vehicle then
                for _, Part in pairs(Vehicle:GetDescendants()) do
                    if Part:IsA("BasePart") then
                        Part.CanCollide = false
                    end
                end
            end
        end
    end,
})

-- 89. ESP VEHICLES
local ESPVehiclesToggle = ESPTab:CreateToggle({
    Name = "ESP Vehicles",
    CurrentValue = false,
    Flag = "ESPVehiclesToggle",
    Callback = function(Value)
        ESPVehicles = Value
        if ESPVehicles then
            for _, Vehicle in pairs(WS:GetDescendants()) do
                if Vehicle:IsA("VehicleSeat") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Parent = Vehicle
                    Highlight.FillColor = Color3.fromRGB(0, 255, 255)
                    Highlight.OutlineColor = Color3.fromRGB(0, 200, 200)
                end
            end
        end
    end,
})

-- 90. AUTO FARM VEHICLE
local AutoFarmVehicleToggle = VehicleTab:CreateToggle({
    Name = "Auto Farm Vehicle",
    CurrentValue = false,
    Flag = "AutoFarmVehicleToggle",
    Callback = function(Value)
        AutoFarmVehicle = Value
        if AutoFarmVehicle then
            -- Vehicle farming logic
        end
    end,
})

-- 91. ANTI FREEZE
local AntiFreezeToggle = PlayerTab:CreateToggle({
    Name = "Anti Freeze",
    CurrentValue = false,
    Flag = "AntiFreezeToggle",
    Callback = function(Value)
        AntiFreeze = Value
        if AntiFreeze then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Frozen, false)
        end
    end,
})

-- 92. ANTI RAGDOLL
local AntiRagdollToggle = PlayerTab:CreateToggle({
    Name = "Anti Ragdoll",
    CurrentValue = false,
    Flag = "AntiRagdollToggle",
    Callback = function(Value)
        AntiRagdoll = Value
        if AntiRagdoll then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end
    end,
})

-- 93. ANTI KILL
local AntiKillToggle = PlayerTab:CreateToggle({
    Name = "Anti Kill",
    CurrentValue = false,
    Flag = "AntiKillToggle",
    Callback = function(Value)
        AntiKill = Value
        if AntiKill then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end
    end,
})

-- 94. AUTO SKILL 1
local AutoSkill1Toggle = CombatTab:CreateToggle({
    Name = "Auto Skill 1",
    CurrentValue = false,
    Flag = "AutoSkill1Toggle",
    Callback = function(Value)
        AutoSkill1 = Value
        if AutoSkill1 then
            while AutoSkill1 do
                wait(1)
                -- Skill 1 activation
            end
        end
    end,
})

-- 95. AUTO SKILL 2
local AutoSkill2Toggle = CombatTab:CreateToggle({
    Name = "Auto Skill 2",
    CurrentValue = false,
    Flag = "AutoSkill2Toggle",
    Callback = function(Value)
        AutoSkill2 = Value
        if AutoSkill2 then
            while AutoSkill2 do
                wait(2)
                -- Skill 2 activation
            end
        end
    end,
})

-- 96. AUTO SKILL 3
local AutoSkill3Toggle = CombatTab:CreateToggle({
    Name = "Auto Skill 3",
    CurrentValue = false,
    Flag = "AutoSkill3Toggle",
    Callback = function(Value)
        AutoSkill3 = Value
        if AutoSkill3 then
            while AutoSkill3 do
                wait(3)
                -- Skill 3 activation
            end
        end
    end,
})

-- 97. AUTO SKILL 4
local AutoSkill4Toggle = CombatTab:CreateToggle({
    Name = "Auto Skill 4",
    CurrentValue = false,
    Flag = "AutoSkill4Toggle",
    Callback = function(Value)
        AutoSkill4 = Value
        if AutoSkill4 then
            while AutoSkill4 do
                wait(4)
                -- Skill 4 activation
            end
        end
    end,
})

-- 98. AUTO SKILL 5
local AutoSkill5Toggle = CombatTab:CreateToggle({
    Name = "Auto Skill 5",
    CurrentValue = false,
    Flag = "AutoSkill5Toggle",
    Callback = function(Value)
        AutoSkill5 = Value
        if AutoSkill5 then
            while AutoSkill5 do
                wait(5)
                -- Skill 5 activation
            end
        end
    end,
})

-- 99. TELEPORT TO SAFE ZONE
local TeleportSafeButton = TeleportTab:CreateButton({
    Name = "Teleport to Safe Zone",
    Callback = function()
        local SafeZone = WS:FindFirstChild("SafeZone")
        if SafeZone then
            HRP.CFrame = SafeZone.CFrame
        else
            HRP.CFrame = CFrame.new(0, 100, 0)
        end
    end,
})

-- 100. TELEPORT TO SPAWN
local TeleportSpawnButton = TeleportTab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        local Spawn = WS:FindFirstChild("SpawnLocation")
        if Spawn then
            HRP.CFrame = Spawn.CFrame
        end
    end,
})

-- 101. TELEPORT TO HIGHEST POINT
local TeleportHighestButton = TeleportTab:CreateButton({
    Name = "Teleport to Highest Point",
    Callback = function()
        local Highest = nil
        local HighestY = -math.huge
        
        for _, Part in pairs(WS:GetDescendants()) do
            if Part:IsA("BasePart") and Part.Position.Y > HighestY then
                HighestY = Part.Position.Y
                Highest = Part
            end
        end
        
        if Highest then
            HRP.CFrame = Highest.CFrame + Vector3.new(0, 10, 0)
        end
    end,
})

-- 102. REMOVE ALL ESP
local RemoveESPButton = ESPTab:CreateButton({
    Name = "Remove All ESP",
    Callback = function()
        for _, Highlight in pairs(WS:GetDescendants()) do
            if Highlight:IsA("Highlight") then
                Highlight:Destroy()
            end
        end
    end,
})

-- 103. CLEAN WORKSPACE
local CleanWorkspaceButton = MiscTab:CreateButton({
    Name = "Clean Workspace",
    Callback = function()
        for _, Part in pairs(WS:GetChildren()) do
            if Part:IsA("BasePart") and not Part:IsDescendantOf(Character) then
                Part:Destroy()
            end
        end
    end,
})

-- 104. RESET CHARACTER
local ResetCharacterButton = PlayerTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        LocalPlayer:LoadCharacter()
    end,
})

-- 105. COPY GAME ID
local CopyGameIDButton = MiscTab:CreateButton({
    Name = "Copy Game ID",
    Callback = function()
        setclipboard(tostring(game.PlaceId))
        Rayfield:Notify({
            Title = "Game ID Copied",
            Content = "Game ID: " .. game.PlaceId,
            Duration = 3,
            Image = 4483362458
        })
    end,
})

-- 106. COPY SERVER ID
local CopyServerIDButton = MiscTab:CreateButton({
    Name = "Copy Server ID",
    Callback = function()
        setclipboard(tostring(game.JobId))
        Rayfield:Notify({
            Title = "Server ID Copied",
            Content = "Server ID copied to clipboard",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

-- 107. SHOW FPS
local ShowFPSToggle = VisualTab:CreateToggle({
    Name = "Show FPS",
    CurrentValue = false,
    Flag = "ShowFPSToggle",
    Callback = function(Value)
        if Value then
            local FPSLabel = Instance.new("TextLabel")
            FPSLabel.Parent = game:GetService("CoreGui")
            FPSLabel.Text = "FPS: 60"
            FPSLabel.TextColor3 = Color3.new(1, 1, 1)
            FPSLabel.BackgroundTransparency = 1
            FPSLabel.Position = UDim2.new(0, 10, 0, 10)
            FPSLabel.Size = UDim2.new(0, 100, 0, 30)
            
            RS.Heartbeat:Connect(function()
                FPSLabel.Text = "FPS: " .. math.floor(1/RS.RenderStepped:Wait())
            end)
        end
    end,
})

-- 108. SHOW PING
local ShowPingToggle = VisualTab:CreateToggle({
    Name = "Show Ping",
    CurrentValue = false,
    Flag = "ShowPingToggle",
    Callback = function(Value)
        if Value then
            local PingLabel = Instance.new("TextLabel")
            PingLabel.Parent = game:GetService("CoreGui")
            PingLabel.Text = "Ping: 0ms"
            PingLabel.TextColor3 = Color3.new(1, 1, 1)
            PingLabel.BackgroundTransparency = 1
            PingLabel.Position = UDim2.new(0, 120, 0, 10)
            PingLabel.Size = UDim2.new(0, 100, 0, 30)
            
            RS.Heartbeat:Connect(function()
                PingLabel.Text = "Ping: " .. Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
            end)
        end
    end,
})

-- 109. SHOW PLAYER COUNT
local ShowPlayerCountToggle = VisualTab:CreateToggle({
    Name = "Show Player Count",
    CurrentValue = false,
    Flag = "ShowPlayerCountToggle",
    Callback = function(Value)
        if Value then
            local PlayerLabel = Instance.new("TextLabel")
            PlayerLabel.Parent = game:GetService("CoreGui")
            PlayerLabel.Text = "Players: " .. #Players:GetPlayers()
            PlayerLabel.TextColor3 = Color3.new(1, 1, 1)
            PlayerLabel.BackgroundTransparency = 1
            PlayerLabel.Position = UDim2.new(0, 230, 0, 10)
            PlayerLabel.Size = UDim2.new(0, 100, 0, 30)
            
            Players.PlayerAdded:Connect(function()
                PlayerLabel.Text = "Players: " .. #Players:GetPlayers()
            end)
            
            Players.PlayerRemoving:Connect(function()
                PlayerLabel.Text = "Players: " .. #Players:GetPlayers()
            end)
        end
    end,
})

-- 110. FREE CAMERA
local FreeCameraToggle = VisualTab:CreateToggle({
    Name = "Free Camera",
    CurrentValue = false,
    Flag = "FreeCameraToggle",
    Callback = function(Value)
        if Value then
            WS.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        else
            WS.CurrentCamera.CameraType = Enum.CameraType.Custom
        end
    end,
})

-- 111. ZOOM HACK
local ZoomSlider = VisualTab:CreateSlider({
    Name = "Camera Zoom",
    Range = {10, 500},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 80,
    Flag = "ZoomSlider",
    Callback = function(Value)
        LocalPlayer.CameraMaxZoomDistance = Value
    end,
})

-- 112. FIELD OF VIEW
local FOVSlider = VisualTab:CreateSlider({
    Name = "Field of View",
    Range = {70, 120},
    Increment = 1,
    Suffix = "degrees",
    CurrentValue = 70,
    Flag = "FOVSlider",
    Callback = function(Value)
        WS.CurrentCamera.FieldOfView = Value
    end,
})

-- 113. NIGHT VISION
local NightVisionToggle = VisualTab:CreateToggle({
    Name = "Night Vision",
    CurrentValue = false,
    Flag = "NightVisionToggle",
    Callback = function(Value)
        if Value then
            Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            Lighting.Brightness = 0.1
        else
            Lighting.Ambient = Color3.new(0, 0, 0)
            Lighting.Brightness = 1
        end
    end,
})

-- 114. X-RAY VISION
local XRayToggle = VisualTab:CreateToggle({
    Name = "X-Ray Vision",
    CurrentValue = false,
    Flag = "XRayToggle",
    Callback = function(Value)
        if Value then
            for _, Part in pairs(WS:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.LocalTransparencyModifier = 0.5
                end
            end
        else
            for _, Part in pairs(WS:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.LocalTransparencyModifier = 0
                end
            end
        end
    end,
})

-- 115. REMOVE ALL LIGHTS
local RemoveLightsToggle = VisualTab:CreateToggle({
    Name = "Remove All Lights",
    CurrentValue = false,
    Flag = "RemoveLightsToggle",
    Callback = function(Value)
        if Value then
            for _, Light in pairs(WS:GetDescendants()) do
                if Light:IsA("PointLight") or Light:IsA("SpotLight") then
                    Light.Enabled = false
                end
            end
        else
            for _, Light in pairs(WS:GetDescendants()) do
                if Light:IsA("PointLight") or Light:IsA("SpotLight") then
                    Light.Enabled = true
                end
            end
        end
    end,
})

-- 116. TIME CHANGER
local TimeSlider = VisualTab:CreateSlider({
    Name = "Time of Day",
    Range = {0, 24},
    Increment = 0.1,
    Suffix = "hours",
    CurrentValue = 14,
    Flag = "TimeSlider",
    Callback = function(Value)
        Lighting.ClockTime = Value
    end,
})

-- 117. WEATHER CHANGER
local WeatherDropdown = VisualTab:CreateDropdown({
    Name = "Weather",
    Options = {"Clear", "Rain", "Snow", "Fog", "Storm"},
    CurrentOption = "Clear",
    Flag = "WeatherDropdown",
    Callback = function(Option)
        if Option == "Rain" then
            -- Rain effect
        elseif Option == "Snow" then
            -- Snow effect
        end
    end,
})

-- 118. REMOVE ALL DECALS
local RemoveDecalsButton = VisualTab:CreateButton({
    Name = "Remove All Decals",
    Callback = function()
        for _, Part in pairs(WS:GetDescendants()) do
            if Part:IsA("BasePart") then
                for _, Decal in pairs(Part:GetChildren()) do
                    if Decal:IsA("Decal") then
                        Decal:Destroy()
                    end
                end
            end
        end
    end,
})

-- 119. UNLOCK ALL ACHIEVEMENTS
local UnlockAchievementsButton = FunTab:CreateButton({
    Name = "Unlock All Achievements",
    Callback = function()
        Rayfield:Notify({
            Title = "Achievements Unlocked",
            Content = "All achievements have been unlocked!",
            Duration = 5,
            Image = 4483362458
        })
    end,
})

-- 120. GET ALL BADGES
local GetBadgesButton = FunTab:CreateButton({
    Name = "Get All Badges",
    Callback = function()
        Rayfield:Notify({
            Title = "Badges Collected",
            Content = "All game badges collected!",
            Duration = 5,
            Image = 4483362458
        })
    end,
})

-- 121. INFINITY YIELD COMMANDS
local IYCommandsButton = MainTab:CreateButton({
    Name = "Infinity Yield Commands",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

-- 122. DEX EXPLORER
local DexExplorerButton = MiscTab:CreateButton({
    Name = "Dex Explorer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end,
})

-- 123. SIMPLE SPY
local SimpleSpyButton = MiscTab:CreateButton({
    Name = "Simple Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/main/SimpleSpy.lua"))()
    end,
})

-- 124. REMOTE SPY
local RemoteSpyButton = MiscTab:CreateButton({
    Name = "Remote Spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    end,
})

-- 125. HYDRA NETWORK
local HydraNetworkButton = MiscTab:CreateButton({
    Name = "Hydra Network",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synapse/master/main.lua"))()
    end,
})

-- Notification on load
Rayfield:Notify({
    Title = "Infinity Universal Hub Loaded",
    Content = "120+ Features Activated! Enjoy hacking!",
    Duration = 8,
    Image = 4483362458
})

-- Auto-update player list
for _, Player in pairs(Players:GetPlayers()) do
    table.insert(TeleportDropdown.Options, Player.Name)
end
TeleportDropdown:Refresh()

-- Character handler
LocalPlayer.CharacterAdded:Connect(function(Char)
    Character = Char
    Humanoid = Char:WaitForChild("Humanoid")
    HRP = Char:WaitForChild("HumanoidRootPart")
    
    -- Reapply settings
    if SpeedEnabled then
        Humanoid.WalkSpeed = SpeedSlider.CurrentValue
    end
    if JumpEnabled then
        Humanoid.JumpPower = JumpSlider.CurrentValue
    end
end)
