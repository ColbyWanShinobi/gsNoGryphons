--[[
gsNoGryphons
Created by ColbyWanShinobi
email: colbywanshinobi@gameshaman.com
web: gameshaman.com
repo: https://github.com/ColbyWanShinobi/gsNoGryphons.git
--]]

print("gsNoGryphons by gameshaman.com - Addon Loaded");

-- Diagnostic: Check what UI elements exist
print("gsNoGryphons DEBUG: Checking UI elements...");
print("MainActionBar exists:", MainActionBar ~= nil);
print("MainActionBar.EndCaps exists:", MainActionBar and MainActionBar.EndCaps ~= nil);
print("MainMenuBarLeftEndCap exists:", MainMenuBarLeftEndCap ~= nil);
print("MainMenuBarRightEndCap exists:", MainMenuBarRightEndCap ~= nil);
print("MainMenuBarArtFrame exists:", MainMenuBarArtFrame ~= nil);
print("MainMenuBar exists:", MainMenuBar ~= nil);
print("MainMenuBar.EndCaps exists:", MainMenuBar and MainMenuBar.EndCaps ~= nil);

-- Function to hide gryphons
local function HideGryphons()
    local hidden = false;

    -- Check for the latest structure first (Patch 12.0.0+)
    if MainActionBar and MainActionBar.EndCaps then
        MainActionBar.EndCaps:Hide();
        MainActionBar.EndCaps:SetAlpha(0);
        hidden = true;
        print("gsNoGryphons: Hidden Patch 12.0+ EndCaps");
    end

    -- Classic UI
    if MainMenuBarLeftEndCap then
        MainMenuBarLeftEndCap:Hide();
        MainMenuBarLeftEndCap:SetAlpha(0);
        hidden = true;
        print("gsNoGryphons: Hidden Classic LeftEndCap");
    end

    if MainMenuBarRightEndCap then
        MainMenuBarRightEndCap:Hide();
        MainMenuBarRightEndCap:SetAlpha(0);
        hidden = true;
        print("gsNoGryphons: Hidden Classic RightEndCap");
    end

    -- Modern Retail UI
    if MainMenuBarArtFrame then
        if MainMenuBarArtFrame.LeftEndCap then
            MainMenuBarArtFrame.LeftEndCap:Hide();
            MainMenuBarArtFrame.LeftEndCap:SetAlpha(0);
            hidden = true;
            print("gsNoGryphons: Hidden Modern Retail LeftEndCap");
        end

        if MainMenuBarArtFrame.RightEndCap then
            MainMenuBarArtFrame.RightEndCap:Hide();
            MainMenuBarArtFrame.RightEndCap:SetAlpha(0);
            hidden = true;
            print("gsNoGryphons: Hidden Modern Retail RightEndCap");
        end
    end

    -- Older Retail UI
    if MainMenuBar and MainMenuBar.EndCaps then
        if MainMenuBar.EndCaps.LeftEndCap then
            MainMenuBar.EndCaps.LeftEndCap:Hide();
            MainMenuBar.EndCaps.LeftEndCap:SetAlpha(0);
            hidden = true;
            print("gsNoGryphons: Hidden Older Retail LeftEndCap");
        end

        if MainMenuBar.EndCaps.RightEndCap then
            MainMenuBar.EndCaps.RightEndCap:Hide();
            MainMenuBar.EndCaps.RightEndCap:SetAlpha(0);
            hidden = true;
            print("gsNoGryphons: Hidden Older Retail RightEndCap");
        end
    end

    if not hidden then
        print("gsNoGryphons: Warning - Could not find gryphon UI elements. They may have been moved in this WoW version.");
    end

    return hidden;
end

-- Create a frame to listen for events
local frame = CreateFrame("Frame");

-- Event handler
frame:RegisterEvent("PLAYER_LOGIN");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
frame:SetScript("OnEvent", function(self, event)
    print("gsNoGryphons: " .. event .. " fired, hiding gryphons...");
    HideGryphons();
end);

-- Also try hiding immediately on load
HideGryphons();

--Print a status message
print("gsNoGryphons: Setup complete!");
