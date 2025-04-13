local src=game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua")
local task=task
local spawn=task.spawn or spawn
if not src:find("_vyWGcBVnLkKQ") then -- anti other crackles
    spawn(function()
        game:GetService"Players".LocalPlayer:Kick("dtc by 25ms 💔")
    end)
    task.wait(3)
    repeat until false
end
src="-- 25ms was here lol\n"..src -- anti 25ms crack
local KeyGuardLibrary = loadstring(src)()
local trueData = "8c71a95fb90a48b5bca20dc96879eb4a"
local falseData = "fc28a4d28a084c50a28815d60ce352c0"

KeyGuardLibrary.Set({
    publicToken = "b7528b3a6dcb47c0b1ca8f13efea7bb0",
    privateToken = "14e2a2793f0149589cd644987a66655d",
    trueData = trueData,
    falseData = falseData,
})

local key = script_key or getgenv().script_key or key

if not key then
    spawn(function()
        game:GetService"Players".LocalPlayer:Kick("Please put a valid key")
    end)
    return
end

local response = KeyGuardLibrary.validatePremiumKey(key)

if response == trueData then
    print("Key is valid")
else
    spawn(function()
        game:GetService"Players".LocalPlayer:Kick("Your key is not valid")
    end)
    task.wait(7)
    repeat until false
    return
end

if getgenv().Pravus.FPS.FPSUnlocker == true then
    if setfpscap then
        setfpscap(getgenv().Pravus.FPS.Limit)
    end
end


if getgenv().Pravus.StartUp.Intro then
    local soundId = "rbxassetid://114378426089149"  
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = 0.5

    local cam = workspace.CurrentCamera
    local x = cam.ViewportSize.X
    local y = cam.ViewportSize.Y
    local newx = math.floor(x * 0.5)
    local newy = math.floor(y * 0.5)

    local PravusScreen = Instance.new("ScreenGui")
    local Image = Instance.new("ImageLabel")
    local LoadingText = Instance.new("TextLabel")

    PravusScreen.Name = "PravusScreen"
    PravusScreen.Parent = game.CoreGui
    PravusScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    LoadingText.Name = "LoadingText"
    LoadingText.Parent = PravusScreen
    LoadingText.Position = UDim2.new(0.5, 0, 0.70, 0) 
    LoadingText.Size = UDim2.new(0, 165, 0, 29)
    LoadingText.BackgroundTransparency = 1
    LoadingText.Text = "Pravus is loading.."
    LoadingText.TextScaled = true
    LoadingText.TextColor3 = Color3.fromRGB(210, 210, 210)
    LoadingText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    LoadingText.TextStrokeTransparency = 0
    LoadingText.Font = Enum.Font.Code
    LoadingText.AnchorPoint = Vector2.new(0.5, 0.5)
    LoadingText.TextTransparency = 1 

    Image.Name = "Image"
    Image.Parent = PravusScreen
    Image.BackgroundTransparency = 1
    Image.Position = UDim2.new(0.5, 0, 0.5, 0) 
    Image.Size = UDim2.new(0, 600, 0, 230)
    Image.Image = "rbxassetid://119883433081441" 
    Image.ImageTransparency = 1
    Image.AnchorPoint = Vector2.new(0.5, 0.5)

    local Blur = Instance.new("BlurEffect")
    Blur.Parent = game.Lighting
    Blur.Size = 0
    Blur.Name = tostring(math.random(1, 123123))

    local function gui(last, properties, t, s)
        local TI = TweenInfo.new(t or 1, s or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local Tweening = game:GetService("TweenService"):Create(last, TI, properties)
        Tweening:Play()
    end

    wait(2) 

    gui(LoadingText, {TextTransparency = 0}, 0.3)
    wait(0.1) 

    gui(Image, {ImageTransparency = 0}, 0.3)
    gui(Blur, {Size = 20}, 0.3)
    wait(3) 

    gui(Image, {ImageTransparency = 1}, 0.3)
    gui(Blur, {Size = 0}, 0.3)
    wait(4) 

    gui(LoadingText, {TextTransparency = 1}, 0.3)
    wait(0.3)

    PravusScreen:Destroy()
    Blur:Destroy()

    local loadingtime = tick()
    local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))();
    local notifications = notificationLibrary.new({            
        NotificationLifetime = 5, 
        NotificationPosition = "Middle",
        
        TextFont = Enum.Font.Code,
        TextColor = Color3.fromRGB(255, 255, 255),
        TextSize = 15,
        
        TextStrokeTransparency = 0, 
        TextStrokeColor = Color3.fromRGB(0, 0, 0)
    });
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera

getgenv().Pravus_Connections = {}

do
    local isSpeeding = false
    local defaultSpeed = 20
    local speedToggled = false

    local function updateSpeed()
        if not LocalPlayer.Character then return end
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        humanoid.WalkSpeed = isSpeeding and Pravus.WalkSpeed.Speed or defaultSpeed
    end

    local function onKeyPress(key)
        if key:lower() == Pravus.WalkSpeed.Keybind:lower() then
            isSpeeding = not isSpeeding
            speedToggled = true
            updateSpeed()
            
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                        if speedToggled then
                            humanoid.WalkSpeed = isSpeeding and Pravus.WalkSpeed.Speed or defaultSpeed
                        end
                    end)
                end
            end
        end
    end




    local function onCharacterAdded(character)
        character:WaitForChild("Humanoid")
        isSpeeding = false
        speedToggled = false
        updateSpeed()
    end

    table.insert(Pravus_Connections, Mouse.KeyDown:Connect(onKeyPress))
    table.insert(Pravus_Connections, LocalPlayer.CharacterAdded:Connect(onCharacterAdded))
    table.insert(Pravus_Connections, RunService.Heartbeat:Connect(updateSpeed))
    
    if LocalPlayer.Character then
        onCharacterAdded(LocalPlayer.Character)
    end
end


    

    

local function GetPing()
    local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local split = string.split(pingvalue,'(')
    return tonumber(split[1])
end

local function SilentAimPrediction()
    if not Pravus.SilentAim.AutoPrediction then
        return tonumber(Pravus.SilentAim.Prediction)
    end
    
    local ping = GetPing()
    
    if ping < 10 then
        return 0.11252476
    elseif ping < 20 then
        return 0.1211928
    elseif ping < 30 then
        return 0.1254263
    elseif ping < 40 then
        return 0.11252476
    elseif ping < 50 then
        return 0.13544
    elseif ping < 60 then
        return 0.1264236
    elseif ping < 70 then
        return 0.1400049
    elseif ping < 80 then
        return 0.13581963
    elseif ping < 90 then
        return 0.13873952
    elseif ping < 100 then
        return 0.14173456
    elseif ping < 110 then
        return 0.14362652
    elseif ping < 120 then
        return 0.14683943
    elseif ping < 130 then
        return 0.15175864
    elseif ping < 140 then
        return 0.15382643
    elseif ping < 150 then
        return 0.15873582
    else
        return 0.15
    end
end

local function CamlockPrediction()
    if not Pravus.Camlock.AutoPrediction then
        return tonumber(Pravus.Camlock.Prediction)
    end
    
    local ping = GetPing()
    
    if ping < 10 then
        return 0.11252476
    elseif ping < 20 then
        return 0.1211928
    elseif ping < 30 then
        return 0.1254263
    elseif ping < 40 then
        return 0.11252476
    elseif ping < 50 then
        return 0.13544
    elseif ping < 60 then
        return 0.1264236
    elseif ping < 70 then
        return 0.1400049
    elseif ping < 80 then
        return 0.13581963
    elseif ping < 90 then
        return 0.13873952
    elseif ping < 100 then
        return 0.14173456
    elseif ping < 110 then
        return 0.14362652
    elseif ping < 120 then
        return 0.14683943
    elseif ping < 130 then
        return 0.15175864
    elseif ping < 140 then
        return 0.15382643
    elseif ping < 150 then
        return 0.15873582
    else
        return 0.15
    end
end

do
    local CamlockTarget = nil
    local CamToggle = false

    local function IsTargetValid(player)
        if not player or not player.Character then return false end
        if Pravus.Checks.KOCheck and player.Character:FindFirstChild("BodyEffects") and player.Character.BodyEffects:FindFirstChild("K.O") and player.Character.BodyEffects["K.O"].Value then
            return false
        end

        if Pravus.Checks.WallCheck then
            local origin = Camera.CFrame.Position
            local targetPos = player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
            if targetPos then
                local ray = Ray.new(origin, (targetPos - origin).Unit * 1000)
                local part = Workspace:FindPartOnRay(ray, LocalPlayer.Character, false, true)
                if part and not player.Character:IsAncestorOf(part) then
                    return false
                end
            end
        end
        return true
    end

    local function GetClosestPlr()
        local ClosestTarget = nil
        local MaxDistance = math.huge
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and IsTargetValid(player) then
                local pos, onScreen = Camera:WorldToScreenPoint(player.Character.HumanoidRootPart.Position)
                local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if onScreen and dist < MaxDistance then
                    ClosestTarget = player
                    MaxDistance = dist
                end
            end
        end
        return ClosestTarget
    end

    local function Camlock()
        if CamlockTarget and CamlockTarget.Character then
            local humanoid = CamlockTarget.Character:FindFirstChild("Humanoid")
            local targetPart = CamlockTarget.Character[Pravus.Camlock.Part]

            if humanoid and targetPart then
                local offset = humanoid:GetState() == Enum.HumanoidStateType.Freefall and Vector3.new(0, Pravus.Camlock.JumpOffset, 0) or Vector3.zero
                local predicted = targetPart.Position + offset + (targetPart.Velocity * Pravus.Camlock.Prediction)
                local newCF = CFrame.new(Camera.CFrame.Position, predicted)
                Camera.CFrame = Camera.CFrame:Lerp(newCF, Pravus.Camlock.Smoothness)
            end
        end
    end

    table.insert(Pravus_Connections, RunService.RenderStepped:Connect(function()
        if CamToggle and Pravus.Camlock.Enabled then
            if Pravus.Checks.SelfDeath and (not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character.Humanoid.Health <= 0) then
                CamToggle = false
                CamlockTarget = nil
                return
            end
            Camlock()
        end
    end))

    table.insert(Pravus_Connections, UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode[Pravus.Camlock.Keybind] then
            CamToggle = not CamToggle
            CamlockTarget = CamToggle and GetClosestPlr() or nil
        end
    end))
end

if getgenv().Pravus.Checks.AntiAimViewer then 
    local Client = game.Players.LocalPlayer
    local Mouse = Client:GetMouse()
    
    if BrutalityTarget then
        local a = math.huge
        local b = nil

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= Client and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("HumanoidRootPart") then
                local c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
                local d = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(c.X, c.Y)).Magnitude
                if a > d then
                    b = v
                    a = d
                end
            end
        end

        return b
    elseif BrutalityTarget == nil then
        wait()
    end
end



