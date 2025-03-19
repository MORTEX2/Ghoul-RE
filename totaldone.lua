local HttpService = game:GetService("HttpService")
local PastebinURL = "https://pastebin.com/raw/28huELby"

local YOUTUBE_LINK = "https://www.youtube.com/@Mr._Stone"
local DISCORD_LINK = "https://discord.gg/7pQPqrhUsW"


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 280, 0, 180)
Frame.Position = UDim2.new(0.5, -140, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(15, 15, 15)
Frame.Parent = ScreenGui

task.spawn(function()

    while true do
            local player = game.Players.LocalPlayer
    local gui = player:WaitForChild("PlayerGui"):WaitForChild("HUD")
    local cashLabel = gui:FindFirstChild("Cash")

        local entity = workspace.Entities:FindFirstChild(player.Name)
        if cashLabel and entity then
            local cashValue = entity:FindFirstChild("Cash")
            if cashValue and cashValue:IsA("IntValue") then
                cashLabel.Text = tostring(cashValue.Value)
            end
        end
        task.wait(1) -- Update every second
    end
end)


local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = " MORTEX - Hup"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame


local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 2)
CloseButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = Frame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)


local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.Parent = Frame
KeyBox.Text = ""



local CheckButton = Instance.new("TextButton")
CheckButton.Size = UDim2.new(0.8, 0, 0, 30)
CheckButton.Position = UDim2.new(0.1, 0, 0.55, 0)
CheckButton.BackgroundColor3 = Color3.fromRGB(60, 150, 60)
CheckButton.Text = "Submit"
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.TextSize = 14
CheckButton.Parent = Frame


local YTButton = Instance.new("TextButton")
YTButton.Size = UDim2.new(0.4, 0, 0, 30)
YTButton.Position = UDim2.new(0.05, 0, 0.8, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "YouTube"
YTButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 14
YTButton.Parent = Frame


local DCButton = Instance.new("TextButton")
DCButton.Size = UDim2.new(0.4, 0, 0, 30)
DCButton.Position = UDim2.new(0.55, 0, 0.8, 0)
DCButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DCButton.Text = "Discord"
DCButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DCButton.Font = Enum.Font.GothamBold
DCButton.TextSize = 14
DCButton.Parent = Frame


local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)


local function getKeyFromPastebin()
    local success, result = pcall(function()
        return game:HttpGet(PastebinURL)
    end)
    if success then
        local lines = result:split("\n")
        return (lines[3] or ""):gsub("\r", "") 
    else
        return ""
    end
end


