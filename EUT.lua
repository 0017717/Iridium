local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local rs = game:GetService('ReplicatedStorage')
local runs = game:GetService('RunService')

local Window =
    Library:CreateWindow(
    {
        Title = "Iridium",
        Footer = "ALPHA-01 | EUT | by NoWhereToE",
        Icon = nil,
        NotifySide = "Right",
        ShowCustomCursor = false,
        AutoShow = true
    }
)

local Tabs = {
    Home = Window:AddTab("Home", "user"),	
	Automation = Window:AddTab("Automation", "bot"),
	Upgrades = Window:AddTab("Upgrades", "circle-fading-arrow-up"),
	Cards = Window:AddTab("Cards", "club"),
    Puzzles = Window:AddTab("Puzzles", "puzzle"),
	Misc = Window:AddTab("Misc", "circle-minus"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings")
}
--// Home UI
	--// Groupboxes
local LGB = Tabs.Home:AddLeftGroupbox("Information")
local RGB = Tabs.Home:AddRightGroupbox("Updates")
	--// Information Box
local I1 = LGB:AddLabel({Text = "Name: "..plr.Name.."\nExecutor: "..identifyexecutor() or "N/A".."", DoesWrap = true})
--// Automation UI

--// Upgrades UI

--// Cards UI

--// Puzzles UI

--// Misc UI

--// UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = false,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightControl", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("Iridium")
SaveManager:SetFolder("Iridium/EUT")

SaveManager:BuildConfigSection(Tabs["UI Settings"])

ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()

Library:Notify({
    Title = "Iridium",
    Description = "Script loaded successfully, script is in development, expect bugs and errors.",
    Time = 7.7
})