local function getClosestBodyPartToMouse(player)
    if not player or not player.Character then
        return nil
    end

    local minDistance = math.huge
    local closestBodyPart = nil
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)

    local character = player.Character
    for _, partName in pairs({"Head", "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "LeftLeg", "RightLeg", "LeftArm", "RightArm"}) do
        local part = character:FindFirstChild(partName)
        if part then
            local screenPos, onScreen = Camera:WorldToScreenPoint(part.Position)
            if onScreen then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    closestBodyPart = part
                end
            end
        end
    end
    
    return closestBodyPart 
end

local settings = Pravus.SilentAim
local fovSettings = settings.FOV

local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = fovSettings.Color
FOVCircle.Thickness = fovSettings.Thickness
FOVCircle.Filled = false
FOVCircle.Transparency = fovSettings.Transparency
FOVCircle.Radius = fovSettings.Radius

local function IsTargetValid(Player)
    if Player and Player.Character and Player.Character:FindFirstChild(settings.HitPart) then
        local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        return Humanoid and Humanoid.Health > 0
    end
    return false
end

local function isValidTarget(player)
    local character = player.Character
    if not character then return false end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end

    local hitPart = character:FindFirstChild(getgenv().Pravus.SilentAim.HitPart)
    if not hitPart then return false end

    if getgenv().Pravus.Checks and getgenv().Pravus.Checks.WallCheck then
        local origin = Camera.CFrame.Position
        local targetPos = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position

        if targetPos then
            local ray = Ray.new(origin, (targetPos - origin).Unit * 1000)
            local part = workspace:FindPartOnRay(ray, LocalPlayer.Character, false, true)
            if part and not character:IsAncestorOf(part) then
                return false
            end
        end
    end

    return true
end

local function GetClosestPlayer()
    local ClosestPart = nil
    local ClosestDistance = math.huge
    local MousePosition = UserInputService:GetMouseLocation()

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and isValidTarget(Player) then
            local Character = Player.Character
            local TargetPart
            
            if Pravus.SilentAim.NearestPoint then
                TargetPart = getClosestBodyPartToMouse(Player)
            else
                TargetPart = Character:FindFirstChild(settings.HitPart)
            end
            
            if TargetPart then
                local ScreenPosition, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local Distance = (MousePosition - Vector2.new(ScreenPosition.X, ScreenPosition.Y)).Magnitude
                    if Distance <= fovSettings.Radius and Distance < ClosestDistance then
                        ClosestDistance = Distance
                        ClosestPart = TargetPart
                    end
                end
            end
        end
    end

    return ClosestPart
end

local MetaTable = getrawmetatable(game)
local OldIndex = MetaTable.__index
setreadonly(MetaTable, false)

MetaTable.__index = function(self, key)
    if not checkcaller() and self == Mouse and settings.Enabled then
        if key == "Hit" or key == "Target" then
            local TargetPart = GetClosestPlayer()
            if TargetPart then
                local Velocity = TargetPart.Velocity or Vector3.zero
                local PredictedPosition = TargetPart.Position + (Velocity * settings.Prediction)
                return key == "Hit" and CFrame.new(PredictedPosition) or TargetPart
            end
        end
    end
    return OldIndex(self, key)
end

RunService.RenderStepped:Connect(function()
    FOVCircle.Visible = fovSettings.Visible and settings.Enabled
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = fovSettings.Radius
end)

-- // ['TargetAim'] // --
local Players = game:GetService("Players")
local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Guis = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local prey
local prey2
local TargetPlayer
local On
local Old
local PravusMacro 
local PravusMacro1
local HeldDown 
local isSpeeding
local isJumping
local saved = Pravus.TargetAim.HitPart

local Utility = {}
local MainRemote
local placeId = game.PlaceId

local Circle = Drawing.new("Circle")
Circle.Color = Color3.new(214, 202, 221)
Circle.Transparency = 0.8
Circle.Thickness = 0.7

local Circle2 = Drawing.new("Circle")
Circle2.Color = Color3.new(214, 202, 221)
Circle2.Transparency = 0.8
Circle2.Thickness = 0.7

local Line = Drawing.new("Line")
Line.Color = Color3.new(214, 202, 221)
Line.Transparency = 1
Line.Thickness = 1


local TargetPred = Drawing.new("Text")
TargetPred.Text = "Target Prediction: "
TargetPred.Color = Color3.new(214, 202, 221)
TargetPred.Visible = false
TargetPred.Size = 16
TargetPred.Outline = true
TargetPred.Font = 3
TargetPred.Position = Vector2.new(20, 210)
TargetPred.ZIndex = 1500


local HP = Drawing.new("Text")
HP.Text = "Hitpart: "
HP.Color = Color3.new(214, 202, 221)
HP.Visible = false
HP.Size = 16
HP.Outline = true
HP.Font = 3
HP.Position = Vector2.new(20, 240)
HP.ZIndex = 1500

local WallCheckIndicator = Drawing.new("Text")
WallCheckIndicator.Text = "WallCheck: ON"
WallCheckIndicator.Color = Color3.new(0, 1, 0)
WallCheckIndicator.Size = 16
WallCheckIndicator.Position = Vector2.new(20, 260)
WallCheckIndicator.Visible = false

local txt = Drawing.new("Text")
txt.Text = "Target: "
txt.Color = Color3.fromRGB(214, 202, 221)
txt.Size = 16.5
txt.Font = 2
txt.Outline = true
txt.Visible = false


local Vec2 = function(property)
    return Vector2.new(property.X, property.Y + (Guis:GetGuiInset().Y))
end



local GetClosestToMouse = function()
    local closestTarget = nil
    local closestDistance = math.huge

    local mousePosition = Vector2.new(Mouse.X, Mouse.Y)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Client and player.Character then
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local screenPosition, onScreen = Camera:WorldToScreenPoint(rootPart.Position)

                if onScreen then
                    local targetPosition = Vector2.new(screenPosition.X, screenPosition.Y)
                    local distance = (targetPosition - mousePosition).Magnitude

                    if distance < Circle.Radius and distance < closestDistance then
                        if wallCheck(player) then 
                            closestDistance = distance
                            closestTarget = player
                        end
                    end
                end
            end
        end
    end

    return closestTarget
end



function TargetChecks(Target)
    if Target.Character and Target.Character:FindFirstChild("BodyEffects") then
        local bodyEffects = Target.Character.BodyEffects
        if bodyEffects:FindFirstChild("K.O") then
            return bodyEffects["K.O"].Value == true
        end
    end
    return false
end

local WTS = function(Object)
    local objectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vector2.new(objectVector.X, objectVector.Y)
end

local IsOnScreen = function(Object)
    local screenPoint = Camera:WorldToScreenPoint(Object.Position)
    return screenPoint.Z > 0  
end

local FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return false
    end
    
    return table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) ~= nil
end


local function CalculateChance(Percentage)
    Percentage = math.clamp(math.floor(Percentage), 0, 100)
    local chance = Random.new():NextNumber(0, 1)
    return chance < (Percentage / 100)
end

local function ClosestTargetAimbotPlr(distanceType)
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player == Client then
            continue
        end

        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not character or not rootPart then
            continue
        end

        local offsetPosition = rootPart.Position
        local screenPos = Camera:WorldToViewportPoint(offsetPosition)
        local magnitude = (Vector2.new(screenPos.X, screenPos.Y) - UserInputService:GetMouseLocation()).Magnitude

        if magnitude < closestDistance then
            closestDistance = magnitude
            closestPlayer = player
        end
    end

    return closestPlayer
end

local function checkKnockout(player)
    if player and player.Character then
        local bodyEffects = player.Character:FindFirstChild("BodyEffects")
        if bodyEffects then
            local ko = bodyEffects:FindFirstChild("KO") or bodyEffects:FindFirstChild("K.O")
            if ko and ko.Value then
                return true
            end
        end
    end
    return false
end




TargetPrediction1 = function() 
    if Pravus.TargetAim.AutoPrediction then 
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
        
        if ping < 10 then
            return 0.11252476
        elseif ping < 20 then
            return 0.1211928
        elseif ping < 30 then
            return 0.1254263
        elseif ping < 40 then
            return 0.11252476
        elseif ping < 50 then
            return 0.13544
        elseif ping < 60 then
            return 0.1264236
        elseif ping < 70 then
            return 0.1400049
        elseif ping < 80 then
            return 0.13581963
        elseif ping < 90 then
            return 0.13873952
        elseif ping < 100 then
            return 0.14173456
        elseif ping < 110 then
            return 0.14362652
        elseif ping < 120 then
            return 0.14683943
        elseif ping < 130 then
            return 0.15175864
        elseif ping < 140 then
            return 0.15382643
        elseif ping < 150 then
            return 0.15873582
        else
            return 0.125
        end
    else
        return tonumber(Pravus.TargetAim.Prediction)
    end
end


local function handleAntiGroundShots(target, isEnabled)
    if isEnabled and target and target.Character then
        local humanoid = target.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Jump and humanoid.FloorMaterial == Enum.Material.Air then
            local rootPart = target.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local velocity = rootPart.Velocity
                local adjustedY = math.abs(velocity.Y * 0.36)
                rootPart.Velocity = Vector3.new(velocity.X, adjustedY, velocity.Z)
                rootPart.AssemblyLinearVelocity = Vector3.new(velocity.X, adjustedY, velocity.Z)
            end
        end
    end
end


RunService.Heartbeat:Connect(function()
    local Misc = Pravus.Misc
    local character = TargetPlayer and TargetPlayer.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    

    local TargetPrediction = TargetPrediction1()





    if isVisible then
        TargetPred.Text = "Target Prediction: " .. tostring(TargetPrediction)
        HP.Text = "Hitpart: " .. tostring(Pravus.TargetAim.HitPart)
    end


if Pravus.TargetAim.Visuals.TargetLabel and TargetPlayer then
    local targetCharacter = TargetPlayer.Character
    if targetCharacter then
        local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
        local rootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
        
        if humanoid and rootPart then
            local targetPos = rootPart.Position
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
            
            if onScreen then
                local health = math.floor(humanoid.Health)
                local maxHealth = math.floor(humanoid.MaxHealth)
                local displayName = TargetPlayer.DisplayName
                
                txt.Visible = true
                txt.Text = string.format("(%s) %d/%d", 
                    displayName,  
                    health, 
                    maxHealth)
                txt.Position = Vector2.new(screenPos.X, screenPos.Y)
            else
                txt.Visible = false
            end
        else
            txt.Visible = false
        end
    else
        txt.Visible = false
    end
else
    txt.Visible = false
   end
end)







    RunService.Heartbeat:Connect(function()
        if TargetPlayer and TargetPlayer.Character then
            local humanoid = TargetPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health < 3 then
                Pravus.TargetAim.HitPart = saved
            else
                Pravus.TargetAim.HitPart = saved
            end
        end
    end)




    local noclipConnection = nil

    local function manageNoClip(enable)
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end

        if enable and Client.Character then
            noclipConnection = RunService.Stepped:Connect(function()
                for _, part in ipairs(Client.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        elseif Client.Character then

            for _, part in ipairs(Client.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end


    local function startStrafe(target)
        manageNoClip(true) 
        

        local char = Client.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        targetHRP = target
        local hrp = char.HumanoidRootPart
        angle = 0
        isStrafing = true

        bodyPos = Instance.new("BodyPosition")
        bodyPos.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bodyPos.P = 20000
        bodyPos.D = 1000
        bodyPos.Position = hrp.Position
        bodyPos.Parent = hrp

        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        bodyGyro.P = 20000
        bodyGyro.CFrame = hrp.CFrame
        bodyGyro.Parent = hrp

        strafeConnection = RunService.RenderStepped:Connect(function(dt)
            if not isStrafing or not targetHRP or not char then return end
            angle += Pravus.TargetStrafe.OrbitSpeed * dt

            local offset = Vector3.new(
                math.cos(angle) * Pravus.TargetStrafe.OrbitRadius,
                Pravus.TargetStrafe.OrbitHeight,
                math.sin(angle) * Pravus.TargetStrafe.OrbitRadius
            )

            local newPos = targetHRP.Position + offset
            bodyPos.Position = newPos
            bodyGyro.CFrame = CFrame.new(newPos, targetHRP.Position + Vector3.new(0, Pravus.TargetStrafe.OrbitHeight, 0))
        end)
    end

    local function stopStrafe()
        manageNoClip(false) 
        

        isStrafing = false
        targetHRP = nil

        if strafeConnection then
            strafeConnection:Disconnect()
            strafeConnection = nil
        end

        if bodyPos then
            bodyPos:Destroy()
            bodyPos = nil
        end

        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end
    end



    Mouse.KeyDown:Connect(function(Key)
        local upperKey = Key:upper()
        
        if upperKey == Pravus.TargetAim.KeyBind:upper() then
            if Pravus.TargetAim.Enabled then
                On2 = not On2
                if On2 then
                    TargetPlayer = ClosestTargetAimbotPlr()
                    if TargetPlayer and TargetPlayer.Character and Pravus.TargetStrafe.Enabled then
                        startStrafe(TargetPlayer.Character.HumanoidRootPart)
                    end
                else
                    TargetPlayer = nil
                    stopStrafe()
                end
            end
        end
    end)

RunService.Heartbeat:Connect(function()
    if not Pravus.TargetAim.Visuals.Tracer then
        Line.Visible = false
        return
    end

    Line.Color = Color3.fromRGB(214, 202, 221)  
    
    if TargetPlayer and TargetPlayer.Character then
        local targetPart = TargetPlayer.Character:FindFirstChild(Pravus.TargetAim.HitPart)
        if targetPart then
            local predictedPosition = targetPart.Position + (targetPart.Velocity * Pravus.TargetAim.Prediction)
            local screenPosition, onScreen = Camera:WorldToViewportPoint(predictedPosition)
            
            if onScreen then
                Line.From = UserInputService:GetMouseLocation()
                Line.To = Vector2.new(screenPosition.X, screenPosition.Y)
                Line.Visible = true
            else
                Line.Visible = false
            end
        else
            Line.Visible = false
        end
    else
        Line.Visible = false
    end
end)



local highlightInstance = nil

RunService.Heartbeat:Connect(function()

    if not Pravus.TargetAim.Visuals.Highlight or not TargetPlayer then
        if highlightInstance then
            highlightInstance:Destroy()
            highlightInstance = nil
        end
        return
    end


    if TargetPlayer.Character and not highlightInstance then
        highlightInstance = Instance.new("Highlight")
        highlightInstance.Parent = TargetPlayer.Character
        highlightInstance.Name = "PravusTargetHighlight"
        highlightInstance.FillColor = Color3.fromRGB(214, 202, 221)
        highlightInstance.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlightInstance.FillTransparency = 0.5
        highlightInstance.OutlineTransparency = 0
        highlightInstance.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    elseif highlightInstance and TargetPlayer.Character and highlightInstance.Parent ~= TargetPlayer.Character then

        highlightInstance.Parent = TargetPlayer.Character
    end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    if highlightInstance then
        highlightInstance:Destroy()
        highlightInstance = nil
    end
end)



local TargetDot = Drawing.new("Circle")
TargetDot.Color = Color3.new(214, 202, 221)
TargetDot.Thickness = 1.5
TargetDot.Radius = 4
TargetDot.Filled = true
TargetDot.Visible = false


RunService.Heartbeat:Connect(function()
    if Pravus.TargetAim.Visuals.Dot and TargetPlayer and TargetPlayer.Character then
        local hitPart = TargetPlayer.Character:FindFirstChild(Pravus.TargetAim.HitPart)
        if hitPart then
            local screenPos, onScreen = Camera:WorldToViewportPoint(hitPart.Position)
            if onScreen then
                TargetDot.Position = Vector2.new(screenPos.X, screenPos.Y)
                TargetDot.Visible = true
            else
                TargetDot.Visible = false
            end
        else
            TargetDot.Visible = false
        end
    else
        TargetDot.Visible = false
    end
end)

RunService.Heartbeat:Connect(function()
    local ResolvePlayers = TargetPlayer or prey or prey2
    
    if Pravus.TargetAim.Enabled and ResolvePlayers then
        local character = ResolvePlayers.Character
        if character then
            local HitPartName = Pravus.TargetAim.HitPart
            local targetPart = character:FindFirstChild(HitPartName)
            local humanoid = character:FindFirstChild("Humanoid")
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            

        end
    end
end)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")


local function GetClosestBodyPart(character)
    local closestDistance = math.huge
    local closestBodyPart = nil

    if character and character:GetChildren() then
        for _, child in ipairs(character:GetChildren()) do
            if FilterObjs(child) and IsOnScreen(child) then
                local distance = (WTS(child) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

                if distance < closestDistance then
                    closestDistance = distance
                    closestBodyPart = child
                end
            end
        end
    end

    return closestBodyPart
end







for Key, Object in pairs(getgc(true)) do
    if type(Object) == "table" then
        setreadonly(Object, false)
        local indexInstance = rawget(Object, "indexInstance")
        if type(indexInstance) == "table" and indexInstance[1] == "kick" then
            setreadonly(indexInstance, false)
            rawset(Object, "Table", {"kick", function() coroutine.yield() end})
            break
        end
    end
end


local grmt = getrawmetatable(game)
local originalIndex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    local targetAimbot = Pravus.TargetAim
    if targetAimbot and targetAimbot.Enabled and Mouse then
        local propertyName = tostring(v)
        if propertyName == "Hit" or propertyName == "Target" then
            local HitPart = targetAimbot.HitPart
            local aimPrediction = targetAimbot.Prediction
            local target = TargetPlayer
            if target and target.Character then
                local HitPartObject = target.Character:FindFirstChild(HitPart)
                if HitPartObject and HitPartObject:IsA("BasePart") then
                    local predictedPosition = HitPartObject.Position + (HitPartObject.AssemblyLinearVelocity * aimPrediction)
                    if propertyName == "Hit" then
                        return CFrame.new(predictedPosition)
                    elseif propertyName == "Target" then
                        return HitPartObject
                    end
                end
            end
        end
    end
    return originalIndex(self, v)
end)

setreadonly(grmt, true)




if getgenv().Pravus and getgenv().Pravus.MouseTp and getgenv().Pravus.MouseTp.Enabled then
    local isLocking, targetPlayer = false, nil
    local runService = game:GetService("RunService")
    local camera = workspace.CurrentCamera
    local heartbeatConnection = nil

    local function updateMouseTp()
        if not isLocking or not targetPlayer or not targetPlayer.Character then
            return
        end

        local targetData = getgenv().Pravus.MouseTp
        if not targetData then 
            return 
        end

        local character = targetPlayer.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then 
            return 
        end
        
        local targetPart = character:FindFirstChild(targetData.Part or "HumanoidRootPart")
        if not targetPart then 
            return 
        end

        local alpha = targetData.Smoothness or 0.1
        local prediction = targetData.Prediction or 0.15
        
        local goalPosition = targetPart.Position + (targetPart.Velocity * prediction)
        local goalCFrame = CFrame.lookAt(camera.CFrame.Position, goalPosition)
        
        camera.CFrame = camera.CFrame:Lerp(
            goalCFrame, 
            math.clamp(alpha * runService.Heartbeat:Wait(), 0, 1)
        )
    end

    local function startLocking(player)
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
        end
        
        isLocking = true
        targetPlayer = player
        
        heartbeatConnection = runService.Heartbeat:Connect(function()
            pcall(updateMouseTp)
        end)
    end

    local function stopLocking()
        isLocking = false
        targetPlayer = nil
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
    end
end




if Pravus.Spin.Enabled then
    local Toggle = false
    local RotationSpeed = Pravus.Spin.Speed
    local Keybind = Enum.KeyCode[Pravus.Spin.Keybind]

    local function OnKeyPress(Input, GameProcessedEvent)
        if Input.KeyCode == Keybind and not GameProcessedEvent then 
            Toggle = not Toggle
        end
    end

    local inputConn = UserInputService.InputBegan:Connect(OnKeyPress)
    table.insert(Pravus_Connections, inputConn)

    local LastRenderTime = tick()
    local TotalRotation = 0

    local function RotateCamera()
        if Toggle then
            local CurrentTime = tick()
            local TimeDelta = math.min(CurrentTime - LastRenderTime, 0.01)
            LastRenderTime = CurrentTime

            local RotationAngle = RotationSpeed * TimeDelta
            local Rotation = CFrame.Angles(0, math.rad(RotationAngle), 0)
            Camera.CFrame = Camera.CFrame * Rotation

            TotalRotation = TotalRotation + RotationAngle
            if TotalRotation >= 360 then 
                Toggle = false
                TotalRotation = 0
            end
        end
    end

    local spinConn = RunService.RenderStepped:Connect(RotateCamera)
    table.insert(Pravus_Connections, spinConn)
end

do
    local function showNotification(title, text)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 3,
            Icon = "rbxassetid://6726674666"
        })
    end

    local lastShotTime = 0
    
    table.insert(Pravus_Connections, UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode[getgenv().Pravus.Triggerbot.Keybind] then
            getgenv().Pravus.Triggerbot.Enabled = not getgenv().Pravus.Triggerbot.Enabled
            showNotification("Triggerbot", getgenv().Pravus.Triggerbot.Enabled and "Enabled" or "Disabled")
        end
    end))

    table.insert(Pravus_Connections, RunService.RenderStepped:Connect(function()
        if not getgenv().Pravus.Triggerbot.Enabled then return end
        
        local currentTime = tick()
        if currentTime - lastShotTime < tonumber(getgenv().Pravus.Triggerbot.Delay) then return end
        
        local Target = Mouse.Target
        if Target and Target:FindFirstAncestorOfClass("Model") then
            local model = Target:FindFirstAncestorOfClass("Model")
            if model:FindFirstChild("HumanoidRootPart") then
                mouse1click()
                lastShotTime = currentTime
            end
        end
    end))
end

if Pravus.Textures.Enabled then
    local materialEnum = Enum.Material[Pravus.Textures.Material] or Enum.Material.Plastic
    
    local function processPart(part)
        if part:IsA("BasePart") and not part.Parent:FindFirstChildOfClass("Humanoid") then
            part.Material = materialEnum
            
            if Pravus.Textures.UseColor then
                part.Color = Pravus.Textures.Color
            end
            
            if part:IsA("Texture") then
                part:Destroy()
            end
        end
    end

    for _, v in pairs(Workspace:GetDescendants()) do
        pcall(processPart, v)
    end

    table.insert(Pravus_Connections, Workspace.DescendantAdded:Connect(function(v)
        pcall(processPart, v)
    end))
end



-- New example written by wally


if getgenv().Pravus.StartUp.Enabled and getgenv().Pravus.StartUp['UI Type'] == "Linoria" then
local repo = 'https://github.com/CatalystWinning/Catalyst/blob/main/'

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatalystWinning/Catalyst/refs/heads/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatalystWinning/Catalyst/refs/heads/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatalystWinning/Catalyst/refs/heads/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = '                            Pravus                               ', 
    TitleAlign = Enum.TextXAlignment.Center, 
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.1
})

