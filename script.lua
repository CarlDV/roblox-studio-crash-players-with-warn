local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local soundIds = {
	"rbxassetid://151281180", "rbxassetid://12222058",
	"rbxassetid://12222124", "rbxassetid://12222216",
	"rbxassetid://262562442", "rbxassetid://298144581",
	"rbxassetid://130767645", "rbxassetid://12222280",
}

local function createPopup()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = playerGui

	for _ = 1, math.random(15, 25) do
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(0, math.random(150, 600), 0, math.random(70, 300))
		textLabel.Position = UDim2.new(math.random(), 0, math.random(), 0)
		textLabel.Text = math.random(1, 3) == 1 and "HI" or math.random(1, 3) == 1 and "HELLO" or "MEOW"
		textLabel.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random())
		textLabel.TextColor3 = Color3.new(math.random(), math.random(), math.random())
		textLabel.Font = Enum.Font.Fantasy
		textLabel.TextScaled = true
		textLabel.Rotation = math.random(-360, 360)
		textLabel.Parent = screenGui

		local sound = Instance.new("Sound")
		sound.SoundId = soundIds[math.random(1, #soundIds)]
		sound.Volume = math.random(5, 10)
		sound.PlaybackSpeed = math.random(0.5, 2)
		sound.Looped = true
		sound.Parent = screenGui
		sound:Play()
	end
end

local function createScreenDistortion()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = playerGui

	for _ = 1, math.random(15, 30) do
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(math.random(0.2, 1), 0, math.random(0.2, 1), 0)
		frame.Position = UDim2.new(math.random(), 0, math.random(), 0)
		frame.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random())
		frame.BorderSizePixel = math.random(1, 30)
		frame.Parent = screenGui

		game:GetService("RunService").Stepped:Connect(function()
			frame.BackgroundTransparency = math.random()
			frame.Size = UDim2.new(math.random(0.1, 1), 0, math.random(0.1, 1), 0)
			frame.Position = UDim2.new(math.random(), 0, math.random(), 0)
			frame.Rotation = math.random(-360, 360)
		end)
	end
end

local function spamEffects()
	while true do
		if math.random() > 0.3 then
			createPopup()
		else
			createScreenDistortion()
		end
	end
end

local function showFinalCountdownUI()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0.3, 0, 0.2, 0)
	frame.Position = UDim2.new(0.35, 0, 0.4, 0)
	frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	frame.Parent = screenGui

	local countdownLabel = Instance.new("TextLabel")
	countdownLabel.Size = UDim2.new(1, 0, 1, 0)
	countdownLabel.Position = UDim2.new(0, 0, 0, 0)
	countdownLabel.TextColor3 = Color3.new(1, 1, 1)
	countdownLabel.Font = Enum.Font.SourceSansBold
	countdownLabel.TextSize = 36
	countdownLabel.BackgroundTransparency = 1
	countdownLabel.Text = "15"
	countdownLabel.Parent = frame

	for timer = 15, 1, -1 do
		countdownLabel.Text = tostring(timer)
		wait(1)
	end

	player:Kick("To avoid device crashes or overheating, you've been kicked.")
end

local function showTimerUI()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0.3, 0, 0.2, 0)
	frame.Position = UDim2.new(0.35, 0, 0.4, 0)
	frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	frame.Parent = screenGui

	local countdownLabel = Instance.new("TextLabel")
	countdownLabel.Size = UDim2.new(1, 0, 1, 0)
	countdownLabel.Position = UDim2.new(0, 0, 0, 0)
	countdownLabel.TextColor3 = Color3.new(1, 1, 1)
	countdownLabel.Font = Enum.Font.SourceSansBold
	countdownLabel.TextSize = 36
	countdownLabel.BackgroundTransparency = 1
	countdownLabel.Text = "5"
	countdownLabel.Parent = frame

	for timer = 5, 1, -1 do
		countdownLabel.Text = tostring(timer)
		wait(1)
	end

	screenGui:Destroy()
	spamEffects()
end

local function createConfirmationDialog()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0.4, 0, 0.6, 0)
	frame.Position = UDim2.new(0.3, 0, 0.2, 0)
	frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	frame.Parent = screenGui

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0.2, 0)
	textLabel.Position = UDim2.new(0, 0, 0, 0)
	textLabel.Text = "Would you really like to execute this?"
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.TextSize = 24
	textLabel.BackgroundTransparency = 1
	textLabel.Parent = frame

	local yesButton = Instance.new("TextButton")
	yesButton.Size = UDim2.new(0.4, 0, 0.1, 0)
	yesButton.Position = UDim2.new(0.1, 0, 0.7, 0)
	yesButton.Text = "Yes"
	yesButton.TextColor3 = Color3.new(1, 1, 1)
	yesButton.Font = Enum.Font.SourceSansBold
	yesButton.TextSize = 24
	yesButton.BackgroundColor3 = Color3.new(0.3, 0.7, 0.3)
	yesButton.Parent = frame

	local noButton = Instance.new("TextButton")
	noButton.Size = UDim2.new(0.4, 0, 0.1, 0)
	noButton.Position = UDim2.new(0.5, 0, 0.7, 0)
	noButton.Text = "No"
	noButton.TextColor3 = Color3.new(1, 1, 1)
	noButton.Font = Enum.Font.SourceSansBold
	noButton.TextSize = 24
	noButton.BackgroundColor3 = Color3.new(0.7, 0.3, 0.3)
	noButton.Parent = frame

	local effectListLabel = Instance.new("TextLabel")
	effectListLabel.Size = UDim2.new(1, 0, 0.7, 0)
	effectListLabel.Position = UDim2.new(0, 0, 0.2, 0)
	effectListLabel.Text = "Prepare for severe chaos, with unpredictable visual and audio spamming.\n\nDo not proceed if you value device stability."
	effectListLabel.TextColor3 = Color3.new(1, 1, 1)
	effectListLabel.Font = Enum.Font.SourceSansBold
	effectListLabel.TextSize = 20
	effectListLabel.TextWrapped = true
	effectListLabel.BackgroundTransparency = 1
	effectListLabel.Parent = frame

	yesButton.MouseButton1Click:Connect(function()
		screenGui:Destroy()
		showTimerUI()
	end)

	noButton.MouseButton1Click:Connect(function()
		screenGui:Destroy()
	end)
end

createConfirmationDialog()
