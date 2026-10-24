local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")

        local player = Players.LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local camera = workspace.CurrentCamera

        local survivorsFolder = workspace:WaitForChild("Players"):WaitForChild("Survivors")

        local SMOOTHNESS = 0.25
        local TOGGLE_KEY = Enum.KeyCode.E
        local LOCK_PART = "HumanoidRootPart"

        local CAM_DIST = 16
        local CAM_HEIGHT = 7
        local LOOK_HEIGHT = 1

        local lockedTarget = nil
        local isLocking = false

        local function isMyCharacter(model)
            local myChar = player.Character
            if model == myChar then return true end
            if model.Name == player.Name then return true end
            if model.Name == player.DisplayName then return true end

            local plr = Players:GetPlayerFromCharacter(model)
            if plr == player then return true end

            return false
        end

        local function getClosestSurvivor()
            local closest = nil
            local minScreenDist = math.huge
            local screenCenter = camera.ViewportSize / 2

            for _, model in ipairs(survivorsFolder:GetChildren()) do
                if model:IsA("Model") and not isMyCharacter(model) then
                    local hrp = model:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position)

                        if onScreen then
                            local dx = screenPos.X - screenCenter.X
                            local dy = screenPos.Y - screenCenter.Y
                            local dist = math.sqrt(dx * dx + dy * dy)

                            if dist < minScreenDist then
                                minScreenDist = dist
                                closest = model
                            end
                        end
                    end
                end
            end
            return closest
        end

        local function restoreCamera()
            camera.CameraType = Enum.CameraType.Custom
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    camera.CameraSubject = humanoid
                end
            end
        end

        local gui = Instance.new("ScreenGui")
        gui.Name = "AimLockUI"
        gui.ResetOnSpawn = false
        gui.IgnoreGuiInset = true
        gui.Parent = playerGui

        local dragFrame = Instance.new("Frame")
        dragFrame.Size = UDim2.new(0, 160, 0, 44)
        dragFrame.Position = UDim2.new(0, 20, 0.5, -22)
        dragFrame.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
        dragFrame.BorderSizePixel = 0
        dragFrame.Active = true
        dragFrame.Parent = gui

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = dragFrame

        local lockBtn = Instance.new("TextButton")
        lockBtn.Size = UDim2.new(1, 0, 1, 0)
        lockBtn.BackgroundTransparency = 1
        lockBtn.Text = "杀手aimlock"
        lockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        lockBtn.Font = Enum.Font.GothamBold
        lockBtn.TextSize = 15
        lockBtn.Parent = dragFrame

        local dragging = false
        local activeTouch = nil
        local dragStart = nil
        local startPos = nil
        local moved = false

        local function startDrag(input)
            if dragging then return end

            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                activeTouch = input
                moved = false
                dragStart = input.Position
                startPos = dragFrame.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                        activeTouch = nil
                    end
                end)
            end
        end

        dragFrame.InputBegan:Connect(startDrag)
        lockBtn.InputBegan:Connect(startDrag)

        UserInputService.InputChanged:Connect(function(input)
            if not dragging then return end
            if input ~= activeTouch then return end

            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragStart
                if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
                    moved = true
                end
                dragFrame.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end)

        local function toggleLock()
            if isLocking then
                isLocking = false
                lockedTarget = nil
                lockBtn.Text = "杀手aimlock"
                dragFrame.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
                restoreCamera()
            else
                local target = getClosestSurvivor()
                if target then
                    lockedTarget = target
                    isLocking = true
                    lockBtn.Text = "杀手aimlock (已锁)"
                    dragFrame.BackgroundColor3 = Color3.fromRGB(60, 160, 90)
                end
            end
        end

        lockBtn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                if not moved then
                    toggleLock()
                end
            end
        end)

        UserInputService.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.KeyCode == TOGGLE_KEY then
                toggleLock()
            end
        end)

        RunService.RenderStepped:Connect(function()
            if not isLocking or not lockedTarget then
                return
            end

            local part = lockedTarget:FindFirstChild(LOCK_PART)
            if not part then
                isLocking = false
                lockedTarget = nil
                lockBtn.Text = "杀手aimlock"
                dragFrame.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
                restoreCamera()
                return
            end

            local myChar = player.Character
            if not myChar then return end
            local myHrp = myChar:FindFirstChild("HumanoidRootPart")
            if not myHrp then return end

            camera.CameraType = Enum.CameraType.Scriptable

            local myPos = myHrp.Position
            local targetPos = part.Position

            local dir = Vector3.new(targetPos.X - myPos.X, 0, targetPos.Z - myPos.Z)
            if dir.Magnitude < 0.1 then
                dir = myHrp.CFrame.LookVector
            else
                dir = dir.Unit
            end

            local camPos = myPos - dir * CAM_DIST + Vector3.new(0, CAM_HEIGHT, 0)
            local lookAt = Vector3.new(targetPos.X, targetPos.Y + LOOK_HEIGHT, targetPos.Z)

            local newCFrame = CFrame.new(camPos, lookAt)

            if SMOOTHNESS > 0 then
                camera.CFrame = camera.CFrame:Lerp(newCFrame, SMOOTHNESS)
            else
                camera.CFrame = newCFrame
            end
        end)

        survivorsFolder.ChildRemoved:Connect(function(child)
            if child == lockedTarget then
                isLocking = false
                lockedTarget = nil
                lockBtn.Text = "杀手aimlock"
                dragFrame.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
                restoreCamera()
            end
        end)