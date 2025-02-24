local PlayerProfiles = {}
local PlayerProfile = {}

local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local ListOfAllowedAnimations = require(ServerScriptService.AllowedAnimations)
local ListOfNeededAttributes = require(SoundService.SoundAttributes.PlayerAttributes)

function PlayerProfile:LoadDataValues()
	for attribute, value in pairs(ListOfNeededAttributes) do 
		local Player = self.Player
		
		Player:SetAttribute(attribute, value)
	end
end

function PlayerProfile:PlayAnimation(chosen_animation)
	local RemoteReference = ReplicatedStorage.RemoteEvents:WaitForChild("PlayAnimation")

	if RemoteReference then 
		RemoteReference:FireAllClients(self.Player, chosen_animation)
	end
end

function PlayerProfile:M1()
	self:PlayAnimation(ListOfAllowedAnimations["M1"])
	print("Called M1!")
end




function PlayerProfiles.new(id)
	local newProfile = {}

	-- Set metatable to inherit from PlayerProfile
	setmetatable(newProfile, { __index = PlayerProfile })

	PlayerProfiles[tostring(id)] = newProfile
	return newProfile
end

return PlayerProfiles
