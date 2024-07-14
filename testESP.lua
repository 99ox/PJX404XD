-- LocalScript in StarterPlayerScripts

-- Function to create a highlight and text label for a player's torso
local function highlightPlayerTorso(player)
    -- Ensure the character exists
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Wait for the torso part to be present
    local torso = character:WaitForChild("Torso") or character:WaitForChild("UpperTorso")
    
    -- Create a Highlight instance
    local highlight = Instance.new("Highlight")
    highlight.Name = "TorsoHighlight"
    highlight.Adornee = torso
    highlight.FillColor = Color3.fromRGB(255, 215, 0)  -- Gold color
    highlight.FillTransparency = 0.5  -- Semi-transparent fill
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  -- White outline
    highlight.OutlineTransparency = 0  -- No transparency for the outline
    highlight.Parent = torso

    -- Create a BillboardGui for the TextLabel
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = torso
    billboardGui.Size = UDim2.new(4, 0, 1, 0)
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = torso

    -- Create the TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1  -- No background
    textLabel.Text = player.Name  -- Display player name
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    textLabel.TextScaled = true  -- Scale text to fit
    textLabel.Parent = billboardGui
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
