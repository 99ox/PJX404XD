-- LocalScript in StarterPlayerScripts

-- Function to create colored outlines and name/tag displays for a player
local function highlightPlayer(player)
    -- Ensure the character exists
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Wait for the torso part to be present
    local torso = character:WaitForChild("Torso") or character:WaitForChild("UpperTorso")
    
    -- Create a colored outline for the torso (optional)
    local outline = Instance.new("Outline")
    outline.Name = "TorsoOutline"
    outline.Adornee = torso
    outline.Thickness = 4  -- Adjust outline thickness
    outline.Color = Color3.fromRGB(255, 255, 255)  -- White outline (optional)  -- Remove for transparency
    outline.Parent = torso  -- Comment out if not using outline

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
    -- Set color based on team membership
    if isCop(player) then  -- Replace 'isCop' with your team check logic
        nameTextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)  -- Blue for cops
    else
        nameTextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)  -- Green for prisoners
    end
    nameTextLabel.TextScaled = true  -- Scale text to fit
    nameTextLabel.Parent = nameBillboardGui

    local tagTextLabel = Instance.new("TextLabel")
    tagTextLabel.Size = UDim2.new(1, 0, 1, 0)
    tagTextLabel.BackgroundTransparency = 1  -- No background
    -- Replace "YourTagSource" with the way you access player tags
    tagTextLabel.Text = player["YourTagSource"]  -- Display player tag
    -- Set color based on team membership
    if isCop(player) then
        tagTextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)  -- Blue for cops
    else
        tagTextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)  -- Green for prisoners
    end
    tagTextLabel.TextScaled = true  -- Scale text to fit
    tagTextLabel.Parent = tagBillboardGui
end

-- Function to check if a player is a cop (replace with your actual logic)
local function isCop(player)
    -- Implement your method to determine if a player is on the cop team
    -- This could involve checking a property, group membership, or other logic
    return -- Replace with your actual return value (true if cop, false otherwise)
end

-- Function to handle new players joining
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayer(player)
    end
