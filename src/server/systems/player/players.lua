local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = require(ReplicatedStorage.Shared.components)
local Matter = require(ReplicatedStorage.Packages.matter)

local function players(world: Matter.World)
	for _, player in ipairs(Players:GetPlayers()) do
		for _, character in Matter.useEvent(player, "CharacterAdded") do
			world:spawn(
				Components.Model({
					model = character,
				}),
				Components.Player({
					name = player.Name,
				}),
				Components.Entity(),
				Components.Nametag({
					name = player.Name,
				})
			)
		end
	end
end

return players
