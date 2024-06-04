local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Player = Players.LocalPlayer
local Components = require(ReplicatedStorage.Shared.components)
local Matter = require(ReplicatedStorage.Packages.matter)

--[[

Adds a gui to any entity with a nametag that doesn't have one

--]]
local function nametags(world: Matter.World)
	for id, _, model, nametag in world:query(Components.Entity, Components.Model, Components.Nametag) do
		if nametag.gui == nil then
			local billboardGui = StarterGui.Nametag:Clone()
			billboardGui.Adornee = model.model
			billboardGui.Parent = Player.PlayerGui
			billboardGui.TextLabel.Name = nametag.name

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
