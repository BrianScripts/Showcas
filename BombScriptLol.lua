-- FakeBomb DOBLE SALTO PERFECTO
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI (tu diseño)
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0,50,0,50)
button.Position = UDim2.new(0.8,0,0.7,0)
button.BackgroundColor3 = Color3.fromRGB(25,25,25)
button.Text = "2X"
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Active = true
button.Draggable = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = button

-- 🔥 DOBLE SALTO EXACTO
button.MouseButton1Click:Connect(function()
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character
    
    local tool = backpack:FindFirstChild("FakeBomb") or (character and character:FindFirstChild("FakeBomb"))

    if tool and character and character:FindFirstChild("HumanoidRootPart") then
        local remote = tool:FindFirstChild("Remote")

        if remote then
            -- Equipar (tu sistema)
            if tool.Parent ~= character then
                tool.Parent = character
            end

            local rootPart = character.HumanoidRootPart
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            
            -- 🎯 POSICIÓN MILIMÉTRICA para DOBLE SALTO
            local currentY = rootPart.Position.Y
            local bombY = currentY - 2.5  -- EXACTO para doble salto
            
            -- CFrame PERFECTO (ligeramente adelante para momentum)
            local forwardOffset = rootPart.CFrame.LookVector * 1.5  -- Momentum adelante
            local bombPosition = rootPart.Position + forwardOffset - Vector3.new(0, 2.5, 0)
            
            local doubleJumpCFrame = CFrame.new(
                bombPosition,                                    -- Posición exacta
                bombPosition + Vector3.new(0, 1, 0)              -- Mira arriba (explosión)
            )

            local args = {
                doubleJumpCFrame,  -- POSICIÓN DOBLE SALTO
                50                 -- Fuerza óptima
            }

            -- 🔥 EJECUTAR + TIMING PERFECTO
            spawn(function()
                wait(0.05)  -- Micro delay para sync
                remote:FireServer(unpack(args))
            end)
            
            print("🚀 DOBLE SALTO ACTIVADO!")
            print("📍 Bomb Y:", bombY)
        end
    end
end)

print("✅ DOBLE SALTO FakeBomb - Precisión perfecta!")
print("🎮 Cómo usar:")
print("1. Salta UNA vez")
print("2. Inmediatamente toca '2X'")
print("3. 💥 DOBLE SALTO!")