CheckButton.MouseButton1Click:Connect(function()
    local correctKey = getKeyFromPastebin()
    if KeyBox.Text == correctKey or true then
        CheckButton.Text = "✔ DONE"
        task.wait(1)
        ScreenGui:Destroy()
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 500
game:GetService("Players").LocalPlayer.CameraMinZoomDistance = 0




_G.ESP_ENABLED = true 

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local EntitiesFolder = workspace:WaitForChild("Entities") 

local ESPObjects = {} 


local function isValidEntity(entity)
    return entity:IsA("Model") and entity:FindFirstChild("Humanoid") and entity:FindFirstChild("Hunger") and entity:FindFirstChild("Rank") and entity:FindFirstChild("HumanoidRootPart") and not entity.Name:match("^%(")
end


local function createESP(entity)
    if not _G.ESP_ENABLED or ESPObjects[entity] then return end 
    
    local rootPart = entity:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    
    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Filled = false
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Visible = false

    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Adornee = rootPart
    BillboardGui.Size = UDim2.new(0, 200, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    BillboardGui.AlwaysOnTop = true

    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Size = UDim2.new(1, 0, 1, 0)
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoLabel.TextStrokeTransparency = 0
    InfoLabel.TextSize = 14
    InfoLabel.Font = Enum.Font.Code
    InfoLabel.Parent = BillboardGui

    BillboardGui.Parent = rootPart 
    ESPObjects[entity] = {Box, BillboardGui}

    
    local function updateESP()
        if _G.ESP_ENABLED and entity and rootPart then
            local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local humanoid = entity:FindFirstChild("Humanoid")
            local hunger = entity:FindFirstChild("Hunger")
            local rank = entity:FindFirstChild("Rank")

            if onScreen then
                Box.Visible = true
                BillboardGui.Enabled = true
                local size = Vector2.new(1000 / screenPos.Z, 1500 / screenPos.Z)
                local position = Vector2.new(screenPos.X - size.X / 2, screenPos.Y - size.Y / 2)

                Box.Size = size
                Box.Position = position

                
                local distance = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude or math.huge

                
                if distance < 400 then 
                    Box.Color = Color3.fromRGB(255, 0, 0)
                elseif distance < 800 then 
                    Box.Color = Color3.fromRGB(255, 255, 0)
                else
                    Box.Color = Color3.fromRGB(0, 255, 0)
                end

                
                InfoLabel.Text = string.format(
                    "[%s] | Health: %d | Hunger: %d | Rank: %s",
                    entity.Name, math.floor(humanoid.Health), math.floor(hunger.Value), rank.Value
                )
            else
                Box.Visible = false
                BillboardGui.Enabled = false
            end
        else
            Box.Visible = false
            BillboardGui.Enabled = false
        end
    end

    
    entity.AncestryChanged:Connect(function()
        if not entity:IsDescendantOf(workspace) then
            BillboardGui:Destroy()
            Box:Remove()
            ESPObjects[entity] = nil
        end
    end)

    
    RunService.RenderStepped:Connect(updateESP)
end


local function scanEntities()
    for _, entity in pairs(EntitiesFolder:GetChildren()) do
        if isValidEntity(entity) then
            createESP(entity)
        end
    end
end

scanEntities()


EntitiesFolder.ChildAdded:Connect(function(child)
    wait(1) 
    if isValidEntity(child) then
        createESP(child)
    end
end)


Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        wait(1) 
        scanEntities()
    end)
end)


local function toggleESP(state)
    _G.ESP_ENABLED = state
    if not _G.ESP_ENABLED then
        for entity, objects in pairs(ESPObjects) do
            if objects then
                objects[1]:Remove() 
                objects[2]:Destroy() 
            end
        end
        ESPObjects = {} 
    else
        scanEntities()
    end
end



_G.ESP_ENABLED = false 




_G.openGifts = false 

task.spawn(function()
    local player = game.Players.LocalPlayer

    while true do
        if _G.openGifts then
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")

            local function getClosestGift()
                local closestBox = nil
                local closestDist = math.huge

                for _, box in pairs(workspace:GetChildren()) do
                    if box.Name == "giftbox_blend" and box:FindFirstChild("ClickDetector") then
                        local part = box:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local dist = (part.Position - hrp.Position).Magnitude
                            if dist <= 7 and dist < closestDist then
                                closestBox = box
                                closestDist = dist
                            end
                        end
                    end
                end
                return closestBox
            end

            while _G.openGifts do
                local giftbox = getClosestGift()
                if giftbox then
                    local clickDetector = giftbox:FindFirstChild("ClickDetector")

                    while _G.openGifts and clickDetector and (giftbox:GetPivot().Position - hrp.Position).Magnitude <= 7 do
                        fireclickdetector(clickDetector)
                        task.wait(0.1)
                    end
                else
                end

                task.wait(0.5)
            end
        else
            task.wait(1) 
        end
    end
end)
task.spawn(function()
    local player = game.Players.LocalPlayer
    local vim = game:GetService("VirtualInputManager")
    local guiService = game:GetService("GuiService")

    while true do
        if _G.openGifts then
            local function getBagGui()
                local bagGui = player.PlayerGui:FindFirstChild("BagGui")
                if bagGui and bagGui:FindFirstChild("Frame") and bagGui.Frame:FindFirstChild("ItemsFrame") then
                    return bagGui.Frame.ItemsFrame
                end
                return nil
            end

            local bagFrame = getBagGui()
            if bagFrame then

                while bagFrame and bagFrame.Parent and _G.openGifts do
                    local topBtn, topY = nil, math.huge
                    
                    for _, btn in pairs(bagFrame:GetChildren()) do
                        if btn:IsA("TextButton") and btn.Visible and btn.AbsolutePosition.Y < topY then
                            topBtn, topY = btn, btn.AbsolutePosition.Y
                        end
                    end
                    
                    if not topBtn then
                        break
                    end
                    
                    local inset = guiService:GetGuiInset()
                    local absPos = topBtn.AbsolutePosition + topBtn.AbsoluteSize / 2
                    local realX = absPos.X + inset.X
                    local realY = absPos.Y + inset.Y

                    vim:SendMouseButtonEvent(realX, realY, 0, true, nil, 0)
                    task.wait(0.05)
                    vim:SendMouseButtonEvent(realX, realY, 0, false, nil, 0)

                    task.wait(0.2)
                end
            end
        end
        task.wait(1) 
    end
end)











