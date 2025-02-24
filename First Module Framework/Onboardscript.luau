local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local playerProfiles = require(ServerScriptService:WaitForChild("PlayerData"))

local AllowedAnimationEvent = Instance.new("Animation")
AllowedAnimationEvent.Parent = ReplicatedStorage
AllowedAnimationEvent.Name = "AllowedAnimationEvent"


Players.PlayerAdded:Connect(function(player)
	local playerProfile = playerProfiles.new(player.UserId)
	playerProfile["Player"] = player
	
	playerProfile:LoadDataValues()
	
	print("ADDED PLAYER TO MODULE DATA")
end)