-- CALLBACK NOTE:
-- Passing in callback functions via the initial element parameters (i.e. Callback = function(Value)...) works
-- HOWEVER, using Toggles/Options.INDEX:OnChanged(function(Value) ... ) is the RECOMMENDED way to do this.
-- I strongly recommend decoupling UI code from logic code. i.e. Create your UI elements FIRST, and THEN setup :OnChanged functions later.

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Legit'),
    Main2 = Window:AddTab('Rage'),
    Players = Window:AddTab('Misc'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}


local Left = Tabs.Main:AddLeftGroupbox('Silent')
local Right = Tabs.Main:AddRightGroupbox('Camlock')
local trig = Tabs.Main:AddRightGroupbox('TriggerBot')
local mou = Tabs.Main:AddLeftGroupbox('Mouse Tp')
local Target = Tabs.Main2:AddLeftGroupbox('Target Aim')
local Ts = Tabs.Main2:AddRightGroupbox('Target Strafe')
local Tv = Tabs.Main2:AddRightGroupbox('Target Visuals')
local chec = Tabs.Players:AddLeftGroupbox('Checks')
local speed = Tabs.Players:AddRightGroupbox('WalkSpeed')
local Rj = Tabs.Players:AddRightGroupbox('General 1')
local Fp = Tabs.Players:AddLeftGroupbox('General 2') 
local Tg = Tabs.Players:AddLeftGroupbox('Other Players') 
local Vs = Tabs.Visuals:AddLeftGroupbox('Visuals') 
local Vd = Tabs.Visuals:AddRightGroupbox('Fog')

    local bC = nil
    local t = 0.5
    local bM = Enum.Material.ForceField
    local bPN = {
        "UpperTorso", "HumanoidRootPart", "LowerTorso",
        "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
        "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
        "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
    }
    local sCE = false
    local oP = {}
    
    local function applyChamsToPart(part)
        if part:IsA("BasePart") then
            if not oP[part] then
                oP[part] = {
                    Transparency = part.Transparency,
                    Material = part.Material,
                    Color = part.Color
                }
            end
            
            if part.Parent ~= LocalPlayer.Character then
                local isDescendantOfTool = false
                local current = part
                while current.Parent do
                    if current.Parent:IsA("Tool") then
                        isDescendantOfTool = true
                        break
                    end
                    current = current.Parent
                end
                
                if not isDescendantOfTool then
                    if part.Name == "HumanoidRootPart" then
                        part.Transparency = sCE and 1 or oP[part].Transparency
                    elseif part.Name == "Head" or part.Name == "Hair" or table.find(bPN, part.Name) then
                        if sCE then
                            part.Material = bM
                            part.Transparency = t
                            part.Color = bC
                        else
                            part.Material = oP[part].Material
                            part.Transparency = oP[part].Transparency
                            part.Color = oP[part].Color
                        end
                    end
                end
            end
        end
    end
    
    local function cB()
        local characters = Players:GetPlayers()
        for _, player in ipairs(characters) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        applyChamsToPart(part)
                    end
                end
            end
        end
    end
    
    local function rOA()
        for part, props in pairs(oP) do
            if part:IsA("BasePart") then
                part.Transparency = props.Transparency
                part.Material = props.Material
                part.Color = props.Color
            end
        end
        oP = {}
    end
    
    Vs:AddToggle('', {
        Text = 'Chams',
        Default = false,
        Callback = function(Value)
            sCE = Value
            if sCE then
                cB()
            else
                rOA()
            end
        end
    }):AddColorPicker('', {
        Default = Color3.fromRGB(0, 255, 79),
        Transparency = nil,
        Callback = function(Value)
            bC = Value
            if sCE then
                cB()
            end
        end
    })

    local transparency = 0.5
    local bodyColor = Color3.fromRGB(0, 170, 255)
    local gunColor = Color3.fromRGB(0, 170, 255)
    local barrierMaterial = Enum.Material.ForceField
    
    local bodyPartNames = {
        "UpperTorso", "LowerTorso",
        "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
        "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
        "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
    }
    
    local selfChamsEnabled = false
    local gunChamsEnabled = false
    local originalProperties = {}
    
    local function applyChamsToPart(part)
        if part:IsA("BasePart") then
            if not originalProperties[part] then
                originalProperties[part] = {
                    Transparency = part.Transparency,
                    Material = part.Material,
                    Color = part.Color
                }
            end
            
            if part.Parent == LocalPlayer.Character then
                if part.Name == "HumanoidRootPart" or part.Name == "Head" then
                    part.Transparency = 1
                elseif table.find(bodyPartNames, part.Name) then
                    part.Material = barrierMaterial
                    part.Transparency = transparency
                    part.Color = bodyColor
                end
            end
        end
    end
    
    local function createBarrier()
        local character = LocalPlayer.Character
        if character and selfChamsEnabled then
            for _, part in ipairs(character:GetDescendants()) do
                applyChamsToPart(part)
            end
        end
    end
    
    local function applyChamsToTool(tool)
        if gunChamsEnabled then
            for _, part in ipairs(tool:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = barrierMaterial
                    part.Transparency = transparency
                    part.Color = gunColor
                    if part.Name == "Handle" then
                        part.Transparency = 1
                    end
                end
            end
        end
    end
    
    local function restoreOriginalAppearance()
        for part, props in pairs(originalProperties) do
            if part:IsA("BasePart") then
                part.Transparency = props.Transparency
                part.Material = props.Material
                part.Color = props.Color
            end
        end
        originalProperties = {}
    end
    
    local function onToolAdded(tool)
        if tool:IsA("Tool") then
            applyChamsToTool(tool)
        end
    end
    
    LocalPlayer.CharacterAdded:Connect(createBarrier)
    LocalPlayer.Backpack.ChildAdded:Connect(onToolAdded)
    
    if LocalPlayer.Character then
        createBarrier()
    end
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        onToolAdded(tool)
    end
    

    Vs:AddToggle('', {
        Text = 'Self Chams',
        Default = false,
        Callback = function(Value)
            selfChamsEnabled = Value
            if selfChamsEnabled then
                createBarrier()
            else
                restoreOriginalAppearance()
            end
        end
    })
    :AddColorPicker('', {
        Default = bodyColor,
        Transparency = nil,
        Callback = function(Value)
            bodyColor = Value
            if selfChamsEnabled then
                createBarrier()
            end
        end
    })

    Vd:AddLabel('Fog Color'):AddColorPicker('FogColorR', {
        Default = Color3.fromRGB(100, 87, 72), -- Bright green
        Title = 'Fog Color', -- Optional. Allows you to have a custom color picker title (when you open it)
        Transparency = nil, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)
    
        Callback = function(Value)
        end
    })
    
    Options.FogColorR:OnChanged(function()
        game:GetService("Lighting").FogColor = Options.FogColorR.Value
    end)
    
    Vd:AddSlider('FogEnd', {
        Text = 'Fog Distance',
        Default = 800,
        Min = 25,
        Max = 5000,
        Rounding = 1,
        Compact = true, 
    })
    
    Options.FogEnd:OnChanged(function()
        game:GetService("Lighting").FogEnd = Options.FogEnd.Value
    end)