_G.SPEEDHACK_ENABLED = false 
_G.SPEED_MULTIPLIER = 0.2 

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local speedConnection 

local function startSpeedHack()
    if speedConnection then speedConnection:Disconnect() end 

    speedConnection = RunService.Heartbeat:Connect(function()
        if _G.SPEEDHACK_ENABLED and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = LocalPlayer.Character.HumanoidRootPart
            local moveDirection = LocalPlayer.Character.Humanoid.MoveDirection
            if moveDirection.Magnitude > 0 then
                rootPart.CFrame = rootPart.CFrame + (moveDirection.Unit * _G.SPEED_MULTIPLIER) 
            end
        end
    end)
end


toggleSpeedHack = function(state)
    _G.SPEEDHACK_ENABLED = state
    if state then
        startSpeedHack() 
    elseif speedConnection then
        speedConnection:Disconnect() 
        speedConnection = nil
    end
end


LocalPlayer.CharacterAdded:Connect(function()
    wait(1) 
    if _G.SPEEDHACK_ENABLED then
        startSpeedHack()
    end
end)









_G.ENABLE_TELEPROTING_PATH = false

local player = game.Players.LocalPlayer

local function setup(character)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local baseplate

    while true do
        if _G.ENABLE_TELEPROTING_PATH then
            local baseY = rootPart.Position.Y - 3

            local newBaseplate = Instance.new("Part")
            newBaseplate.Size = Vector3.new(10, 1, 10)
            newBaseplate.Position = Vector3.new(rootPart.Position.X, baseY - 0.5, rootPart.Position.Z)
            newBaseplate.Anchored = true
            newBaseplate.Parent = workspace
            newBaseplate.Transparency = 1
            

            if rootPart.Position.Y < newBaseplate.Position.Y then
                newBaseplate.CanCollide = false
            else
                newBaseplate.CanCollide = true
            end

            if baseplate then
                baseplate:Destroy()
            end

            baseplate = newBaseplate
        elseif baseplate then
            baseplate:Destroy()
            baseplate = nil
        end

        task.wait(0.1)
    end
end

player.CharacterAdded:Connect(function(character)
    task.spawn(setup, character)
end)

if player.Character then
    task.spawn(setup, player.Character)
end











_G.AUTO_BLOCK = false 

