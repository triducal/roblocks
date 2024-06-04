local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Matter = require(ReplicatedStorage.Packages.matter)

return {
	Model = Matter.component("Model") :: { model: Model },
	Health = Matter.component("Health") :: { health: number, maxHealth: number },
	Player = Matter.component("Player") :: { name: string },
	Nametag = Matter.component("Nametag") :: { name: string, gui: BillboardGui },
	Entity = Matter.component("Entity"),
	Block = Matter.component("Block") :: { type: string, active: boolean },
}