chec:AddToggle('MyToggle', {
    Text = 'KOCheck',
    Default = getgenv().Pravus.Checks.KOCheck, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.KOCheck = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'WallCheck',
    Default = getgenv().Pravus.Checks.WallCheck, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.WallCheck = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'SelfDeath',
    Default = getgenv().Pravus.Checks.SelfDeath, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.SelfDeath = Value
    end
})



Fp:AddToggle('MyToggle', {
    Text = 'Fps Unlocker',
    Default = getgenv().Pravus.FPS.FPSUnlocker, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.FPS.FPSUnlocker = Value
    end
})

Fp:AddSlider('MySlider', {
    Text = 'Limit',
    Default = getgenv().Pravus.FPS.Limit,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.FPS.Limit = Value
    end
})




speed:AddToggle('MyToggle', {
    Text = 'WalkSpeed',
    Default = getgenv().Pravus.WalkSpeed.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Enabled = Value
    end
})

speed:AddInput('MyTextbox', {
    Default = getgenv().Pravus.WalkSpeed.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'WalkSpeed Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Keybind = Value
    end
})

speed:AddSlider('MySlider', {
    Text = 'Speed',
    Default = getgenv().Pravus.WalkSpeed.Speed,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Speed = Value
    end
})
Rj:AddButton({
    Text = 'Rejoin Server',
    Func = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
    DoubleClick = false
})
Rj:AddButton({
    Text = 'Server Hop',
    Toolbox = 'Doesnt Work (Currently)',
    Func = function()
        local servers = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=10")
        local serverData = HttpService:JSONDecode(servers)
        local server = serverData.data[math.random(1, #serverData.data)]
        TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id)
    end,
    DoubleClick = false
})

    local SeatsRemoved = false
    local SeatStorage = {}
    
    local function RemoveSeats()
        local parts = Workspace:GetDescendants()
        for _, part in ipairs(parts) do
            if part:IsA("Seat") then
                table.insert(SeatStorage, part:Clone())
                part:Destroy()
            end
        end
        SeatsRemoved = true
    end
    
    local function ReturnSeats()
        for _, seat in ipairs(SeatStorage) do
            seat.Parent = Workspace
        end
        SeatStorage = {}
        SeatsRemoved = false
    end
    
    Rj:AddButton({
        Text = 'Remove Seats',
        Func = function()
            if SeatsRemoved then
                ReturnSeats()
            else
                RemoveSeats()
            end
        end,
        DoubleClick = false
    })

    local colorCorrectionEffect = nil
    local isColorCorrectionEnabled = false
    
    Rj:AddButton({
        Text = 'Color Correction',
        Func = function()
            local l = game:GetService("Lighting")
            
            if isColorCorrectionEnabled then
                if colorCorrectionEffect then
                    colorCorrectionEffect:Destroy()
                    colorCorrectionEffect = nil
                end
                isColorCorrectionEnabled = false
            else
                colorCorrectionEffect = Instance.new("ColorCorrectionEffect", l)
                colorCorrectionEffect.Brightness = 0
                colorCorrectionEffect.Contrast = 0.01
                colorCorrectionEffect.Saturation = 0.67
                isColorCorrectionEnabled = true
            end
        end,
        DoubleClick = false
    })
    local originalFogEnd = game.Lighting.FogEnd
    local originalFogStart = game.Lighting.FogStart
    local originalOutdoorAmbient = game.Lighting.OutdoorAmbient
    
    local isFogDisabled = false
    
    Rj:AddButton({
        Text = 'No Fog',
        Func = function()
            if isFogDisabled then
                game.Lighting.FogEnd = originalFogEnd
                game.Lighting.FogStart = originalFogStart
                game.Lighting.OutdoorAmbient = originalOutdoorAmbient
                isFogDisabled = false
            else
                originalFogEnd = game.Lighting.FogEnd
                originalFogStart = game.Lighting.FogStart
                originalOutdoorAmbient = game.Lighting.OutdoorAmbient
                
                game.Lighting.FogEnd = 50
                game.Lighting.FogStart = 10
                game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 255, 79)
                isFogDisabled = true
            end
        end,
        DoubleClick = false
    })

    local Auto_Stomp = false
    Rj:AddToggle('', {
        Text = 'Auto Stomp',
        Default = false,
        Callback = function(bool)
            Auto_Stomp = bool
            if Auto_Stomp then
                spawn(function()
                    while Auto_Stomp do
                        ME:FireServer(EventN)
                        wait(0.1)
                    end
                end)
            end
        end
    })

    Rj:AddToggle('', {
        Text = 'Anti Slow',
        Default = false,
        Callback = function(val)
            getgenv().x = val
            if getgenv().x == true then
                local player = game.Players.LocalPlayer
                local character = player.Character
                local bodyEffects = character:WaitForChild("BodyEffects")
                local movement = bodyEffects:WaitForChild("Movement")
    
                local DeletePart = movement:FindFirstChild('NoJumping') or movement:FindFirstChild('ReduceWalk') or movement:FindFirstChild('NoWalkSpeed')
                if DeletePart then
                    DeletePart:Destroy()
                end
    
                if bodyEffects.Reload.Value then
                    bodyEffects.Reload.Value = false
                end
            end
        end
    })
    local AntiStompEnabled = false
    local AntiStompPos = nil
    
    Rj:AddToggle('', {
        Text = 'Anti Stomp',
        Default = false,
        Callback = function(Value)
            AntiStompEnabled = Value
            if AntiStompEnabled then
                while wait(1) do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local humanoid = LocalPlayer.Character.Humanoid
                        if humanoid.Health < 5 then
                            for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    descendant:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    Rj:AddButton({
        Text = 'No Delay',
        Func = function()
            local bulletHole = CorePackages:FindFirstChild("BulletHole")
            if bulletHole then
                bulletHole:Destroy()
            end
            if ReplicatedStorage.BulletHole and ReplicatedStorage.BulletHole:FindFirstChild("Delay") then
                ReplicatedStorage.BulletHole.Delay.Position = 0
            end
        end,
        DoubleClick = false
    })




    Rj:AddSlider('', {
        Text = 'FOV (in game)',
        Default = 70,
        Min = 70,
        Max = 160,
        Rounding = 0,
        Compact = true,
        Callback = function(value)
            game.Workspace.CurrentCamera.FieldOfView = value
        end
    })

    local SelectedTarget = nil
    local TargetLabel = Tg:AddLabel('Selected Target: None')
    
    local function UpdateLabel(player)
        local LabelText = 'Selected Target: ' .. (player and player.Name or 'None')
        TargetLabel:SetText(LabelText)
    end
    
    Tg:AddInput('', {
        Default = '',
        Numeric = false,
        Finished = false,
        Text = 'Search Players',
        Placeholder = 'Click to Search Target',
        Callback = function(searchQuery)
            searchQuery = searchQuery:lower()
    
            local function FindPlayer(query)
                if query == '' then
                    return nil
                end
                
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and (player.Name:lower():find(query, 1, true) or (player.DisplayName and player.DisplayName:lower():find(query, 1, true))) then
                        return player
                    end
                end
                return nil
            end
            
            local player = FindPlayer(searchQuery)
            
            if player then
                SelectedTarget = player
                UpdateLabel(player)
            else
                SelectedTarget = nil
                UpdateLabel(nil)
            end
        end
    })
    
    local originalCameraType
    local originalCameraSubject
    
    local function toggleView(enable)
        local humanoid = SelectedTarget.Character.Humanoid
    
        if enable and humanoid then
            originalCameraType = CurrentCamera.CameraType
            originalCameraSubject = CurrentCamera.CameraSubject
            CurrentCamera.CameraSubject = humanoid
        elseif originalCameraType and originalCameraSubject then
            CurrentCamera.CameraType = originalCameraType
            CurrentCamera.CameraSubject = originalCameraSubject
        end
    end
    

    Tg:AddButton({
        Text = 'Goto',
        Func = function()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame
                end
            end
        end,
        DoubleClick = false
    })

chec:AddToggle('MyToggle', {
    Text = 'AntiAimViewer',
    Default = getgenv().Pravus.Checks.AntiAimViewer, 
    Tooltip = 'Silent Aim', 

    Callback = function(Value)
        getgenv().Pravus.Checks.AntiAimViewer = Value
    end
})

Right:AddToggle('MyToggle', {
    Text = 'Camlock',
    Default = getgenv().Pravus.Camlock.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.Enabled = Value
    end
})

Right:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.Camlock.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.AutoPrediction = Value
    end
})

