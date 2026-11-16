-- PLAYER ESP
-- Client-side visual ESP

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function createESP(player)
    if player == LocalPlayer then return end

    local function setup(character)
        local old = character:FindFirstChild("MyESP")
        if old then old:Destroy() end

        local highlight = Instance.new("Highlight")
        highlight.Name = "MyESP"
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character

        local head = character:WaitForChild("Head", 5)
        if not head then return end

        local gui = Instance.new("BillboardGui")
        gui.Name = "MyESPName"
        gui.Size = UDim2.fromOffset(200, 40)
        gui.StudsOffset = Vector3.new(0, 3, 0)
        gui.AlwaysOnTop = true
        gui.Parent = head

        local label = Instance.new("TextLabel")
        label.Size = UDim2.fromScale(1, 1)
        label.BackgroundTransparency = 1
        label.Text = player.Name
        label.TextColor3 = Color3.fromRGB(0, 255, 0)
        label.TextStrokeTransparency = 0
        label.TextScaled = true
        label.Parent = gui
    end

    if player.Character then
        setup(player.Character)
    end

    player.CharacterAdded:Connect(setup)
end

for _, player in ipairs(Players:GetPlayers()) do
    createESP(player)
end

Players.PlayerAdded:Connect(createESP)

print("ESP Loaded!")
