if not game:IsLoaded() then
	game.Loaded:Wait()
end 

if game.PlaceId == 286090429 then
	


---------------------------------------------
--         Variables and shit lol          --
---------------------------------------------

local Hacking = false
local TimeLeft = 25
local VirtualUser = game:GetService("VirtualUser")

print("                   -----------------------------------------------------------")
print(" ")
warn("[Auto Farm] Variables are set")

print("                                               Auto Kill                      ")
print("                                    Developers: Superscripted#0201            ")
---------------------------------------------
--               Functions                 --
---------------------------------------------

function getUserRole(user, group)
	return user:GetRoleInGroup(group)
end

function hopServer()
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.playing <= 15 and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	end
end


function Main()
	coroutine.wrap(function()
		while true do
			if not Hacking then print("[XRAF] Fail Prevention: "..tostring(TimeLeft)) TimeLeft = TimeLeft - 1 else TimeLeft = 20 end
			if TimeLeft <= 1 then
				if not Hacking then hopServer() end
			end
			wait(1)
		end
	end)()

	wait(1.5)
	game.ReplicatedStorage.Events.CoolNewRemote:FireServer("MouseButton1")
	game.Players.LocalPlayer.PlayerGui.Menew.Enabled = false
	game.Players.LocalPlayer.PlayerGui.GUI.Enabled = true
	game.Players.LocalPlayer.PlayerGui.GUI.TeamSelection.Visible = false
	game.Players.LocalPlayer.PlayerGui.GUI.BottomFrame.Visible = false
	game.Players.LocalPlayer.PlayerGui.GUI.Interface.Visible = true

    repeat wait() until not game:GetService("ReplicatedStorage").wkspc.Status.RoundOver.Value == true
    
	wait(1.5)
	
	coroutine.wrap(function()
	    repeat wait() until not game:GetService("ReplicatedStorage").wkspc.Status.RoundOver.Value == true
	    game:GetService("ReplicatedStorage").Events.JoinTeam:FireServer("TBC")
	    game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
	    wait(1)
	    game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
	    wait(.5)
	    if game.Players.LocalPlayer.Status.Team.Value == "Spectator" then
	        game:GetService("ReplicatedStorage").Events.JoinTeam:FireServer("TRC")
	        game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
	        wait(1)
	        game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
	    end
	    wait(.5)
	    if game.Players.LocalPlayer.Status.Team.Value == "Spectator" then
	        game:GetService("ReplicatedStorage").Events.JoinTeam:FireServer("TYC")
	        game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
	        wait(1)
	        game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
	    end
	    wait(.5)
	    if game.Players.LocalPlayer.Status.Team.Value == "Spectator" then
	        game:GetService("ReplicatedStorage").Events.JoinTeam:FireServer("TGC")
	        game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
	        wait(1)
	        game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
	    end
	    wait(.5)
	    if game.Players.LocalPlayer.Status.Team.Value == "Spectator" then
	        game:GetService("ReplicatedStorage").Events.JoinTeam:FireServer("Random")
	        game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
	        wait(1)
	        game:GetService("ReplicatedStorage").Events.KillMe:FireServer()
	    end
	end)()
	local Burn = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Burn")
    
    local Damage = 1000/36
    local WepName = "Musket"
	coroutine.wrap(function()
		repeat
			pcall(function()
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Character and v.NRPBS.Health.Value > 0 and v.Character:FindFirstChild("Head") and v ~= game:GetService("Players").LocalPlayer then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.Head.CFrame + Vector3.new(0, 2, 2)
						if game:GetService("Players").LocalPlayer.Status.Team.Value ~= "Spectator" then
							if not Hacking then
								Hacking = true
								TimeLeft = 25
							end
							wait(0.1)
							local arguments = {
								[1] = v.Character:FindFirstChild("Head"),
								[2] = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons"):FindFirstChild(WepName),
								[3] = Damage,
								[4] = Vector3.new(v.Character:FindFirstChild("Head").Position.X, v.Character:FindFirstChild("Head").Position.Y, v.Character:FindFirstChild("Head").Position.Z)
							}
							Burn:FireServer(
								unpack(arguments)
							)
							end
						end
					end
				Hacking = false
				wait(.8)
				end)
		until game:GetService("ReplicatedStorage").wkspc.Status.RoundOver.Value == true
		
		
		wait(6.5)
		
		hopServer()
	end)()
end

warn("[Auto Farm] Functions Set")

---------------------------------------------
--          After Loaded Things            --
---------------------------------------------

coroutine.wrap(function()
	while wait(1) do
		VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(.5)
		VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end
end)()

Main()
warn("[Auto Farm] Script Loaded")
print(" ")
print("                   -----------------------------------------------------------")
else
	wait()
end