task.spawn(function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    local RootPart = nil 
    local lastComboValues = {} 

    
    local function updateCharacter()
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        RootPart = Character:WaitForChild("HumanoidRootPart") 
     
    end

    
    updateCharacter()
    LocalPlayer.CharacterAdded:Connect(updateCharacter) 

    
    local function blockAction(state)
        local args = {
            [1] = {
                [1] = {
                    ["Module"] = "Block",
                    ["Bool"] = state
                },
                [2] = "\5"
            }
        }
        ReplicatedStorage:WaitForChild("Bridgenet2Main"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
     
    end

    
    while true do
        while not _G.AUTO_BLOCK do
            task.wait(0.1) 
        end

        if not RootPart then 
          
          task.wait(0.1) 
          continue 
          
          end 

        local closestEntity = nil
        local closestDistance = math.huge
        local trackedEntities = {} 

        for _, entity in pairs(workspace.Entities:GetChildren()) do
            if entity:IsA("Model") and entity.Name ~= LocalPlayer.Name then
                local humanoidRootPart = entity:FindFirstChild("HumanoidRootPart")
                local combo = entity:FindFirstChild("Combo")

                if humanoidRootPart and combo and combo:IsA("IntValue") then
                    local distance = (RootPart.Position - humanoidRootPart.Position).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestEntity = entity
                    end

                    
                    trackedEntities[entity] = true
                end
            end
        end

        
        for entity in pairs(lastComboValues) do
            if not trackedEntities[entity] then
                lastComboValues[entity] = nil
          
            end
        end

        if closestEntity then
    
        end

        if closestEntity and closestDistance < 12.2 then
            local combo = closestEntity:FindFirstChild("Combo")
            if combo then
                local lastCombo = lastComboValues[closestEntity] or 0
                local currentCombo = combo.Value

                if currentCombo > 0 and currentCombo ~= lastCombo then
        
                    task.wait(0.15) 
                    blockAction(true) 
                    task.wait(0.1) 
                    blockAction(false) 
                end

                lastComboValues[closestEntity] = currentCombo
            end
        end

        task.wait() 
    end
end)









local guiName = "Spectate"
if LocalPlayer.PlayerGui:FindFirstChild(guiName) then
    LocalPlayer.PlayerGui[guiName]:Destroy()
end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = true 


StarterGui:SetCore("SendNotification", {
    Title = "GUI Loaded";
    Text = "Press RIGHT SHIFT to toggle";
    Duration = 5;
})


local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Parent = ScreenGui


local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Text = "  Mortex | V1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.Code
Title.Parent = MainFrame

local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)


local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.Code
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
    ScreenGui:Destroy()
end)


local Tabs = {"Misc", "Auto Farm", "Teleport", "Credits"}
local TabButtons = {}
local TabFrames = {}

local TabHolder = Instance.new("Frame")
TabHolder.Size = UDim2.new(1, 0, 0, 30)
TabHolder.Position = UDim2.new(0, 0, 0, 30)
TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabHolder.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1 / #Tabs, 0, 1, 0)
    Button.Position = UDim2.new((i - 1) / #Tabs, 0, 0, 0)
    Button.Text = tab
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Code
    Button.TextSize = 14
    Button.Parent = TabHolder

    local TabFrame = Instance.new("Frame")
    TabFrame.Size = UDim2.new(1, -10, 1, -70)
    TabFrame.Position = UDim2.new(0, 5, 0, 65)
    TabFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabFrame.Visible = (i == 1)
    TabFrame.Parent = MainFrame

    TabButtons[tab] = Button
    TabFrames[tab] = TabFrame

    
    if tab == "Misc" then
        local toggles = {}

        local function createToggleButton(name, position, onFunction, offFunction)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 20, 0, 20)
            Button.Position = UDim2.new(0, 10, 0, position)
            Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Button.Text = ""
            Button.Parent = TabFrame
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0, 150, 0, 20)
            Label.Position = UDim2.new(0, 35, 0, position)
            Label.BackgroundTransparency = 1
            Label.Text = name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14
            Label.Font = Enum.Font.Code
            Label.Parent = TabFrame
            
            toggles[name] = false
            Button.MouseButton1Click:Connect(function()
                toggles[name] = not toggles[name]
                
                if toggles[name] then
                    Button.Text = "✔"
                    Button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                    if name == "ESP" then
                        
         
                    _G.ESP_ENABLED = true 
                    elseif name == "Speed Hack" then
                        
                        toggleSpeedHack(true) 

             
                    elseif name == "Open Chest" then
                        _G.openGifts = true
                                        
                    elseif name == "Auto Block" then
                        _G.AUTO_BLOCK = true      
                    end
                else
                    Button.Text = ""
                    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    if name == "ESP" then
                        
                    
                        _G.ESP_ENABLED = false
                    elseif name == "Speed Hack" then
                        
                        toggleSpeedHack(false) 
                      
                    elseif name == "Open Chest" then
                        _G.openGifts = false 
                     
                    elseif name == "Auto Block" then
                        
                        _G.AUTO_BLOCK = false
                   
                    end
                end
            end)
        end


        
        createToggleButton("ESP", 0)
        createToggleButton("Speed Hack", 30)
        createToggleButton("Open Chest", 90)
      
        createToggleButton("Auto Block", 60)
    end





