local player = game.Players.LocalPlayer

        loadstring(game:HttpGet("https://raw.githubusercontent.com/module-upvr/Scripts/refs/heads/main/AllGuestGreenBelt.txt"))()

        local function isInRound()
            local char = player.Character
            if not char then return false end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return false end
            local lobbyPos = Vector3.new(-3586, 22, 268)
            return (hrp.Position - lobbyPos).Magnitude > 1000
        end

        local function isGuest()
            local data = player:FindFirstChild("PlayerData")
            if not data then return false end
            local purchased = data:FindFirstChild("Purchased")
            if not purchased then return false end
            local survivors = purchased:FindFirstChild("Survivors")
            if not survivors then return false end
            return survivors:FindFirstChild("Guest1337") ~= nil
        end

        local skinApplied = false

        local function applySkin()
            if skinApplied then return end
            local char = player.Character
            if not char then return end

            for _, v in pairs(char:GetChildren()) do
                if v:IsA("Shirt") then v:Destroy() end
                if v:IsA("Pants") then v:Destroy() end
            end

            local headband = Instance.new("Accessory")
            local scarf = Instance.new("Accessory")
            local shirt = Instance.new("Shirt")
            local pants = Instance.new("Pants")

            local headbandhandle = Instance.new("Part")
            local scarfhandle = Instance.new("Part")
            local headbandhandleattach = Instance.new("Attachment")
            local scarfhandleattach = Instance.new("Attachment")
            local headbandweld = Instance.new("Weld")
            local scarfweld = Instance.new("Weld")

            scarfhandle.Name = "Handle"
            headbandhandle.Name = "Handle"
            scarfhandle.CanCollide = false
            headbandhandle.CanCollide = false

            local headbandmesh = Instance.new("SpecialMesh")
            local scarfmesh = Instance.new("SpecialMesh")

            shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=836903658"
            pants.PantsTemplate = "http://www.roblox.com/asset/?id=731578592"
            shirt.Parent = char
            pants.Parent = char

            headband.Parent = char
            scarf.Parent = char
            scarfhandle.Parent = scarf
            headbandhandle.Parent = headband
            headbandhandleattach.Parent = headbandhandle
            scarfhandleattach.Parent = scarfhandle
            headbandmesh.Parent = headbandhandle
            scarfmesh.Parent = scarfhandle

            headbandhandle.Color = Color3.fromRGB(27, 42, 53)
            scarfhandle.Color = Color3.fromRGB(27, 42, 53)

            headbandweld.Parent = headbandhandle
            headbandweld.Name = "AccessoryWeld"
            headbandweld.Part0 = headbandhandle
            headbandweld.Part1 = char.Head
            headbandweld.C0 = CFrame.new(0, 0, 0)
            headbandweld.C1 = CFrame.new(0, 0, 0)

            scarfweld.Parent = scarfhandle
            scarfweld.Name = "AccessoryWeld"
            scarfweld.Part0 = scarfhandle
            scarfweld.Part1 = char.Torso
            scarfweld.C0 = CFrame.new(0, -0.4, 0)
            scarfweld.C1 = CFrame.new(0, 0, 0)

            headbandmesh.MeshId = "http://www.roblox.com/asset/?id=20407184"
            headbandmesh.Scale = Vector3.new(1.103, 1.071, 1.103)
            scarfmesh.MeshId = "http://www.roblox.com/asset/?id=99856331"
            scarfmesh.Scale = Vector3.new(1.071, 1.071, 1.071)
            scarfmesh.VertexColor = Vector3.new(1, 2, 1)

            headbandhandleattach.Name = "HatAttachment"
            headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)
            scarfhandleattach.Name = "NeckAttachment"
            scarfhandleattach.CFrame = CFrame.new(0, 0.519, 0)

            headband:SetAttribute("GuestSkin", true)
            scarf:SetAttribute("GuestSkin", true)
            shirt:SetAttribute("GuestSkin", true)
            pants:SetAttribute("GuestSkin", true)
            headbandhandle:SetAttribute("GuestSkin", true)
            scarfhandle:SetAttribute("GuestSkin", true)

            pcall(function()
                local playerinfo = player.PlayerGui.TemporaryUI.PlayerInfo
                playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=97047410245118"
            end)

            skinApplied = true
        end

        local function removeSkin()
            if not skinApplied then return end
            local char = player.Character
            if not char then skinApplied = false return end

            for _, v in pairs(char:GetDescendants()) do
                if v:GetAttribute("GuestSkin") then
                    v:Destroy()
                end
            end
            skinApplied = false
        end

        local function updateSkin()
            if isGuest() and isInRound() then
                applySkin()
            else
                removeSkin()
            end
        end

        task.spawn(function()
            while task.wait(1) do
                updateSkin()
            end
        end)

        player.CharacterAdded:Connect(function()
            task.wait(1)
            skinApplied = false
            updateSkin()
        end)

        updateSkin()