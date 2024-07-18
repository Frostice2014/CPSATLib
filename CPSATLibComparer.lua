-- Created by Frostice2013 for CPSATLib testing.
--[[
    ALERT! ALERT! HEY, YOU! KEEP THIS SCRIPT INACTIVE! DISABLE IT BY GOING TO THE PROPERTIES AND CLICKING THE ENABLED CHECKBOX UNDER "BEHAVIOR". THANK YOU! HAVE A NICE DAY
]]

local CPSatLib = require(game.ReplicatedStorage["CPSATLib 1.0.0"])
local eulerAngleX, eulerAngleY, eulerAngleZ = CFrame.Angles(math.rad(45), 0, 0):ToEulerAnglesXYZ()

print(CPSatLib.CFrameToVectorXYZ(CFrame.Angles(math.rad(45), 0, 0)))
print(Vector3.new(math.deg(eulerAngleX), math.deg(eulerAngleY), math.deg(eulerAngleZ)))
