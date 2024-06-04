local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local Components = require(ReplicatedStorage.Shared.components)
local Matter = require(ReplicatedStorage.Packages.matter)

--[[

Adds a gui to any entity with a nametag that doesn't have one

--]]
local function nametags(world: Matter.World)
	for id, _, model, nametag in world:query(Components.Entity, Components.Model, Components.Nametag) do
		if nametag.gui == nil then
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Size = UDim2.new(0, 200, 0, 50)
			billboardGui.Adornee = model.model
			billboardGui.Parent = Player.PlayerGui

			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.Text = nametag.name
			textLabel.Parent = billboardGui

			world:remove(id, Components.Nametag)
			world:insert(
				id,
				Components.Nametag({
					name = nametag.name,
					gui = billboardGui,
				})
			)
		end
	end
end

return nametags
