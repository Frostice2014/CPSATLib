# INSTRUCTIONS
**WARNING! FOLLOW THESE INSTRUCTIONS OR ELSE CPSATLib MAY NOT WORK!**

1. Place `CPSATLib` in `game.ReplicatedStorage` or `game.ServerScriptService` depending on the use case. I prefer to place it in `game.ReplicatedStorage`.
2. If `CPSATLibTesting` is included, DISABLE OR DELETE IT. You can disable it by turning off the `Enabled` property in the script under `Behavior`. *Make sure you don't turn off `CPSATLib!`*
3. If you really need `CPSATLibTesting` for some reason, place it in `game.ServerScriptService.` and leave it enabled.

# CPSATLib
CPSATLib is a Roblox ModuleScript library for functions that you probably have to implement, that you don't have to place in your code anymore! An example is simply rounding to a decimal. Instead of having to implement this `local function roundDecimal()` in your code

```
local function roundToDecimal(num: number, numDecimalPlaces: number)
	return tonumber(string.format("%." .. (numDecimalPlaces) .. "f", num))
end -- Grabbed from @royaltoe LOL.
local playerAltitude = playerCharacter:GetPivot().Position.Y
local playerAltitudeRounded -- nil.

```

instead you could just `require()` CPSATLib.

```
-- Inside this example altitude script. NOTE: playerCharacter does not exist as an *actual variable*.
local CPSATLib = require(game.ReplicatedStorage["CPSATLib 1.0.0"])
local playerAltitude = playerCharacter:GetPivot().Position.Y
local playerAltitudeRounded -- nil.

playerAltitudeRounded = CPSATLib.RoundNumber(playerAltitude, 1)
```

```
-- Inside CPSATLib..
function module.RoundNumber(num: number, numDecimalPlaces: number) -- numDecimalPlaces is how many places to round to. Place in an INTEGER here!
	if type(num) ~= module.vanillaDatatypes.numType then
		return libWarn(".RoundNumber() was used wwith a non-number argument! Argument #1")
	end
	
	if type(numDecimalPlaces) ~= module.vanillaDatatypes.numType then
		return libWarn(".RoundNumber() was used wwith a non-number argument! Argument #2")
	end
	
	return tonumber(string.format("%." .. (numDecimalPlaces) .. "f", num))
end -- Created by: @royaltoe. Thanks!
```
Basically, you don't have to reinvent the wheel *again*.
It doesn't just include a single function, it has so many more functions! There's `.VectorDistance()`, `.BrickColorToColor3()`, `.CFrameToVectorAnglesXYZ()`, `.RoundVector()`, `:GetOSTime24Hour()` and so many more! If I ever take a function from the DevForum, they will be credited in a comment at the end of the function. You can see for yourself!
Credit me and all of the people who I took the functions from if you can. Toodles!
