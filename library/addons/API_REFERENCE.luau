--!strict
--[[
	konata.funs — Luau API Reference
	================================
	Documentation-only module. Do not require this file at runtime.
	Load main.luau as the library entry point.

	CORE
	----
	local Facility = require(path.To.main) -- adapt to your loader
	local window = Facility:Window(options: WindowOptions): Window

	WindowOptions:
		Title: string?              Window title.
		Suffix: string?             Title suffix.
		Width, Height: number?      Initial logical dimensions in pixels.
		Position: UDim2?            Initial position.
		TabStyle: "side" | "top"?   Sidebar (default) or horizontal tabs.
		TabWidth: number?           Sidebar width; default 140.
		Collapsible: boolean?       Allow sidebar collapse; default true.
		Collapsed: boolean?         Start with collapsed sidebar.
		CollapsedWidth: number?     Width while collapsed.
		Search: boolean?            Search field in sidebar mode.
		SearchWidth: number?        Search field width.
		SearchPlaceholder: string?  Search placeholder.
		Responsive: boolean?        Viewport-aware scale; default true.
		Animations: boolean?        Enable tweens; default true.
		Glass: boolean?             Transparent panels; default true.
		GlassBlur: boolean?         Background blur; default true.
		GlassStrength: number?      Glass amount, clamped to 0..1.5.
		MobileButton: boolean?      Touch-friendly open button.
		Footer: boolean?            Show footer.
		MinWidth, MinHeight: number? Minimum logical window dimensions.

	WINDOW
	------
	window:Tab(name: string, icon: string?): Tab
	window:SetTab(tab: Tab): void
	window:SetVisible(visible: boolean): void
	window:SetSize(width: number, height: number): void
	window:SetUserScale(scale: number): number -- clamped to 0.6..1.4
	window:SetOpacity(alpha: number): number -- clamped to 0.2..1
	window:SetCollapsed(collapsed: boolean): boolean
	window:ToggleCollapsed(): boolean
	window:SetResponsive(enabled: boolean): boolean
	window:IconAction(icon: string, callback: () -> (), order: number?): Instance?
	window:Modal(options: table): Modal
	window:Confirm(options: table): void

	TABS / SECTIONS
	---------------
	tab:Section(title: string, columnIndex: number?): Section
	tab:Column(index: number): Column
	tab:Full(title: string): Section
	tab:Block(): Frame
	column:Section(title: string): Section

	CONTROLS
	--------
	Section:Toggle(options: table): Control
	Section:Slider(options: table): Control
	Section:Dropdown(options: table): Control
	Section:Input(options: table): Control
	Section:Keybind(options: table): Control
	Section:Button(options: table): Instance
	Section:ButtonRow(buttons: {table}): Instance
	Section:Label(text: string): Control
	Section:Divider(): Instance
	Section:ColorPicker(options: table): Control
	Section:Search(options: table): Control

	Common control options (where supported):
		Text: string
		Flag: string | false
		Default: any
		Hint: string?
		Callback: (value: any) -> ()
		Options: {string}?       Dropdown values.
		Min, Max: number?        Slider bounds.
		Suffix: string?          Slider suffix.
		Placeholder: string?    Input placeholder.
	Most controls expose :Get() and :Set(value, silent?) where applicable.
	Dropdown controls additionally expose :SetOptions(options).

	THEME MANAGER
	-------------
	Facility.ThemeManager:Apply(name: string): boolean
	Facility.ThemeManager:SetAccent(color: Color3 | string): boolean
	Facility.ThemeManager:Names(): {string}
	Facility.ThemeManager:Save(): boolean
	Facility.ThemeManager:Load(): boolean
	Facility.ThemeManager:Mount(window: Window?): Modal?
	Facility.ThemeManager:SetFolder(folder: string): ()

	SAVE MANAGER
	------------
	Facility.SaveManager:Save(name: string): (boolean, string)
	Facility.SaveManager:Load(file: string): (boolean, string)
	Facility.SaveManager:Delete(file: string): (boolean, string)
	Facility.SaveManager:List(): {string}
	Facility.SaveManager:SetAutoload(file: string): boolean
	Facility.SaveManager:GetAutoload(): string?
	Facility.SaveManager:ClearAutoload(): ()
	Facility.SaveManager:LoadAutoloadConfig(): boolean
	Facility.SaveManager:SetIgnoreIndexes(flags: {string}): ()
	Facility.SaveManager:IgnoreThemeSettings(): ()
	Facility.SaveManager:SetFolder(folder: string): ()

	INTERFACE MANAGER
	-----------------
	Facility.InterfaceManager:SetLibrary(library: table): ()
	Facility.InterfaceManager:SetWindow(window: Window): ()
	Facility.InterfaceManager:SetFolder(folder: string): ()
	Facility.InterfaceManager:GetWindow(): Window?
	Facility.InterfaceManager:BuildInterfaceSection(tab: Tab, column: number?): Section

	GLASS / MOTION / HOTKEYS
	-----------------------
	Facility:SetGlass(enabled: boolean): boolean
	Facility:SetGlassBlur(enabled: boolean): boolean
	Facility:SetGlassStrength(amount: number): number
	Facility:SetAnimationsEnabled(enabled: boolean): boolean
	Facility:GetAnimationsEnabled(): boolean
	Facility:CreateHotkeyPanel(options: table?): Frame
	Facility:SetHotkeysVisible(visible: boolean): ()
	Facility:RefreshHotkeys(): ()

	NOTIFICATIONS
	-------------
	Facility:Notify(options: table): any
	Facility:Warn(title: string, text: string, duration: number?): any
	Facility:Error(title: string, text: string, duration: number?): any
	Facility:Success(title: string, text: string, duration: number?): any

	CONFIG EXAMPLE
	--------------
	local SaveManager = Facility.SaveManager
	SaveManager:SetFolder("MyProject")
	SaveManager:IgnoreThemeSettings()
	SaveManager:Save("default.json")
	SaveManager:Load("default.json")

	NOTES
	-----
	1. Filesystem and clipboard support depend on optional host functions.
	2. TabStyle = "top" preserves the former horizontal navigation.
	3. This file is a reference module, not a runtime dependency.
]]
return {}
