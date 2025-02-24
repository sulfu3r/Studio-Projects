local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PunchCooldown = LocalPlayer:GetAttribute("PunchCooldown")

local IsHitting = false
local FirstHit = false

local HitModels = {}

local clear = table.clear
local insert = table.insert

function CreateNoCollisonConstraints(Location1: Model, Location2: BasePart)
	for _, Part in pairs(Location1:GetChildren()) do
		if Part:IsA("Part") or Part:IsA("BasePart") then 
			local NoCollison = Instance.new("NoCollisionConstraint")
			
			NoCollison.Parent = Location2
			NoCollison.Part0 = Location2
			NoCollison.Part1 = Part
		end
	end
end

UserInputService.InputBegan:Connect(function(UserInput)
	if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
		if IsHitting then return end
		
		local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded
		
		if LocalCharacter then 
			local LocalRoot = LocalCharacter.HumanoidRootPart or LocalCharacter.PrimaryPart
			local Hitbox = ReplicatedStorage.TempFolder.HitboxExample:Clone()

			Hitbox.Color = Color3.new(0.666667, 0, 0)
			Hitbox.Transparency = 1
			Hitbox.Parent = workspace
			Hitbox.CanTouch = true			
			Hitbox.Orientation = LocalRoot.Orientation
			
			local forwardOffset = LocalRoot.CFrame.LookVector * 2
			
			CreateNoCollisonConstraints(LocalCharacter, Hitbox)
			
			Hitbox:PivotTo(LocalRoot.CFrame + forwardOffset)
			
			Hitbox.Touched:Connect(function(TouchedPart)
				local Parent = TouchedPart.Parent
				
				if not TouchedPart:IsDescendantOf(LocalCharacter) then
					if Parent:IsA("Model") and Parent:FindFirstChild("Humanoid") then 
						if not HitModels[Parent] and not FirstHit then
							insert(HitModels, Parent)
							
							Parent:FindFirstChild("Humanoid").Health -= 10 
							Hitbox:Destroy()
							FirstHit = true
						end
					end
				end
			end)

			
			IsHitting = true
			task.wait(PunchCooldown)
			IsHitting = false
			FirstHit = false
			
			pcall(function()
				if Hitbox then
					Hitbox:Destroy()
					clear(HitModels)
				end
			end)
		end
	end
end)
