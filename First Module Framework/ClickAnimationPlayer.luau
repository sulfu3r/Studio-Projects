repeat task.wait() until game.Loaded

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

local SoundAttributes = require(SoundService.SoundAttributes.PlayerAttributes)

local LocalPlayer = Players.LocalPlayer

if not LocalPlayer.Character then 
	LocalPlayer.CharacterAdded:Wait()
end

local LocalCharacter = LocalPlayer.Character
local LocalHumanoid =LocalCharacter:FindFirstChildOfClass("Humanoid")

local AllowedRemote = ReplicatedStorage.RemoteEvents:WaitForChild("PlayAnimation")
local PunchingAnimation = ReplicatedStorage.TempFolder:WaitForChild("PunchAnimation")

local HasAnimationRunning = false

if not LocalHumanoid.Animator then
	local Animator = Instance.new("Animator")
	Animator.Parent = LocalHumanoid
	
end


UserInputService.InputBegan:Connect(function(input: InputObject) 
	if input.UserInputType == Enum.UserInputType.MouseButton1 and not HasAnimationRunning then
		print("FIRING REMOTE TO SERVER")
		AllowedRemote:FireServer(tostring(PunchingAnimation.AnimationId))
	end
end)

AllowedRemote.OnClientEvent:Connect(function(animId)
	if HasAnimationRunning then
		return
	else
		local AnimationTrack = LocalHumanoid.Animator:LoadAnimation(PunchingAnimation)
		
		HasAnimationRunning = true
		print("ANIMATION TRACK RUNNING!")
		AnimationTrack:Play()
		task.wait(SoundAttributes.PunchCooldown)
		HasAnimationRunning = false
	end
end)
