--[[
gsNoGryphons
Created by ColbyWanShinobi
email: colbywanshinobi@gameshaman.com
web: gameshaman.com
repo: https://github.com/ColbyWanShinobi/gsNoGryphons.git
--]]

print("gsNoGryphons by gameshaman.com");
print("gsNoGryphons: Addon Loaded");

if MainMenuBarLeftEndCap then
    print("gsNoGryphons: Found Classic UI. Removing Gryphons...");
    
    --Hide the Left Gryphon
    MainMenuBarLeftEndCap:Hide();

    --Hide the Right Gryphon
    MainMenuBarRightEndCap:Hide();
else
    print("gsNoGryphons: Found Retail. Removing Gryphons...");

    --Hide the Left Gryphon
    MainMenuBarArtFrame.LeftEndCap:Hide();

    --Hide the Right Gryphon
    MainMenuBarArtFrame.RightEndCap:Hide();
end

--Print a status message
print("gsNoGryphons: Gryphons have been removed!");
