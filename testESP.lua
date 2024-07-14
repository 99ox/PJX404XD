-- LocalScript in StarterPlayerScripts

-- Function to create a colored outline for player's torso
local function highlightPlayerTorso(player)
    -- Ensure the character exists
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Wait for the torso part to be present
    local torso = character:WaitForChild("Torso") or character:WaitForChild("UpperTorso")
    
    -- Create an Outline instance
    local outline = Instance.new("Outline")
    outline.Name = "TorsoOutline"
    outline.Adornee = torso
    outline.Thickness = 4  -- Adjust outline thickness

    -- Check team membership (replace with your actual logic)
    local isTeammate = -- Check if player is on your team (replace with your condition)
    
    -- Set outline color based on team
    if isTeammate then
        outline.Color = Color3.fromRGB(0, 255, 0)  -- Green for teammates
    else
        outline.Color = Color3.fromRGB(255, 0, 0)  -- Red for enemies
    end

    outline.Parent = torso

    -- Create separate BillboardGuis for name and tag
    local nameBillboardGui = Instance.new("BillboardGui")
    nameBillboardGui.Adornee = torso
    nameBillboardGui.Size = UDim2.new(2, 0, 1, 0.5)  -- Half size for name
    nameBillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)  -- Slightly lower offset
    nameBillboardGui.AlwaysOnTop = true
    nameBillboardGui.Parent = torso

    local tagBillboardGui = Instance.new("BillboardGui")
    tagBillboardGui.Adornee = torso
    tagBillboardGui.Size = UDim2.new(2, 0, 1, 0.5)  -- Half size for tag
    tagBillboardGui.StudsOffset = Vector3.new(0, 3.5, 0)  -- Slightly higher offset
    tagBillboardGui.AlwaysOnTop = true
    tagBillboardGui.Parent = torso

    -- Create TextLabels for name and tag
    local nameTextLabel = Instance.new("TextLabel")
    nameTextLabel.Size = UDim2.new(1, 0, 1, 0)
    nameTextLabel.BackgroundTransparency = 1  -- No background
    nameTextLabel.Text = player.Name  -- Display player name
    -- Set your desired color for teammate names
    nameTextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)  -- Green (example)
    nameTextLabel.TextScaled = true  -- Scale text to fit
    nameTextLabel.Parent = nameBillboardGui

    local tagTextLabel = Instance.new("TextLabel")
    tagTextLabel.Size = UDim2.new(1, 0, 1, 0)
    tagTextLabel.BackgroundTransparency = 1  -- No background
    -- Replace "YourTagSource" with the way you access player tags
    tagTextLabel.Text = player["YourTagSource"]  -- Display player tag
    -- Set your desired color for enemy names
    tagTextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red (example)
    tagTextLabel.TextScaled = true  -- Scale text to fit
    tagTextLabel.Parent = tagBillboardGui
end

-- Function to handle new players joining
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayerTorso(player)
    end)
    if player.Character then
        highlightPlayerTorso(player)
    end
end

-- Connect to existing players
for _, player in pairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Connect to new players joining
game.Players.PlayerAdded:Connect(onPlayerAdded)
