# Very sticky situation
local function sticky()
	print("sticky")
	SetCVar("deselectOnClick", "0")
end

local function unsticky()
	print("unsticky")
	SetCVar("deselectOnClick", "1")
end

local function OnEvent(self, event, ...)
	if event == "LOOT_OPENED" then
		if IsInInstance("raid") then
			sticky()
		end
	elseif event == "LOOT_CLOSED" then
		if IsInInstance("raid") then
			unsticky()	
		end
	elseif event == "ADDON_LOADED" then
		if (select(1,...)) == "StickyLootWindow" then
			StickyLootWindow:UnregisterEvent("ADDON_LOADED")
		end
	end
end		
		
StickyLootWindow = CreateFrame("Frame")
StickyLootWindow:SetScript("OnEvent", OnEvent)
StickyLootWindow:RegisterEvent("ADDON_LOADED")