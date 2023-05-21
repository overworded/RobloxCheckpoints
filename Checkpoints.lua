local ValueName = "Checkpoint" -- what you want the value name to be (will be stored in the player)
local Checkpoints = workspace.Checkpoints -- where checkpoints are located

for i,v in next,(Checkpoints:GetChildren()) do -- loop through all checkpoints
	v.Touched:Connect(function(touched) -- add a touched event to all checkpoints
		if touched.Name == "HumanoidRootPart" then -- only detect humanoid root parts
			local Plr = game.Players:GetPlayerFromCharacter(touched.Parent)
			local val = Plr:FindFirstChild(ValueName) -- find the value
			if val ~= v then -- if value isnt the current checkpoint, then continue
				val.Value = v -- set the value to the current checkpoint
			end
		end
	end)
end

game.Players.PlayerAdded:Connect(function(Plr) -- when the player joins the game
	local Val = Instance.new("ObjectValue", Plr) -- making checkpoint value
	Val.Name = ValueName
	
	Plr.CharacterAdded:Connect(function(Char) -- when the player spawns/respawn 
		if Val.Value ~= nil then -- if there is a value
			wait(0.05) -- idk why i had to do this but roblox is weird
			Char:MoveTo(Val.Value.Position) -- move the character to the checkpoint!
		end
	end)
end)