Right:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.Camlock.Part, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.Part = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Camlock Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Keybind = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Prediction', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Prediction = Value
    end
})


Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.JumpOffset,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'JumpOffset',
    Tooltip = 'JumpOffset', -- Information shown when you hover over the textbox

    Placeholder = 'JumpOffset', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.JumpOffset = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Smoothness,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'smoothing',
    Tooltip = 'Smoothness', -- Information shown when you hover over the textbox

    Placeholder = 'smooth', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Smoothness = Value
    end
})


mou:AddToggle('MyToggle', {
    Text = 'MouseTp',
    Default = getgenv().Pravus.MouseTp.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
getgenv().Pravus.MouseTp.Enabled = Value
    end
})

mou:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.MouseTp.Part, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.MouseTp.Part = Value
    end
})
mou:AddInput('MyTextbox', {
    Default = getgenv().Pravus.MouseTp.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Prediction', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.MouseTp.Prediction = Value
    end
})


mou:AddInput('MyTextbox', {
    Default = getgenv().Pravus.MouseTp.Smoothness,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'smoothing',
    Tooltip = 'Smoothness', -- Information shown when you hover over the textbox

    Placeholder = 'smooth', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.MouseTp.Smoothness = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'Silent aim',
    Default = getgenv().Pravus.SilentAim.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.Enabled = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'NearestPoint',
    Default = getgenv().Pravus.SilentAim.NearestPoint, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.NearestPoint = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.SilentAim.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.AutoPrediction = Value
    end
})

Left:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.SilentAim.HitPart, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.HitPart = Value
    end
})


Left:AddInput('MyTextbox', {
    Default = getgenv().Pravus.SilentAim.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.SilentAim.Prediction = Value
    end
})


Left:AddToggle('MyToggle', {
    Text = 'Show Fov ',
    Default = getgenv().Pravus.SilentAim.FOV.Visible, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.FOV.Visible = Value
    end
})
Left:AddSlider('MySlider', {
    Text = 'Radius',
    Default = getgenv().Pravus.SilentAim.FOV.Radius,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.SilentAim.FOV.Radius = Value
    end
})

trig:AddToggle('MyToggle', {
    Text = 'Enable Triggerbot',
    Default = getgenv().Pravus.Triggerbot.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Enabled = Value
    end
})

trig:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Triggerbot.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Triggerbot Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Keybind = Value
    end
})


trig:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Triggerbot.Delay,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Triggerbot Delay',
    Tooltip = 'Delay', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Delay = Value
    end
})

Target:AddToggle('MyToggle', {
    Text = 'Enable TargetAim',
    Default = getgenv().Pravus.TargetAim.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Enabled = Value
    end
})


Target:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.TargetAim.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.AutoPrediction = Value
    end
})

Target:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.TargetAim.HitPart, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.HitPart = Value
    end
})

Target:AddInput('MyTextbox', {
    Default = getgenv().Pravus.TargetAim.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.TargetAim.Prediction = Value
    end
})



Target:AddInput('MyTextbox', {
    Default = getgenv().Pravus.TargetAim.KeyBind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'TargetAim Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.TargetAim.KeyBind = Value
    end
})


Tv:AddToggle('MyToggle', {
    Text = 'TargetLabel',
    Default = getgenv().Pravus.TargetAim.Visuals.TargetLabel, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.TargetLabel = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Tracer',
    Default = getgenv().Pravus.TargetAim.Visuals.Tracer, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Tracer = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'HighLight',
    Default = getgenv().Pravus.TargetAim.Visuals.Highlight, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Highlight = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Dot',
    Default = getgenv().Pravus.TargetAim.Visuals.Dot, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Dot = Value
    end
})

Ts:AddToggle('MyToggle', {
    Text = 'TargetStrafe',
    Default = getgenv().Pravus.TargetStrafe.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.Enabled = Value
    end
})



Ts:AddSlider('MySlider', {
    Text = 'Distance',
    Default = getgenv().Pravus.TargetStrafe.OrbitRadius,
    Min = 0,
    Max = 21,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitRadius = Value
    end
})

Ts:AddSlider('MySlider', {
    Text = 'Height',
    Default = getgenv().Pravus.TargetStrafe.OrbitHeight,
    Min = 0,
    Max = 21,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitHeight = Value
    end
})

Ts:AddSlider('MySlider', {
    Text = 'Speed',
    Default = getgenv().Pravus.TargetStrafe.OrbitSpeed,
    Min = 0,
    Max = 22,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitSpeed = Value
    end
})

--        getgenv().Pravus.Triggerbot.Keybind = Value











Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
-- SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
-- SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('Pravus')
SaveManager:SetFolder('Pravus/Dahood')

SaveManager:BuildConfigSection(Tabs['UI Settings'])


ThemeManager:ApplyToTab(Tabs['UI Settings'])


SaveManager:LoadAutoloadConfig()
end


-- New example written by wally


if getgenv().Pravus.StartUp.Enabled and getgenv().Pravus.StartUp['UI Type'] == "Custom Linoria" then
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false -- Forces AddToggle to AddCheckbox
Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)


local Window = Library:CreateWindow({
    Title = '                            Pravus.lua                              ', 
    TitleAlign = Enum.TextXAlignment.Center, 
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.1
})

-- CALLBACK NOTE:
-- Passing in callback functions via the initial element parameters (i.e. Callback = function(Value)...) works
-- HOWEVER, using Toggles/Options.INDEX:OnChanged(function(Value) ... ) is the RECOMMENDED way to do this.
-- I strongly recommend decoupling UI code from logic code. i.e. Create your UI elements FIRST, and THEN setup :OnChanged functions later.

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Legit'),
    Main2 = Window:AddTab('Rage'),
    Players = Window:AddTab('Misc'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}


local Left = Tabs.Main:AddLeftGroupbox('Silent')
local Right = Tabs.Main:AddRightGroupbox('Camlock')
local mou = Tabs.Main:AddLeftGroupbox('Mouse Tp')
local trig = Tabs.Main:AddRightGroupbox('TriggerBot')
local Target = Tabs.Main2:AddLeftGroupbox('Target Aim')
local Ts = Tabs.Main2:AddRightGroupbox('Target Strafe')
local Tv = Tabs.Main2:AddRightGroupbox('Target Visuals')
local chec = Tabs.Players:AddLeftGroupbox('Checks')
local speed = Tabs.Players:AddRightGroupbox('WalkSpeed')
local Rj = Tabs.Players:AddRightGroupbox('General 1') 
local Fp = Tabs.Players:AddLeftGroupbox('General 2') 
local Tg = Tabs.Players:AddLeftGroupbox('Other Players') 
local Vs = Tabs.Visuals:AddLeftGroupbox('Visuals') 
local Vd = Tabs.Visuals:AddRightGroupbox('Fog')


    local bC = nil
    local t = 0.5
    local bM = Enum.Material.ForceField
    local bPN = {
        "UpperTorso", "HumanoidRootPart", "LowerTorso",
        "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
        "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
        "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
    }
    local sCE = false
    local oP = {}
    
    local function applyChamsToPart(part)
        if part:IsA("BasePart") then
            if not oP[part] then
                oP[part] = {
                    Transparency = part.Transparency,
                    Material = part.Material,
                    Color = part.Color
                }
            end
            
            if part.Parent ~= LocalPlayer.Character then
                local isDescendantOfTool = false
                local current = part
                while current.Parent do
                    if current.Parent:IsA("Tool") then
                        isDescendantOfTool = true
                        break
                    end
                    current = current.Parent
                end
                
                if not isDescendantOfTool then
                    if part.Name == "HumanoidRootPart" then
                        part.Transparency = sCE and 1 or oP[part].Transparency
                    elseif part.Name == "Head" or part.Name == "Hair" or table.find(bPN, part.Name) then
                        if sCE then
                            part.Material = bM
                            part.Transparency = t
                            part.Color = bC
                        else
                            part.Material = oP[part].Material
                            part.Transparency = oP[part].Transparency
                            part.Color = oP[part].Color
                        end
                    end
                end
            end
        end
    end
    
    local function cB()
        local characters = Players:GetPlayers()
        for _, player in ipairs(characters) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        applyChamsToPart(part)
                    end
                end
            end
        end
    end
    
    local function rOA()
        for part, props in pairs(oP) do
            if part:IsA("BasePart") then
                part.Transparency = props.Transparency
                part.Material = props.Material
                part.Color = props.Color
            end
        end
        oP = {}
    end
    
    Vs:AddToggle('', {
        Text = 'Chams',
        Default = false,
        Callback = function(Value)
            sCE = Value
            if sCE then
                cB()
            else
                rOA()
            end
        end
    }):AddColorPicker('', {
        Default = Color3.fromRGB(0, 255, 79),
        Transparency = nil,
        Callback = function(Value)
            bC = Value
            if sCE then
                cB()
            end
        end
    })

    local transparency = 0.5
    local bodyColor = Color3.fromRGB(0, 170, 255)
    local gunColor = Color3.fromRGB(0, 170, 255)
    local barrierMaterial = Enum.Material.ForceField
    
    local bodyPartNames = {
        "UpperTorso", "LowerTorso",
        "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
        "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
        "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
    }
    
    local selfChamsEnabled = false
    local gunChamsEnabled = false
    local originalProperties = {}
    
    local function applyChamsToPart(part)
        if part:IsA("BasePart") then
            if not originalProperties[part] then
                originalProperties[part] = {
                    Transparency = part.Transparency,
                    Material = part.Material,
                    Color = part.Color
                }
            end
            
            if part.Parent == LocalPlayer.Character then
                if part.Name == "HumanoidRootPart" or part.Name == "Head" then
                    part.Transparency = 1
                elseif table.find(bodyPartNames, part.Name) then
                    part.Material = barrierMaterial
                    part.Transparency = transparency
                    part.Color = bodyColor
                end
            end
        end
    end
    
    local function createBarrier()
        local character = LocalPlayer.Character
        if character and selfChamsEnabled then
            for _, part in ipairs(character:GetDescendants()) do
                applyChamsToPart(part)
            end
        end
    end
    
    local function applyChamsToTool(tool)
        if gunChamsEnabled then
            for _, part in ipairs(tool:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = barrierMaterial
                    part.Transparency = transparency
                    part.Color = gunColor
                    if part.Name == "Handle" then
                        part.Transparency = 1
                    end
                end
            end
        end
    end
    
    local function restoreOriginalAppearance()
        for part, props in pairs(originalProperties) do
            if part:IsA("BasePart") then
                part.Transparency = props.Transparency
                part.Material = props.Material
                part.Color = props.Color
            end
        end
        originalProperties = {}
    end
    
    local function onToolAdded(tool)
        if tool:IsA("Tool") then
            applyChamsToTool(tool)
        end
    end
    
    LocalPlayer.CharacterAdded:Connect(createBarrier)
    LocalPlayer.Backpack.ChildAdded:Connect(onToolAdded)
    
    if LocalPlayer.Character then
        createBarrier()
    end
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        onToolAdded(tool)
    end
    

    Vs:AddToggle('', {
        Text = 'Self Chams',
        Default = false,
        Callback = function(Value)
            selfChamsEnabled = Value
            if selfChamsEnabled then
                createBarrier()
            else
                restoreOriginalAppearance()
            end
        end
    })
    :AddColorPicker('', {
        Default = bodyColor,
        Transparency = nil,
        Callback = function(Value)
            bodyColor = Value
            if selfChamsEnabled then
                createBarrier()
            end
        end
    })

    Vd:AddLabel('Fog Color'):AddColorPicker('FogColorR', {
        Default = Color3.fromRGB(100, 87, 72), -- Bright green
        Title = 'Fog Color', -- Optional. Allows you to have a custom color picker title (when you open it)
        Transparency = nil, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)
    
        Callback = function(Value)
        end
    })
    
    Options.FogColorR:OnChanged(function()
        game:GetService("Lighting").FogColor = Options.FogColorR.Value
    end)
    
    Vd:AddSlider('FogEnd', {
        Text = 'Fog Distance',
        Default = 800,
        Min = 25,
        Max = 5000,
        Rounding = 1,
        Compact = true, 
    })
    
    Options.FogEnd:OnChanged(function()
        game:GetService("Lighting").FogEnd = Options.FogEnd.Value
    end)

