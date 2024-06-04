local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local Components = require(ReplicatedStorage.Shared.components)
local Matter = require(ReplicatedStorage.Packages.matter)

--[[

Adds a nametag component and instance to any player without one.

--]]
local function nametag(world: Matter.World)
	for id, player, model in world:query(Components.Player, Components.Model):without(Components.Nametag) do
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Size = UDim2.new(0, 200, 0, 50)
		billboardGui.Adornee = model.model:FindFirstChild("Head")
		billboardGui.Parent = Player.PlayerGui

		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.Text = player.name
		textLabel.Parent = billboardGui

		world:insert(
			id,
			Components.Nametag({
				name = player.name,
				gui = billboardGui,
			})
		)
	end
end

return nametag
