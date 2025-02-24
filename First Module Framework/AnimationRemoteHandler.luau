local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local ListOfAllowedAnims = require(ServerScriptService.AllowedAnimations)
local playerProfiles = require(ServerScriptService:WaitForChild("PlayerData"))

local AllowedEvent = ReplicatedStorage.RemoteEvents:WaitForChild("PlayAnimation")


AllowedEvent.OnServerEvent:Connect(function(plr, chosen_animation)
	local PlayerProfile = playerProfiles[tostring(plr.UserId)]
	
	local AllowedMethods = {
		["M1"] = PlayerProfile:M1()
	}
	
	
	for AnimationID, _ in ListOfAllowedAnims do 
		if AnimationID == chosen_animation then 
			local CorrespondingMethodName = ListOfAllowedAnims[chosen_animation]
			local UserProfileTable = playerProfiles[tostring(plr.UserId)]
			
			for MethodIndex, _ in UserProfileTable do 
				if MethodIndex == CorrespondingMethodName then
					print("hello")
				end
			end
		else
			warn("TRIED TO SEND ANIMATION OUTSIDE ALLOWED LIST.")
		end
	end
end)