if tab == "Auto Farm" then
local WarningLabel = Instance.new("TextLabel")
    WarningLabel.Size = UDim2.new(1, 0, 0, 20)
    WarningLabel.Position = UDim2.new(0, 0, 0, 85)
    WarningLabel.BackgroundTransparency = 1
    WarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100) 
    WarningLabel.TextSize = 14
    WarningLabel.Font = Enum.Font.Code
    WarningLabel.Text = "⚠️ Requires character reload after use!"
    WarningLabel.Parent = TabFrame


    local toggles = {}

    local function createToggleButton(name, position)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 20, 0, 20)
        Button.Position = UDim2.new(0, 10, 0, position)
        Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        Button.Text = ""
        Button.Parent = TabFrame

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0, 150, 0, 20)
        Label.Position = UDim2.new(0, 35, 0, position)
        Label.BackgroundTransparency = 1
        Label.Text = name
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.TextSize = 14
        Label.Font = Enum.Font.Code
        Label.Parent = TabFrame

        toggles[name] = false
        Button.MouseButton1Click:Connect(function()
            toggles[name] = not toggles[name]

            if toggles[name] then
                Button.Text = "✔"
                Button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                if name == "Mission" then
                    
                    
                    
                    
_G.FARM1_ENABLED = true





task.spawn(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local baseplate = nil
    local yThreshold = -324.672852 

    while _G.FARM1_ENABLED do
        local currentY = rootPart.Position.Y

        if currentY < yThreshold then
            if not baseplate then
                
                baseplate = Instance.new("Part")
                baseplate.Size = Vector3.new(10, 1, 10)
                baseplate.Position = Vector3.new(rootPart.Position.X, currentY - 3, rootPart.Position.Z)
                baseplate.Anchored = true
                baseplate.Parent = workspace
                baseplate.Transparency = 1

           
            end
        else
            if baseplate then
                baseplate:Destroy()
                baseplate = nil
             
            end
        end

        task.wait(0.1) 
    end
end)


_G.ENABLE_UNDERGROUND = false 


task.spawn(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local baseplate 

    while true do
        if _G.ENABLE_UNDERGROUND then 
        local baseY = rootPart.Position.Y - 3 

        
        local newBaseplate = Instance.new("Part")
        newBaseplate.Size = Vector3.new(10, 1, 10) 
        newBaseplate.Position = Vector3.new(rootPart.Position.X, baseY - 0.5, rootPart.Position.Z) 
        newBaseplate.Anchored = true
        newBaseplate.Parent = workspace
        newBaseplate.Transparency = 1

        
        if rootPart.Position.Y < newBaseplate.Position.Y then
            newBaseplate.CanCollide = false 
        else
            newBaseplate.CanCollide = true 
        end

        
        if baseplate then
            baseplate:Destroy()
        end

        baseplate = newBaseplate 

        task.wait(0.1) 
        end 
    wait(0.1)
    end
end)






local player = game.Players.LocalPlayer
local character = workspace.Entities:FindFirstChild(player.Name)
if not character then return end

local torso = character:FindFirstChild("Torso")
if torso and torso:IsA("BasePart") then
    torso:Destroy() 
    task.wait(2) 
    
end




task.spawn(function()
    
    while _G.FARM1_ENABLED do
        local player = game:GetService("Players").LocalPlayer
        local raceText = player.PlayerGui.SkillTreeInterface.Overlay.RaceText.Text

        
        local missionType = string.find(raceText, "Ghoul") and "Ghoul" or "CCG"

        local missionBoards = workspace.MissionBoards:FindFirstChild(missionType)
        if not missionBoards then
         
            task.wait(0.1)
            continue
        end

        for _, board in ipairs(missionBoards:GetChildren()) do
            local holder = board:FindFirstChild("Holder")
            if not holder then continue end

            for _, mission in ipairs(holder:GetChildren()) do
                local gui = mission:FindFirstChild("SurfaceGui")
                if gui and gui:FindFirstChild("Rating") and gui.Rating:IsA("TextLabel") then
                    if gui.Rating.Text == "Hard" then
                        local clickDetector = mission:FindFirstChild("ClickDetector")
                        if clickDetector then
                            fireclickdetector(clickDetector) 
                            task.wait(0.1) 
                        end
                    end
                end
            end
        end

        task.wait(0.1) 
    end
end)



wait(2)





while _G.FARM1_ENABLED do 
    wait(0.5)
 

local torso = character:FindFirstChild("Torso")
if torso and torso:IsA("BasePart") then
    torso:Destroy() 

end
    
local ts, ch = game:GetService("TweenService"), workspace.Entities:FindFirstChild(game.Players.LocalPlayer.Name)
    if not ch then continue end 
    local rp, mi = ch:FindFirstChild("HumanoidRootPart"), ch:FindFirstChild("MissionIcon")
    if not rp or not mi then continue end 
    local ms, d = 170, 100

    
    local downPos = rp.Position - Vector3.new(0, d, 0)
    local tween1 = ts:Create(rp, TweenInfo.new((rp.Position - downPos).Magnitude / ms), {Position = downPos})
    tween1:Play()
    tween1.Completed:Wait() 

    
    _G.ENABLE_UNDERGROUND = true 

    local movePos = mi.Position - Vector3.new(0, d, 0)
    local tween2 = ts:Create(rp, TweenInfo.new((downPos - movePos).Magnitude / ms), {Position = movePos})
    tween2:Play()
    tween2.Completed:Wait() 

    
            _G.ENABLE_UNDERGROUND = false 
    local finalPos = mi.Position + Vector3.new(0, mi.Size.Y / 2, 0)
    local tween3 = ts:Create(rp, TweenInfo.new((movePos - finalPos).Magnitude / ms), {Position = finalPos})
    tween3:Play()
    tween3.Completed:Wait() 


    
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local startTime = tick()
    local gainedFound = false

    while tick() - startTime < 15 and _G.FARM1_ENABLED do
        local gui = player:FindFirstChild("PlayerGui")
        if gui then
            local notificationUI = gui:FindFirstChild("NotificationNew")
            if notificationUI and notificationUI:FindFirstChild("UI") then
                for _, template in ipairs(notificationUI.UI:GetChildren()) do
                    if template.Name == "Template" and template:FindFirstChild("TextLabel") then
                        if string.find(template.TextLabel.Text, "Gained") then
                          task.wait(5)
                            gainedFound = true 
                            break 
                        end
                    end
                end
            end
        end

        
        for _, npc in pairs(workspace.Entities:GetChildren()) do
            if npc:IsA("Model") and (npc.Name:match("^%(") or npc.Name:match("Humanoid_")) then 
                local humanoid = npc:FindFirstChildOfClass("Humanoid")
                local npcRoot = npc:FindFirstChild("HumanoidRootPart")

                if humanoid and npcRoot then
                    local distance = (rootPart.Position - npcRoot.Position).Magnitude
                    if distance <= 75 then 
                        humanoid.Health = 0 
                    end
                end
            end
        end

        if gainedFound then break end 

        task.wait(0.5) 
    end
end










                elseif name == "Event" then
                    _G.FARM2_ENABLED = true
                    
                    
                    

task.spawn(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local baseplate = nil
    local yThreshold = -324.672852 

    while _G.FARM2_ENABLED do
        local currentY = rootPart.Position.Y

        if currentY < yThreshold then
            if not baseplate then
                
                baseplate = Instance.new("Part")
                baseplate.Size = Vector3.new(10, 1, 10)
                baseplate.Position = Vector3.new(rootPart.Position.X, currentY - 3, rootPart.Position.Z)
                baseplate.Anchored = true
                baseplate.Parent = workspace
                baseplate.Transparency = 1

          
            end
        else
            if baseplate then
                baseplate:Destroy()
                baseplate = nil
           
            end
        end

        task.wait(0.1) 
    end
end)

                    
                    
                    
local player = game.Players.LocalPlayer
local character = workspace.Entities:FindFirstChild(player.Name)
if not character then return end

local torso = character:FindFirstChild("Torso")
if torso and torso:IsA("BasePart") then
    torso:Destroy() 
    task.wait(2) 
    
end
                
                




while _G.FARM2_ENABLED do
    wait(0.5)
 
local torso = character:FindFirstChild("Torso")
if torso and torso:IsA("BasePart") then
    torso:Destroy() 

end
    local tweenService = game:GetService("TweenService")
    local character = workspace.Entities:FindFirstChild(game.Players.LocalPlayer.Name)
    if not character then continue end 

    local humanoid = character:FindFirstChild("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then continue end 

    local moveSpeed = 170 
    local downOffset = 100 

    local function tweenTo(target)
        if target:IsA("Model") then
            local primaryPart = target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
            if not primaryPart then return end
            target = primaryPart
        end

        if target.Name == "Case" then
        
            return 
        end

        
        local partCenter = target.Position
        local partTop = partCenter + Vector3.new(0, target.Size.Y / 2, 0) 

        
        local downPosition = rootPart.Position - Vector3.new(0, downOffset, 0)
        local downDistance = (rootPart.Position - downPosition).Magnitude
        local downTime = downDistance / moveSpeed

        local downTween = tweenService:Create(rootPart, TweenInfo.new(downTime, Enum.EasingStyle.Linear), {Position = downPosition})
     
        downTween:Play()
        downTween.Completed:Wait()
_G.ENABLE_TELEPROTING_PATH = true 
        
        _G.ENABLE_UNDERGROUND = true 
        local targetPosition = partCenter - Vector3.new(0, downOffset, 0)
        local moveDistance = (rootPart.Position - targetPosition).Magnitude
        local moveTime = moveDistance / moveSpeed

        local moveTween = tweenService:Create(rootPart, TweenInfo.new(moveTime, Enum.EasingStyle.Linear), {Position = targetPosition})
   
        moveTween:Play()
        moveTween.Completed:Wait()

        
        rootPart.Velocity = Vector3.new(0, 0, 0)
_G.ENABLE_TELEPROTING_PATH = false
        
                _G.ENABLE_UNDERGROUND = false
        local riseDistance = (rootPart.Position - partTop).Magnitude
        local riseTime = riseDistance / moveSpeed

        local riseTween = tweenService:Create(rootPart, TweenInfo.new(riseTime, Enum.EasingStyle.Linear), {Position = partTop})
   
        riseTween:Play()
        riseTween.Completed:Wait()

        
        rootPart.Velocity = Vector3.new(0, 0, 0)

        
  
        while target.Parent do
            task.wait(0.5) 
        end
    
    end

    local debrisFolder = workspace:FindFirstChild("DebrisFolder")

    if debrisFolder then
        local parts = {}

        
        for _, obj in ipairs(debrisFolder:GetChildren()) do
            if (obj:IsA("Model") or obj:IsA("Folder")) and obj.Name ~= "Case" then
                table.insert(parts, obj)
            end
        end

        if #parts == 0 then
    
            task.wait(1) 
        else
            for _, obj in ipairs(parts) do
              
                tweenTo(obj)
            end
        end
    end
end

                    
                    
                    
                    
                    
                end
            else
                Button.Text = ""
                Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                if name == "Mission" then
                 
                    _G.FARM1_ENABLED = false
                    local text = game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("CombatTimer") and game.Players.LocalPlayer.PlayerGui.HUD.CombatTimer.Background:FindFirstChild("InCombatText")
                    if text and text.Text ~= "DEATH AWAITS" then 

workspace.Entities[game.Players.LocalPlayer.Name].Humanoid.Health = 0
end
                elseif name == "Event" then
               
                    _G.FARM2_ENABLED = false
                    
                    
                    local text = game.Players.LocalPlayer.PlayerGui.HUD:FindFirstChild("CombatTimer") and game.Players.LocalPlayer.PlayerGui.HUD.CombatTimer.Background:FindFirstChild("InCombatText")
                    if text and text.Text ~= "DEATH AWAITS" then 

workspace.Entities[game.Players.LocalPlayer.Name].Humanoid.Health = 0
end
                end
            end
        end)
    end

    
    createToggleButton("Mission", 0)
    createToggleButton("Event", 30)
end



if tab == "Teleport" then
local worlds = {
     "Anteiku", "CCG Base",  "Art Studio", "Hospital", "Construction Site", "Library",
    "Bank",
    "Park", "Helter Skelter", "Clothing Store"
}


    
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Size = UDim2.new(1, -10, 1, -30) 
    ScrollFrame.Position = UDim2.new(0, 5, 0, 15) 
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #worlds * 35) 
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.Parent = TabFrame

    for i, worldName in ipairs(worlds) do
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -10, 0, 30)
        Button.Position = UDim2.new(0, 5, 0, (i - 1) * 35) 
        Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        Button.Text = worldName
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.Code
        Button.TextSize = 14
        Button.Parent = ScrollFrame

        Button.MouseButton1Click:Connect(function()
          


local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RootPart = Character:WaitForChild("HumanoidRootPart")

local target = workspace.Areas:FindFirstChild(worldName) 

if target then
    _G.ENABLE_TELEPROTING_PATH = true 
    
    local speed = 170 
    local distance = (RootPart.Position - target.Position).Magnitude
    local time = distance / speed 

    local newPosition = target.Position - Vector3.new(0, 40, 0) 

    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear) 
    local tween = TweenService:Create(RootPart, tweenInfo, {CFrame = CFrame.new(newPosition)})
    tween:Play()

    tween.Completed:Wait() 
    _G.ENABLE_TELEPROTING_PATH = false 