chec:AddToggle('MyToggle', {
    Text = 'KOCheck',
    Default = getgenv().Pravus.Checks.KOCheck, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.KOCheck = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'WallCheck',
    Default = getgenv().Pravus.Checks.WallCheck, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.WallCheck = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'AntiAimViewer',
    Default = getgenv().Pravus.Checks.AntiAimViewer, 
    Tooltip = 'Silent Aim', 

    Callback = function(Value)
        getgenv().Pravus.Checks.AntiAimViewer = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'SelfDeath',
    Default = getgenv().Pravus.Checks.SelfDeath, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.SelfDeath = Value
    end
})



Fp:AddToggle('MyToggle', {
    Text = 'Fps Unlocker',
    Default = getgenv().Pravus.FPS.FPSUnlocker, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.FPS.FPSUnlocker = Value
    end
})

Fp:AddSlider('MySlider', {
    Text = 'Limit',
    Default = getgenv().Pravus.FPS.Limit,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.FPS.Limit = Value
    end
})




speed:AddToggle('MyToggle', {
    Text = 'WalkSpeed',
    Default = getgenv().Pravus.WalkSpeed.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Enabled = Value
    end
})

speed:AddInput('MyTextbox', {
    Default = getgenv().Pravus.WalkSpeed.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'WalkSpeed Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Keybind = Value
    end
})

speed:AddSlider('MySlider', {
    Text = 'Speed',
    Default = getgenv().Pravus.WalkSpeed.Speed,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Speed = Value
    end
})

Rj:AddButton({
    Text = 'Rejoin Server',
    Func = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
    DoubleClick = false
})
Rj:AddButton({
    Text = 'Server Hop',
    Toolbox = 'Doesnt Work (Currently)',
    Func = function()
        local servers = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=10")
        local serverData = HttpService:JSONDecode(servers)
        local server = serverData.data[math.random(1, #serverData.data)]
        TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id)
    end,
    DoubleClick = false
})

    local SeatsRemoved = false
    local SeatStorage = {}
    
    local function RemoveSeats()
        local parts = Workspace:GetDescendants()
        for _, part in ipairs(parts) do
            if part:IsA("Seat") then
                table.insert(SeatStorage, part:Clone())
                part:Destroy()
            end
        end
        SeatsRemoved = true
    end
    
    local function ReturnSeats()
        for _, seat in ipairs(SeatStorage) do
            seat.Parent = Workspace
        end
        SeatStorage = {}
        SeatsRemoved = false
    end
    
    Rj:AddButton({
        Text = 'Remove Seats',
        Func = function()
            if SeatsRemoved then
                ReturnSeats()
            else
                RemoveSeats()
            end
        end,
        DoubleClick = false
    })

    local colorCorrectionEffect = nil
    local isColorCorrectionEnabled = false
    
    Rj:AddButton({
        Text = 'Color Correction',
        Func = function()
            local l = game:GetService("Lighting")
            
            if isColorCorrectionEnabled then
                if colorCorrectionEffect then
                    colorCorrectionEffect:Destroy()
                    colorCorrectionEffect = nil
                end
                isColorCorrectionEnabled = false
            else
                colorCorrectionEffect = Instance.new("ColorCorrectionEffect", l)
                colorCorrectionEffect.Brightness = 0
                colorCorrectionEffect.Contrast = 0.01
                colorCorrectionEffect.Saturation = 0.67
                isColorCorrectionEnabled = true
            end
        end,
        DoubleClick = false
    })
    local originalFogEnd = game.Lighting.FogEnd
    local originalFogStart = game.Lighting.FogStart
    local originalOutdoorAmbient = game.Lighting.OutdoorAmbient
    
    local isFogDisabled = false
    
    Rj:AddButton({
        Text = 'No Fog',
        Func = function()
            if isFogDisabled then
                game.Lighting.FogEnd = originalFogEnd
                game.Lighting.FogStart = originalFogStart
                game.Lighting.OutdoorAmbient = originalOutdoorAmbient
                isFogDisabled = false
            else
                originalFogEnd = game.Lighting.FogEnd
                originalFogStart = game.Lighting.FogStart
                originalOutdoorAmbient = game.Lighting.OutdoorAmbient
                
                game.Lighting.FogEnd = 50
                game.Lighting.FogStart = 10
                game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 255, 79)
                isFogDisabled = true
            end
        end,
        DoubleClick = false
    })

    local Auto_Stomp = false
    Rj:AddToggle('', {
        Text = 'Auto Stomp',
        Default = false,
        Callback = function(bool)
            Auto_Stomp = bool
            if Auto_Stomp then
                spawn(function()
                    while Auto_Stomp do
                        ME:FireServer(EventN)
                        wait(0.1)
                    end
                end)
            end
        end
    })

    Rj:AddToggle('', {
        Text = 'Anti Slow',
        Default = false,
        Callback = function(val)
            getgenv().x = val
            if getgenv().x == true then
                local player = game.Players.LocalPlayer
                local character = player.Character
                local bodyEffects = character:WaitForChild("BodyEffects")
                local movement = bodyEffects:WaitForChild("Movement")
    
                local DeletePart = movement:FindFirstChild('NoJumping') or movement:FindFirstChild('ReduceWalk') or movement:FindFirstChild('NoWalkSpeed')
                if DeletePart then
                    DeletePart:Destroy()
                end
    
                if bodyEffects.Reload.Value then
                    bodyEffects.Reload.Value = false
                end
            end
        end
    })
    local AntiStompEnabled = false
    local AntiStompPos = nil
    
    Rj:AddToggle('', {
        Text = 'Anti Stomp',
        Default = false,
        Callback = function(Value)
            AntiStompEnabled = Value
            if AntiStompEnabled then
                while wait(1) do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local humanoid = LocalPlayer.Character.Humanoid
                        if humanoid.Health < 5 then
                            for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    descendant:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    Rj:AddButton({
        Text = 'No Delay',
        Func = function()
            local bulletHole = CorePackages:FindFirstChild("BulletHole")
            if bulletHole then
                bulletHole:Destroy()
            end
            if ReplicatedStorage.BulletHole and ReplicatedStorage.BulletHole:FindFirstChild("Delay") then
                ReplicatedStorage.BulletHole.Delay.Position = 0
            end
        end,
        DoubleClick = false
    })

    Rj:AddSlider('', {
        Text = 'FOV (in game)',
        Default = 70,
        Min = 70,
        Max = 160,
        Rounding = 0,
        Compact = true,
        Callback = function(value)
            game.Workspace.CurrentCamera.FieldOfView = value
        end
    })

    local SelectedTarget = nil
    local TargetLabel = Tg:AddLabel('Selected Target: None')
    
    local function UpdateLabel(player)
        local LabelText = 'Selected Target: ' .. (player and player.Name or 'None')
        TargetLabel:SetText(LabelText)
    end
    
    Tg:AddInput('', {
        Default = '',
        Numeric = false,
        Finished = false,
        Text = 'Search Players',
        Placeholder = 'Click to Search Target',
        Callback = function(searchQuery)
            searchQuery = searchQuery:lower()
    
            local function FindPlayer(query)
                if query == '' then
                    return nil
                end
                
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and (player.Name:lower():find(query, 1, true) or (player.DisplayName and player.DisplayName:lower():find(query, 1, true))) then
                        return player
                    end
                end
                return nil
            end
            
            local player = FindPlayer(searchQuery)
            
            if player then
                SelectedTarget = player
                UpdateLabel(player)
            else
                SelectedTarget = nil
                UpdateLabel(nil)
            end
        end
    })
    
    local originalCameraType
    local originalCameraSubject
    
    local function toggleView(enable)
        local humanoid = SelectedTarget.Character.Humanoid
    
        if enable and humanoid then
            originalCameraType = CurrentCamera.CameraType
            originalCameraSubject = CurrentCamera.CameraSubject
            CurrentCamera.CameraSubject = humanoid
        elseif originalCameraType and originalCameraSubject then
            CurrentCamera.CameraType = originalCameraType
            CurrentCamera.CameraSubject = originalCameraSubject
        end
    end
    

    Tg:AddButton({
        Text = 'Goto',
        Func = function()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame
                end
            end
        end,
        DoubleClick = false
    })

Right:AddToggle('MyToggle', {
    Text = 'Camlock',
    Default = getgenv().Pravus.Camlock.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.Enabled = Value
    end
})

Right:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.Camlock.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.AutoPrediction = Value
    end
})

Right:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.Camlock.Part, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.Part = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Camlock Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Keybind = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Prediction', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Prediction = Value
    end
})


Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.JumpOffset,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'JumpOffset',
    Tooltip = 'JumpOffset', -- Information shown when you hover over the textbox

    Placeholder = 'JumpOffset', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.JumpOffset = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Smoothness,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'smoothing',
    Tooltip = 'Smoothness', -- Information shown when you hover over the textbox

    Placeholder = 'smooth', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Smoothness = Value
    end
})


mou:AddToggle('MyToggle', {
    Text = 'MouseTp',
    Default = getgenv().Pravus.MouseTp.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
getgenv().Pravus.MouseTp.Enabled = Value
    end
})

mou:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.MouseTp.Part, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.MouseTp.Part = Value
    end
})
mou:AddInput('MyTextbox', {
    Default = getgenv().Pravus.MouseTp.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Prediction', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.MouseTp.Prediction = Value
    end
})


mou:AddInput('MyTextbox', {
    Default = getgenv().Pravus.MouseTp.Smoothness,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'smoothing',
    Tooltip = 'Smoothness', -- Information shown when you hover over the textbox

    Placeholder = 'smooth', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.MouseTp.Smoothness = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'Silent aim',
    Default = getgenv().Pravus.SilentAim.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.Enabled = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'NearestPoint',
    Default = getgenv().Pravus.SilentAim.NearestPoint, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.NearestPoint = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.SilentAim.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.AutoPrediction = Value
    end
})

Left:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.SilentAim.HitPart, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.HitPart = Value
    end
})


Left:AddInput('MyTextbox', {
    Default = getgenv().Pravus.SilentAim.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.SilentAim.Prediction = Value
    end
})


Left:AddToggle('MyToggle', {
    Text = 'Show Fov ',
    Default = getgenv().Pravus.SilentAim.FOV.Visible, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.FOV.Visible = Value
    end
})
Left:AddSlider('MySlider', {
    Text = 'Radius',
    Default = getgenv().Pravus.SilentAim.FOV.Radius,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.SilentAim.FOV.Radius = Value
    end
})

trig:AddToggle('MyToggle', {
    Text = 'Enable Triggerbot',
    Default = getgenv().Pravus.Triggerbot.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Enabled = Value
    end
})

trig:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Triggerbot.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Triggerbot Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Keybind = Value
    end
})

trig:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Triggerbot.Delay,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Triggerbot Delay',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Delay = Value
    end
})

Target:AddToggle('MyToggle', {
    Text = 'Enable TargetAim',
    Default = getgenv().Pravus.TargetAim.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Enabled = Value
    end
})


