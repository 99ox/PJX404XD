local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

local highlightPrefab = script.Parent:FindFirstChild("HighlightPrefab") -- Replace with prefab name
local textLabelPrefab = script.Parent:FindFirstChild("TextLabelPrefab") -- Replace with prefab name

local function updateHighlights()
  for _, player in pairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
      local character = player.Character
      if character then
        local highlight = character:FindFirstChild("Highlight")
        if not highlight then
          highlight = highlightPrefab:Clone()
          highlight.Name = "Highlight"
          highlight.Parent = character.Torso
          highlight.CanCollide = false -- Prevent character interaction with highlight

          local textLabel = textLabelPrefab:Clone()
          textLabel.Name = "TextLabel"
          textLabel.Parent = highlight
          textLabel.Text = player.Name -- Set text to player name
          textLabel.TextSize = 12 -- Adjust text size
          textLabel.TextStrokeColor = Color3.black -- Optional text stroke for better visibility
          textLabel.TextStrokeThickness = 0.5 -- Optional text stroke thickness
        end

        local teamColor = Teams.GetTeamColor(player.Team)
        highlight.Transparency = 1 -- Initially transparent

        if player.Team == Players.LocalPlayer.Team then
          highlight.Transparency = 0.5 -- More transparent for your team
          highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Green for your team
        else
          highlight.Transparency = 0.2 -- Less transparent for other team
          highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red for other team
        end
      end
    end
  end
end

updateHighlights()

task.wait(0.2) -- Update highlights frequently (adjust as needed)
updateHighlights()