else
    warn("Anteiku part not found!")
end

            
        end)
    end
end


if tab == "Credits" then
    
    local CreditLabel = Instance.new("TextLabel")
    CreditLabel.Size = UDim2.new(1, 0, 1, 0)
    CreditLabel.BackgroundTransparency = 1
    CreditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CreditLabel.TextSize = 16
    CreditLabel.Font = Enum.Font.Code
    CreditLabel.TextWrapped = true
    CreditLabel.Text = "This script has been made by Mortex, and goes under the name FixedFarm.\n\nMake sure you join our server for a daily free key!"
    CreditLabel.Parent = TabFrame

    
    local YTLINK = "https://www.youtube.com/@Mr._Stone" 
    local DCLINK = "https://discord.gg/7pQPqrhUsW" 

    
    local function createCopyButton(name, position, color, link)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 80, 0, 30) 
        Button.Position = position 
        Button.BackgroundColor3 = color 
        Button.Text = name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.Code
        Button.TextSize = 14
        Button.Parent = TabFrame

        Button.MouseButton1Click:Connect(function()
            setclipboard(link) 
            Button.Text = "Copied!"
            task.wait(2) 
            Button.Text = name
        end)
    end

    
    createCopyButton("YouTube", UDim2.new(0, 10, 0, 10), Color3.fromRGB(255, 0, 0), YTLINK)

    
    createCopyButton("Discord", UDim2.new(1, -90, 0, 10), Color3.fromRGB(88, 101, 242), DCLINK)
end






    Button.MouseButton1Click:Connect(function()
        for _, frame in pairs(TabFrames) do
        frame.Visible = false
        end
        TabFrame.Visible = true
    end)
end



UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)
    else
        CheckButton.Text = "❌ Wrong Key"
        task.wait(1)
        CheckButton.Text = "Submit"
    end
end)


YTButton.MouseButton1Click:Connect(function()
    setclipboard(YOUTUBE_LINK)
    YTButton.Text = "Copied!"
    task.wait(2)
    YTButton.Text = "YouTube"
end)


DCButton.MouseButton1Click:Connect(function()
    setclipboard(DISCORD_LINK)
    DCButton.Text = "Copied!"
    task.wait(2)
    DCButton.Text = "Discord"
end)