Target:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.TargetAim.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.AutoPrediction = Value
    end
})

Target:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.TargetAim.HitPart, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.HitPart = Value
    end
})

Target:AddInput('MyTextbox', {
    Default = getgenv().Pravus.TargetAim.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.TargetAim.Prediction = Value
    end
})



Target:AddInput('MyTextbox', {
    Default = getgenv().Pravus.TargetAim.KeyBind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'TargetAim Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.TargetAim.KeyBind = Value
    end
})



Tv:AddToggle('MyToggle', {
    Text = 'TargetLabel',
    Default = getgenv().Pravus.TargetAim.Visuals.TargetLabel, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.TargetLabel = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Tracer',
    Default = getgenv().Pravus.TargetAim.Visuals.Tracer, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Tracer = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Highlight',
    Default = getgenv().Pravus.TargetAim.Visuals.Highlight, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Highlight = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Dot',
    Default = getgenv().Pravus.TargetAim.Visuals.Dot, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Dot = Value
    end
})

Ts:AddToggle('MyToggle', {
    Text = 'TargetStrafe',
    Default = getgenv().Pravus.TargetStrafe.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.Enabled = Value
    end
})



Ts:AddSlider('MySlider', {
    Text = 'Distance',
    Default = getgenv().Pravus.TargetStrafe.OrbitRadius,
    Min = 0,
    Max = 21,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitRadius = Value
    end
})

Ts:AddSlider('MySlider', {
    Text = 'Height',
    Default = getgenv().Pravus.TargetStrafe.OrbitHeight,
    Min = 0,
    Max = 21,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitHeight = Value
    end
})

Ts:AddSlider('MySlider', {
    Text = 'Speed',
    Default = getgenv().Pravus.TargetStrafe.OrbitSpeed,
    Min = 0,
    Max = 22,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitSpeed = Value
    end
})



--        getgenv().Pravus.Triggerbot.Keybind = Value











-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})

MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder("Pravuse")
SaveManager:SetFolder("Pravuse/Dahood")
SaveManager:SetSubFolder("Dahood") -- if the game has multiple places inside of it (for example: DOORS)
-- you can use this to save configs for those places separately
-- The path in this script would be: MyScriptHub/specific-game/settings/specific-place
-- [ This is optional ]

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs["UI Settings"])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end

-- New example written by wally


if getgenv().Pravus.StartUp.Enabled and getgenv().Pravus.StartUp['UI Type'] == "Custom Linoria2" then
local repo = 'https://github.com/onked/boronlib/blob/main/'

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/onked/boronlib/refs/heads/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/onked/boronlib/refs/heads/main/addons/ThemeManager"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/onked/boronlib/refs/heads/main/addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = '                            Pravus.lua                               ', 
    TitleAlign = Enum.TextXAlignment.Center, 
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.1
})

-- CALLBACK NOTE:
-- Passing in callback functions via the initial element parameters (i.e. Callback = function(Value)...) works
-- HOWEVER, using Toggles/Options.INDEX:OnChanged(function(Value) ... ) is the RECOMMENDED way to do this.
-- I strongly recommend decoupling UI code from logic code. i.e. Create your UI elements FIRST, and THEN setup :OnChanged functions later.

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Legit'),
    Main2 = Window:AddTab('Rage'),
    Players = Window:AddTab('Misc'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}


local Left = Tabs.Main:AddLeftGroupbox('Silent')
local Right = Tabs.Main:AddRightGroupbox('Camlock')
local trig = Tabs.Main:AddRightGroupbox('TriggerBot')
local mou = Tabs.Main:AddLeftGroupbox('Mouse Tp')
local Target = Tabs.Main2:AddLeftGroupbox('Target Aim')
local Ts = Tabs.Main2:AddRightGroupbox('Target Strafe')
local Tv = Tabs.Main2:AddRightGroupbox('Target Visuals')
local chec = Tabs.Players:AddLeftGroupbox('Checks')
local speed = Tabs.Players:AddRightGroupbox('WalkSpeed')
local Rj = Tabs.Players:AddRightGroupbox('General 1')
local Fp = Tabs.Players:AddLeftGroupbox('General 2') 
local Tg = Tabs.Players:AddLeftGroupbox('Other Players') 
local Vs = Tabs.Visuals:AddLeftGroupbox('Visuals') 
local Vd = Tabs.Visuals:AddRightGroupbox('Fog')

    local bC = nil
    local t = 0.5
    local bM = Enum.Material.ForceField
    local bPN = {
        "UpperTorso", "HumanoidRootPart", "LowerTorso",
        "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
        "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
        "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
    }
    local sCE = false
    local oP = {}
    
    local function applyChamsToPart(part)
        if part:IsA("BasePart") then
            if not oP[part] then
                oP[part] = {
                    Transparency = part.Transparency,
                    Material = part.Material,
                    Color = part.Color
                }
            end
            
            if part.Parent ~= LocalPlayer.Character then
                local isDescendantOfTool = false
                local current = part
                while current.Parent do
                    if current.Parent:IsA("Tool") then
                        isDescendantOfTool = true
                        break
                    end
                    current = current.Parent
                end
                
                if not isDescendantOfTool then
                    if part.Name == "HumanoidRootPart" then
                        part.Transparency = sCE and 1 or oP[part].Transparency
                    elseif part.Name == "Head" or part.Name == "Hair" or table.find(bPN, part.Name) then
                        if sCE then
                            part.Material = bM
                            part.Transparency = t
                            part.Color = bC
                        else
                            part.Material = oP[part].Material
                            part.Transparency = oP[part].Transparency
                            part.Color = oP[part].Color
                        end
                    end
                end
            end
        end
    end
    
    local function cB()
        local characters = Players:GetPlayers()
        for _, player in ipairs(characters) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        applyChamsToPart(part)
                    end
                end
            end
        end
    end
    
    local function rOA()
        for part, props in pairs(oP) do
            if part:IsA("BasePart") then
                part.Transparency = props.Transparency
                part.Material = props.Material
                part.Color = props.Color
            end
        end
        oP = {}
    end
    
    Vs:AddToggle('', {
        Text = 'Chams',
        Default = false,
        Callback = function(Value)
            sCE = Value
            if sCE then
                cB()
            else
                rOA()
            end
        end
    }):AddColorPicker('', {
        Default = Color3.fromRGB(0, 255, 79),
        Transparency = nil,
        Callback = function(Value)
            bC = Value
            if sCE then
                cB()
            end
        end
    })

    local transparency = 0.5
    local bodyColor = Color3.fromRGB(0, 170, 255)
    local gunColor = Color3.fromRGB(0, 170, 255)
    local barrierMaterial = Enum.Material.ForceField
    
    local bodyPartNames = {
        "UpperTorso", "LowerTorso",
        "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
        "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
        "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
    }
    
    local selfChamsEnabled = false
    local gunChamsEnabled = false
    local originalProperties = {}
    
    local function applyChamsToPart(part)
        if part:IsA("BasePart") then
            if not originalProperties[part] then
                originalProperties[part] = {
                    Transparency = part.Transparency,
                    Material = part.Material,
                    Color = part.Color
                }
            end
            
            if part.Parent == LocalPlayer.Character then
                if part.Name == "HumanoidRootPart" or part.Name == "Head" then
                    part.Transparency = 1
                elseif table.find(bodyPartNames, part.Name) then
                    part.Material = barrierMaterial
                    part.Transparency = transparency
                    part.Color = bodyColor
                end
            end
        end
    end
    
    local function createBarrier()
        local character = LocalPlayer.Character
        if character and selfChamsEnabled then
            for _, part in ipairs(character:GetDescendants()) do
                applyChamsToPart(part)
            end
        end
    end
    
    local function applyChamsToTool(tool)
        if gunChamsEnabled then
            for _, part in ipairs(tool:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Material = barrierMaterial
                    part.Transparency = transparency
                    part.Color = gunColor
                    if part.Name == "Handle" then
                        part.Transparency = 1
                    end
                end
            end
        end
    end
    
    local function restoreOriginalAppearance()
        for part, props in pairs(originalProperties) do
            if part:IsA("BasePart") then
                part.Transparency = props.Transparency
                part.Material = props.Material
                part.Color = props.Color
            end
        end
        originalProperties = {}
    end
    
    local function onToolAdded(tool)
        if tool:IsA("Tool") then
            applyChamsToTool(tool)
        end
    end
    
    LocalPlayer.CharacterAdded:Connect(createBarrier)
    LocalPlayer.Backpack.ChildAdded:Connect(onToolAdded)
    
    if LocalPlayer.Character then
        createBarrier()
    end
    for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
        onToolAdded(tool)
    end
    

    Vs:AddToggle('', {
        Text = 'Self Chams',
        Default = false,
        Callback = function(Value)
            selfChamsEnabled = Value
            if selfChamsEnabled then
                createBarrier()
            else
                restoreOriginalAppearance()
            end
        end
    })
    :AddColorPicker('', {
        Default = bodyColor,
        Transparency = nil,
        Callback = function(Value)
            bodyColor = Value
            if selfChamsEnabled then
                createBarrier()
            end
        end
    })

    Vd:AddLabel('Fog Color'):AddColorPicker('FogColorR', {
        Default = Color3.fromRGB(100, 87, 72), -- Bright green
        Title = 'Fog Color', -- Optional. Allows you to have a custom color picker title (when you open it)
        Transparency = nil, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)
    
        Callback = function(Value)
        end
    })
    
    Options.FogColorR:OnChanged(function()
        game:GetService("Lighting").FogColor = Options.FogColorR.Value
    end)
    
    Vd:AddSlider('FogEnd', {
        Text = 'Fog Distance',
        Default = 800,
        Min = 25,
        Max = 5000,
        Rounding = 1,
        Compact = true, 
    })
    
    Options.FogEnd:OnChanged(function()
        game:GetService("Lighting").FogEnd = Options.FogEnd.Value
    end)

chec:AddToggle('MyToggle', {
    Text = 'KOCheck',
    Default = getgenv().Pravus.Checks.KOCheck, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.KOCheck = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'WallCheck',
    Default = getgenv().Pravus.Checks.WallCheck, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.WallCheck = Value
    end
})

chec:AddToggle('MyToggle', {
    Text = 'SelfDeath',
    Default = getgenv().Pravus.Checks.SelfDeath, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Checks.SelfDeath = Value
    end
})



Fp:AddToggle('MyToggle', {
    Text = 'Fps Unlocker',
    Default = getgenv().Pravus.FPS.FPSUnlocker, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.FPS.FPSUnlocker = Value
    end
})

Fp:AddSlider('MySlider', {
    Text = 'Limit',
    Default = getgenv().Pravus.FPS.Limit,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.FPS.Limit = Value
    end
})




speed:AddToggle('MyToggle', {
    Text = 'WalkSpeed',
    Default = getgenv().Pravus.WalkSpeed.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Enabled = Value
    end
})

speed:AddInput('MyTextbox', {
    Default = getgenv().Pravus.WalkSpeed.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'WalkSpeed Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Keybind = Value
    end
})

