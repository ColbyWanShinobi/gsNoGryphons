--[[
gsNoGryphons
Created by ColbyWanShinobi
email: colbywanshinobi@gameshaman.com
web: gameshaman.com
repo: https://github.com/ColbyWanShinobi/gsNoGryphons.git
--]]

print("gsNoGryphons by gameshaman.com - Addon Loaded");

-- Check for the latest structure first (Patch 12.0.0+)
if MainActionBar and MainActionBar.EndCaps then
    print("gsNoGryphons: Found Patch 12.0+ UI. Removing Gryphons...");

    --Hide the EndCaps frame (contains both gryphons/wyverns)
    MainActionBar.EndCaps:Hide();
elseif MainMenuBarLeftEndCap then
    print("gsNoGryphons: Found Classic UI. Removing Gryphons...");

    --Hide the Left Gryphon
    MainMenuBarLeftEndCap:Hide();

    --Hide the Right Gryphon
    MainMenuBarRightEndCap:Hide();
elseif MainMenuBarArtFrame then
    print("gsNoGryphons: Found Modern Retail UI. Removing Gryphons...");

    --Hide the Left Gryphon
    if MainMenuBarArtFrame.LeftEndCap then
        MainMenuBarArtFrame.LeftEndCap:Hide();
    end

    --Hide the Right Gryphon
    if MainMenuBarArtFrame.RightEndCap then
        MainMenuBarArtFrame.RightEndCap:Hide();
    end
elseif MainMenuBar and MainMenuBar.EndCaps then
    print("gsNoGryphons: Found Older Retail UI. Removing Gryphons...");

    --Hide the Left Gryphon
    MainMenuBar.EndCaps.LeftEndCap:Hide();

    --Hide the Right Gryphon
    MainMenuBar.EndCaps.RightEndCap:Hide();
else
    print("gsNoGryphons: Warning - Could not find gryphon UI elements. They may have been moved in this WoW version.");
end

--Print a status message
print("gsNoGryphons: Gryphons have been removed!");
