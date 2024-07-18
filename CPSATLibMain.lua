-- Created by Frostice2013!
-- Credits to everyone I stole the code from LOL

--[[
	CPSATLib
	
	"In Albuquerque!" - Weird "Al" Yankovic
	
	Hello, dear programmer! I made CPSATLib as a library that contains functions for things 
	so you don't have to make them. Basically, this ModuleScript contains functions that you
	will probably need at some point that you have to implement that are commonplace 
	like vector rounding, CFrame to Vector3 rotation converters, decimal rounding and others.
	You may also steal from the DevForum random snippets of code if you don't know how to
	implement them, which I don't blame you because the first function I made here was
	literally code I casually grabbed from dear @royaltoe. Don't worry though, as I will list
	credits for all of the people that had their code in here.

	P.S if you wonder what CPSATLIB means it stands for "Common Place Stuff And Things Library",
	now you know!! :>

	P.S 2: Also contains useful VALUES. Hooray!
]]

local libSettings = {
	disableWarns = false;
	disableMessages = false; -- NOTE: disableWarns is seperate from disableMessages!
	disableFatals = true; -- Disables fatals. You probably don't want this off.
}

local module = {
	vanillaDatatypes = {
		stringType = type("");
		numType = type(0);
		boolType = type(true);
		funcType = type(function() end);
		nilType = type(nil); -- I don't know why we have this.
		tableType = type({});
		vectorType = type(Vector3.new(0, 0, 0));
	}
}


local function libWarn(any: any)
	if libSettings.disableWarns then
		return
	end
	
	warn("[CPSATLib / Warn]: " .. tostring(any))
end

local function libPrint(any: any)
	if libSettings.disableMessages then
		return
	end
	
	warn("[CPSATLib / Print]: " .. tostring(any))
end

local function libFatal(any: any)
	if libSettings.disableFatals then
		warn("[CPSatLib / Warn (Fatal Off)]: " .. tostring(any))
		return
	end

	error("[CPSATLib / Fatal]: " .. tostring(any))
end


function module.RoundNumber(num: number, numDecimalPlaces: number)
	--if not num == type()
	return tonumber(string.format("%." .. (numDecimalPlaces) .. "f", num))
end -- Created by: @royaltoe. Thanks!

function module.CFRameEulerToVectorXYZ(CFrame: CFrame)
	local eulerAngleX, eulerAngleY, eulerAngleZ = CFrame:ToEulerAnglesXYZ()
	return Vector3.new(
		eulerAngleX,
		eulerAngleY, 
		eulerAngleZ
	)
end -- Created by: @Frostice2013

function module.CFRameEulerToVectorYXZ(CFrame: CFrame)
	local eulerAngleX, eulerAngleY, eulerAngleZ = CFrame:ToEulerAnglesXYZ()
	return Vector3.new(
		eulerAngleY, 
		eulerAngleX, 
		eulerAngleZ
	)
end -- Created by: @Frostice2013

function module.RoundVector(vectorToRound: Vector3)
	return Vector3.new(
		math.round(vectorToRound.X), 
		math.round(vectorToRound.Y), 
		math.round(vectorToRound.Z)
	)
end

function module.RoundVectorToDecimal(vectorToRound: Vector3, vectorDecimalPlaces: number)
	local RoundedVectorX = string.format("%." .. (vectorDecimalPlaces) .. "f", vectorToRound.X)
	local RoundedVectorY = string.format("%." .. (vectorDecimalPlaces) .. "f", vectorToRound.Y)
	local RoundedVectorZ = string.format("%." .. (vectorDecimalPlaces) .. "f", vectorToRound.Z)
	return Vector3.new(
		RoundedVectorX,
		RoundedVectorY,
		RoundedVectorZ
		
	)
end -- Made by: @Frostice2013

function module.CFrameToVectorAnglesXYZ(CFrame: CFrame) -- If Euler angles aren't enough for you.

	local _, _, _, 
	CFrameRotationMatrixR00, CFrameRotationMatrixR01, CFrameRotationMatrixR02,
	CFrameRotationMatrixR10, CFrameRotationMatrixR11, CFrameRotationMatrixR12,
	CFrameRotationMatrixR20, CFrameRotationMatrixR21, CFrameRotationMatrixR22 = CFrame:GetComponents()
	-- I uncommented it. This incredibly gigantic heap of code.. Who knew a local could span for 4 entire
	-- lines?

	local CFrameRotationLookVector = CFrame.LookVector

	return Vector3.new(
		math.deg(math.atan2(CFrameRotationLookVector.Y, math.sqrt(CFrameRotationLookVector.X ^ 2 + CFrameRotationLookVector.Z ^ 2))),
		math.deg(math.atan2(CFrameRotationLookVector.X, CFrameRotationLookVector.Z)),
		math.deg(math.atan2(CFrameRotationMatrixR10, CFrameRotationMatrixR00)) -- Computed for it anyway.
	)
end -- Made by: @Frostice2013, and ChatGPT 3.5 (and possibly 4o!)