speed:AddSlider('MySlider', {
    Text = 'Speed',
    Default = getgenv().Pravus.WalkSpeed.Speed,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.WalkSpeed.Speed = Value
    end
})
Rj:AddButton({
    Text = 'Rejoin Server',
    Func = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
    DoubleClick = false
})
Rj:AddButton({
    Text = 'Server Hop',
    Toolbox = 'Doesnt Work (Currently)',
    Func = function()
        local servers = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=10")
        local serverData = HttpService:JSONDecode(servers)
        local server = serverData.data[math.random(1, #serverData.data)]
        TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id)
    end,
    DoubleClick = false
})

    local SeatsRemoved = false
    local SeatStorage = {}
    
    local function RemoveSeats()
        local parts = Workspace:GetDescendants()
        for _, part in ipairs(parts) do
            if part:IsA("Seat") then
                table.insert(SeatStorage, part:Clone())
                part:Destroy()
            end
        end
        SeatsRemoved = true
    end
    
    local function ReturnSeats()
        for _, seat in ipairs(SeatStorage) do
            seat.Parent = Workspace
        end
        SeatStorage = {}
        SeatsRemoved = false
    end
    
    Rj:AddButton({
        Text = 'Remove Seats',
        Func = function()
            if SeatsRemoved then
                ReturnSeats()
            else
                RemoveSeats()
            end
        end,
        DoubleClick = false
    })

    local colorCorrectionEffect = nil
    local isColorCorrectionEnabled = false
    
    Rj:AddButton({
        Text = 'Color Correction',
        Func = function()
            local l = game:GetService("Lighting")
            
            if isColorCorrectionEnabled then
                if colorCorrectionEffect then
                    colorCorrectionEffect:Destroy()
                    colorCorrectionEffect = nil
                end
                isColorCorrectionEnabled = false
            else
                colorCorrectionEffect = Instance.new("ColorCorrectionEffect", l)
                colorCorrectionEffect.Brightness = 0
                colorCorrectionEffect.Contrast = 0.01
                colorCorrectionEffect.Saturation = 0.67
                isColorCorrectionEnabled = true
            end
        end,
        DoubleClick = false
    })
    local originalFogEnd = game.Lighting.FogEnd
    local originalFogStart = game.Lighting.FogStart
    local originalOutdoorAmbient = game.Lighting.OutdoorAmbient
    
    local isFogDisabled = false
    
    Rj:AddButton({
        Text = 'No Fog',
        Func = function()
            if isFogDisabled then
                game.Lighting.FogEnd = originalFogEnd
                game.Lighting.FogStart = originalFogStart
                game.Lighting.OutdoorAmbient = originalOutdoorAmbient
                isFogDisabled = false
            else
                originalFogEnd = game.Lighting.FogEnd
                originalFogStart = game.Lighting.FogStart
                originalOutdoorAmbient = game.Lighting.OutdoorAmbient
                
                game.Lighting.FogEnd = 50
                game.Lighting.FogStart = 10
                game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 255, 79)
                isFogDisabled = true
            end
        end,
        DoubleClick = false
    })

    local Auto_Stomp = false
    Rj:AddToggle('', {
        Text = 'Auto Stomp',
        Default = false,
        Callback = function(bool)
            Auto_Stomp = bool
            if Auto_Stomp then
                spawn(function()
                    while Auto_Stomp do
                        ME:FireServer(EventN)
                        wait(0.1)
                    end
                end)
            end
        end
    })

    Rj:AddToggle('', {
        Text = 'Anti Slow',
        Default = false,
        Callback = function(val)
            getgenv().x = val
            if getgenv().x == true then
                local player = game.Players.LocalPlayer
                local character = player.Character
                local bodyEffects = character:WaitForChild("BodyEffects")
                local movement = bodyEffects:WaitForChild("Movement")
    
                local DeletePart = movement:FindFirstChild('NoJumping') or movement:FindFirstChild('ReduceWalk') or movement:FindFirstChild('NoWalkSpeed')
                if DeletePart then
                    DeletePart:Destroy()
                end
    
                if bodyEffects.Reload.Value then
                    bodyEffects.Reload.Value = false
                end
            end
        end
    })
    local AntiStompEnabled = false
    local AntiStompPos = nil
    
    Rj:AddToggle('', {
        Text = 'Anti Stomp',
        Default = false,
        Callback = function(Value)
            AntiStompEnabled = Value
            if AntiStompEnabled then
                while wait(1) do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local humanoid = LocalPlayer.Character.Humanoid
                        if humanoid.Health < 5 then
                            for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    descendant:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    Rj:AddButton({
        Text = 'No Delay',
        Func = function()
            local bulletHole = CorePackages:FindFirstChild("BulletHole")
            if bulletHole then
                bulletHole:Destroy()
            end
            if ReplicatedStorage.BulletHole and ReplicatedStorage.BulletHole:FindFirstChild("Delay") then
                ReplicatedStorage.BulletHole.Delay.Position = 0
            end
        end,
        DoubleClick = false
    })




    Rj:AddSlider('', {
        Text = 'FOV (in game)',
        Default = 70,
        Min = 70,
        Max = 160,
        Rounding = 0,
        Compact = true,
        Callback = function(value)
            game.Workspace.CurrentCamera.FieldOfView = value
        end
    })

    local SelectedTarget = nil
    local TargetLabel = Tg:AddLabel('Selected Target: None')
    
    local function UpdateLabel(player)
        local LabelText = 'Selected Target: ' .. (player and player.Name or 'None')
        TargetLabel:SetText(LabelText)
    end
    
    Tg:AddInput('', {
        Default = '',
        Numeric = false,
        Finished = false,
        Text = 'Search Players',
        Placeholder = 'Click to Search Target',
        Callback = function(searchQuery)
            searchQuery = searchQuery:lower()
    
            local function FindPlayer(query)
                if query == '' then
                    return nil
                end
                
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and (player.Name:lower():find(query, 1, true) or (player.DisplayName and player.DisplayName:lower():find(query, 1, true))) then
                        return player
                    end
                end
                return nil
            end
            
            local player = FindPlayer(searchQuery)
            
            if player then
                SelectedTarget = player
                UpdateLabel(player)
            else
                SelectedTarget = nil
                UpdateLabel(nil)
            end
        end
    })
    
    local originalCameraType
    local originalCameraSubject
    
    local function toggleView(enable)
        local humanoid = SelectedTarget.Character.Humanoid
    
        if enable and humanoid then
            originalCameraType = CurrentCamera.CameraType
            originalCameraSubject = CurrentCamera.CameraSubject
            CurrentCamera.CameraSubject = humanoid
        elseif originalCameraType and originalCameraSubject then
            CurrentCamera.CameraType = originalCameraType
            CurrentCamera.CameraSubject = originalCameraSubject
        end
    end
    

    Tg:AddButton({
        Text = 'Goto',
        Func = function()
            if SelectedTarget and SelectedTarget.Character and SelectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = SelectedTarget.Character.HumanoidRootPart.CFrame
                end
            end
        end,
        DoubleClick = false
    })

chec:AddToggle('MyToggle', {
    Text = 'AntiAimViewer',
    Default = getgenv().Pravus.Checks.AntiAimViewer, 
    Tooltip = 'Silent Aim', 

    Callback = function(Value)
        getgenv().Pravus.Checks.AntiAimViewer = Value
    end
})

Right:AddToggle('MyToggle', {
    Text = 'Camlock',
    Default = getgenv().Pravus.Camlock.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.Enabled = Value
    end
})

Right:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.Camlock.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.AutoPrediction = Value
    end
})

Right:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.Camlock.Part, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.Camlock.Part = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Camlock Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Keybind = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Prediction', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Prediction = Value
    end
})


Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.JumpOffset,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'JumpOffset',
    Tooltip = 'JumpOffset', -- Information shown when you hover over the textbox

    Placeholder = 'JumpOffset', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.JumpOffset = Value
    end
})
Right:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Camlock.Smoothness,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'smoothing',
    Tooltip = 'Smoothness', -- Information shown when you hover over the textbox

    Placeholder = 'smooth', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Camlock.Smoothness = Value
    end
})


mou:AddToggle('MyToggle', {
    Text = 'MouseTp',
    Default = getgenv().Pravus.MouseTp.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
getgenv().Pravus.MouseTp.Enabled = Value
    end
})

mou:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.MouseTp.Part, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.MouseTp.Part = Value
    end
})
mou:AddInput('MyTextbox', {
    Default = getgenv().Pravus.MouseTp.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Prediction', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.MouseTp.Prediction = Value
    end
})


mou:AddInput('MyTextbox', {
    Default = getgenv().Pravus.MouseTp.Smoothness,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'smoothing',
    Tooltip = 'Smoothness', -- Information shown when you hover over the textbox

    Placeholder = 'smooth', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.MouseTp.Smoothness = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'Silent aim',
    Default = getgenv().Pravus.SilentAim.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.Enabled = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'NearestPoint',
    Default = getgenv().Pravus.SilentAim.NearestPoint, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.NearestPoint = Value
    end
})

Left:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.SilentAim.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.AutoPrediction = Value
    end
})

Left:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.SilentAim.HitPart, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.HitPart = Value
    end
})


Left:AddInput('MyTextbox', {
    Default = getgenv().Pravus.SilentAim.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.SilentAim.Prediction = Value
    end
})


Left:AddToggle('MyToggle', {
    Text = 'Show Fov ',
    Default = getgenv().Pravus.SilentAim.FOV.Visible, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.SilentAim.FOV.Visible = Value
    end
})
Left:AddSlider('MySlider', {
    Text = 'Radius',
    Default = getgenv().Pravus.SilentAim.FOV.Radius,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.SilentAim.FOV.Radius = Value
    end
})

trig:AddToggle('MyToggle', {
    Text = 'Enable Triggerbot',
    Default = getgenv().Pravus.Triggerbot.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Enabled = Value
    end
})

trig:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Triggerbot.Keybind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Triggerbot Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Keybind = Value
    end
})


trig:AddInput('MyTextbox', {
    Default = getgenv().Pravus.Triggerbot.Delay,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Triggerbot Delay',
    Tooltip = 'Delay', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.Triggerbot.Delay = Value
    end
})

Target:AddToggle('MyToggle', {
    Text = 'Enable TargetAim',
    Default = getgenv().Pravus.TargetAim.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Enabled = Value
    end
})


Target:AddToggle('MyToggle', {
    Text = 'AutoPrediction',
    Default = getgenv().Pravus.TargetAim.AutoPrediction, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.AutoPrediction = Value
    end
})

Target:AddDropdown('Parts', {
    Values = { 
        "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"
    },
    Default = getgenv().Pravus.TargetAim.HitPart, 
    Multi = false, 

    Text = 'BodyParts',
    Tooltip = 'This is a tooltip', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.HitPart = Value
    end
})

Target:AddInput('MyTextbox', {
    Default = getgenv().Pravus.TargetAim.Prediction,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = '0.14', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.TargetAim.Prediction = Value
    end
})



Target:AddInput('MyTextbox', {
    Default = getgenv().Pravus.TargetAim.KeyBind,
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'TargetAim Keybind',
    Tooltip = 'Uppercase only', -- Information shown when you hover over the textbox

    Placeholder = 'Keybind', -- placeholder text when the box is empty
    
    Callback = function(Value)
        getgenv().Pravus.TargetAim.KeyBind = Value
    end
})


Tv:AddToggle('MyToggle', {
    Text = 'TargetLabel',
    Default = getgenv().Pravus.TargetAim.Visuals.TargetLabel, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.TargetLabel = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Tracer',
    Default = getgenv().Pravus.TargetAim.Visuals.Tracer, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Tracer = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'HighLight',
    Default = getgenv().Pravus.TargetAim.Visuals.Highlight, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Highlight = Value
    end
})

Tv:AddToggle('MyToggle', {
    Text = 'Dot',
    Default = getgenv().Pravus.TargetAim.Visuals.Dot, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetAim.Visuals.Dot = Value
    end
})

Ts:AddToggle('MyToggle', {
    Text = 'TargetStrafe',
    Default = getgenv().Pravus.TargetStrafe.Enabled, 
    Tooltip = '', 

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.Enabled = Value
    end
})



Ts:AddSlider('MySlider', {
    Text = 'Distance',
    Default = getgenv().Pravus.TargetStrafe.OrbitRadius,
    Min = 0,
    Max = 21,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitRadius = Value
    end
})

Ts:AddSlider('MySlider', {
    Text = 'Height',
    Default = getgenv().Pravus.TargetStrafe.OrbitHeight,
    Min = 0,
    Max = 21,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitHeight = Value
    end
})

Ts:AddSlider('MySlider', {
    Text = 'Speed',
    Default = getgenv().Pravus.TargetStrafe.OrbitSpeed,
    Min = 0,
    Max = 22,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().Pravus.TargetStrafe.OrbitSpeed = Value
    end
})

--        getgenv().Pravus.Triggerbot.Keybind = Value











Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
-- SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
-- SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('Pravus')
SaveManager:SetFolder('Pravus/Dahood')

SaveManager:BuildConfigSection(Tabs['UI Settings'])


ThemeManager:ApplyToTab(Tabs['UI Settings'])


SaveManager:LoadAutoloadConfig()
end