function module.VectorDistance(vectorPoint1: Vector3, vectorPoint2: Vector3)
	if type(vectorPoint1) ~= module.vanillaDatatypes.vectorType then
		return libFatal(".VectorDistance() was used with a non-vector argument! (Argument #1)")
	end
	
	if type(vectorPoint2) ~= module.vanillaDatatypes.vectorType then
		return libFatal(".VectorDistance() was used with a non-vector argument! (Argument #2)")
	end
	return (vectorPoint1 - vectorPoint2).Magnitude
end -- Made by: @Frostice2013

function module.BrickColorToColor3(brickColor: BrickColor)
	if type(brickColor) ~= type(BrickColor.new()) then
		return libWarn(".BrickColorToColor3() was used with a non BrickColor argument!")
	end
	
	return brickColor.Color
end

function module.Color3ToBrickColor(color3: Color3)
	if type(color3) ~= type(Color3.new(1, 1, 1)) then
		return libWarn(".Color3ToBrickColor() was used with a non Color3 argument!")
	end
	
	return BrickColor.new(color3)
end -- Made by: @Frostice2013

function module.ProjectVector3ToXYPlane(vector3: Vector3) 
	if type(vector3) ~= type(Vector3.new(1, 1, 1)) then
		return libWarn(".ProjectVector3ToXYPlane was used with a non Vector3 argument!")
	end
	
	return Vector3.new(
		vector3.X,
		vector3.Y,
		0
	)
end -- Made by: @Frostice2013

function module.ProjectVector3ToXZPlane(vector3: Vector3) 
	if type(vector3) ~= type(Vector3.new(1, 1, 1)) then
		return libWarn(".ProjectVector3ToXZPlane was used with a non Vector3 argument!")
	end

	return Vector3.new(
		vector3.X,
		0,
		vector3.Z
	)
end -- Made by: @Frostice2013

function module.ProjectVector3ToYZPlane(vector3: Vector3) 
	if type(vector3) ~= type(Vector3.new(1, 1, 1)) then
		return libWarn(".ProjectVector3ToYZPlane was used with a non Vector3 argument!")
	end

	return Vector3.new(
		0,
		vector3.Y,
		vector3.Z
	)
end -- Made by: @Frostice2013

function module.ConcatStringWithInbetween(str: string1, str2: string, intermediate: string)
	if type(str) ~= module.vanillaDatatypes.stringType then
		return libWarn(".ConcatStringWithInbetween() was used with a non-string argument! Argument #1")
	end
	
	if type(str2) ~= module.vanillaDatatypes.stringType then
		return libWarn(".ConcatStringWithInbetween() was used with a non-string argument! Argument #2")
	end
	
	if type(intermediate) ~= module.vanillaDatatypes.stringType then
		return libWarn(".ConcatStringWithInbetween() was used with a non-string argument! Argument #3")
	end
	
	return str .. intermediate .. str2
end

function module:GetOSTime24Hour()
	return module.ConcatStringWithInbetween(
		module.ConcatStringWithInbetween(
			os.date("%H", os.time()), 
			os.date("%M", os.time()), ":"
		), 
		os.date("%S", os.time()),
		":"
	)  -- ANOTHER ONE! GREAT!
end -- Made by: @Frostice2013

function module:GetOSTime12Hour()
	return module.ConcatStringWithInbetween(
		module.ConcatStringWithInbetween(
			os.date("%I", os.time()), os.date("%M", os.time()), ":"
		), 
		os.date("%S", os.time()),
		":"
	)  -- This giant mess of code.
end -- Made by: @Frostice2013

function module:BreakInstanceJointInstances(targetInstance: Instance) -- WILL ALSO BREAK WELDCONSTRAINTS!
	local targetInstanceDescendants = targetInstance:GetDescendants()
	
	for _, descendant: Instance in ipairs(targetInstanceDescendants) do
		if not (descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint")) then
			continue
		end
		
		descendant:Destroy()
	end
end -- Made by: @Frostice2013

function module:Ungroup(targetModel: Model)
	local modelChildren = targetModel:GetChildren()
	
	if not targetModel:IsA("Model") then
		return libWarn(":Ungroup() was called on a non-model! Be careful!")
	end
	
	for _, child: Instance in ipairs(modelChildren) do
		child.Parent = targetModel.Parent
	end
	targetModel:Destroy()
	
end -- Made by: @Frostice2013

function module:KillHumanoidWithoutShattering(targetHumanoid: Humanoid)
	if not targetHumanoid:IsA("Humanoid") then
		return libFatal(":KillHumanoidWithoutShattering() WAS USED ON A NON-HUMANOID! Please do not use this function without the argument being a Humanoid!")
	end	
	
	if targetHumanoid.Health <= 0 then
		return libWarn(":KillHumanoidWithoutShattering() was used on an already dead humanoid!")
	end	
	
	if targetHumanoid.BreakJointsOnDeath then
		return libWarn(":KillHumanoidWithoutShattering() was used on a humanoid with .BreakJointsOnDeath already active!")
	end	
	
	targetHumanoid.BreakJointsOnDeath = false
	targetHumanoid.Health = 0
end -- Made by: @Frostice2013

function module:ReturnVanillaTypes()
	return self.vanillaDatatypes -- The first use of self EVER in Frostice2013 code!
end -- Made by: @Frostice2013

return module
