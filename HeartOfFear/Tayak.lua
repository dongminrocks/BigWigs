
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Blade Lord Ta'yak", 897, 744)
if not mod then return end
mod:RegisterEnableMob(62543)

--------------------------------------------------------------------------------
-- Locals
--

local phase = 1

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L.engage_yell = "On your guard, invaders. I, Ta'yak, Lord of Blades, will be your opponent."

	L.unseenstrike, L.unseenstrike_desc = EJ_GetSectionInfo(6346)
	L.unseenstrike_icon = 122994
	L.unseenstrike_inc = "Incoming Strike!"
	L.unseenstrike_soon = "Strike in ~5-10 sec!"

	L.assault_message = "Assault"

	L.storm, L.storm_desc = EJ_GetSectionInfo(6350)
	L.storm_icon = 106996

	L.side_swap = "Side Swap"
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		{125310, "FLASHSHAKE"},
		122842, {"unseenstrike", "ICON", "SAY", "PROXIMITY"}, {123175, "PROXIMITY"}, {123474, "TANK_HEALER"}, "storm",
		"proximity", "berserk", "bosskill",
	}, {
		[125310] = "heroic",
		[122842] = "general",
	}
end

function mod:OnBossEnable()
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "TayakCasts", "boss1")
	self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "InstructorUnseenStrike", "target")

	self:Log("SPELL_CAST_START", "BladeTempest", 125310)
	self:Log("SPELL_CAST_SUCCESS", "WindStep", 123175)

	self:Log("SPELL_AURA_APPLIED", "Assault", 123474)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Assault", 123474)
	self:Log("SPELL_CAST_SUCCESS", "AssaultCast", 123474)

	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT", "CheckBossStatus")
	self:AddSyncListener("Strike")

	self:Death("Win", 62543)
end

function mod:OnEngage()
	if self:Heroic() then
		self:Bar(125310, 125310, 60, 125310) -- Blade Tempest
	end
	self:Bar(122842, "~"..self:SpellName(122842), 9.8, 122842) -- Tempest Slash
	self:Bar(123175, "~"..self:SpellName(123175), 20.5, 123175) -- Wind Step
	self:Bar("unseenstrike", 122994, 30, 122994) -- Unseen Strike
	self:Bar(123474, L["assault_message"], 15, 123474)
	self:OpenProximity(123175, 8)
	self:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", nil, "boss1")
	self:Berserk(self:LFR() and 600 or 490)
	phase = 1

	-- Engaging the boss means the Instructor is dead, so unregister this
	self:UnregisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "target")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BladeTempest(args)
	self:Message(args.spellId, args.spellName, "Important", args.spellId, "Alarm")
	self:Bar(args.spellId, args.spellName, 60, args.spellId)
	self:FlashShake(args.spellId)
end

function mod:WindStep(args)
	self:Bar(args.spellId, "~"..args.spellName, 26.5, args.spellId) --26.5-30.2
end

do
	local timer = nil
	local strike = mod:SpellName(122949)
	local function removeIcon(notBoss)
		mod:CloseProximity("unseenstrike")
		if not notBoss then
			mod:OpenProximity(123175, 8) -- Re-open normal proximity
		end
		mod:PrimaryIcon("unseenstrike")
		if timer then
			mod:CancelTimer(timer) -- Should never last this long, but no harm in it
			timer = nil
		end
	end
	local function warnStrike()
		local player = UnitDebuff("boss1target", strike) and "boss1target"
		if not player then -- Most of the time this won't run as boss1target works
			for i=1, GetNumGroupMembers() do
				local id = ("raid%d"):format(i)
				player = UnitDebuff(id, strike) and id
				if player then break end
			end
		end
		if player then
			mod:CancelTimer(timer)
			timer = nil
			local name, server = UnitName(player)
			if server then name = name .."-".. server end
			if UnitIsUnit(player, "player") then
				mod:Say("unseenstrike", strike)
			else
				mod:OpenProximity("unseenstrike", 5, name, true)
			end
			mod:TargetMessage("unseenstrike", strike, name, "Urgent", L.unseenstrike_icon, "Alert")
			mod:TargetBar("unseenstrike", strike, name, 5.6, L.unseenstrike_icon)
			mod:PrimaryIcon("unseenstrike", name)
		end
	end
	function mod:TayakCasts(_, spellName, _, _, spellId)
		if spellId == 122949 then --Unseen Strike
			self:Bar("unseenstrike", "~"..spellName, 53, L.unseenstrike_icon) -- 53-60
			self:DelayedMessage("unseenstrike", 48, L["unseenstrike_soon"], "Attention", L.unseenstrike_icon, "Alarm")
			if not timer then
				timer = self:ScheduleRepeatingTimer(warnStrike, 0.05) -- ~1s faster than boss emote
			end
			self:ScheduleTimer(removeIcon, 6.2)
		elseif spellId == 122839 then --Tempest Slash
			self:Bar(122842, "~"..spellName, self:LFR() and 20.5 or 15.6, 122842)
		elseif spellId == 123814 then --Storm Unleashed (Phase 2)
			self:Message("storm", "20% - "..CL["phase"]:format(2), "Positive", L.storm_icon, "Long")
			self:StopBar(125310) --Blade Tempest
			self:StopBar("~"..L["assault_message"])
			self:StopBar("~"..self:SpellName(122839)) --Tempest Slash
			self:StopBar("~"..self:SpellName(122949)) --Unseen Strike
			self:CancelDelayedMessage(L["unseenstrike_soon"])
			self:StopBar("~"..self:SpellName(123175)) --Wind Step
			self:CloseProximity(123175)
		end
	end

	function mod:InstructorUnseenStrike(_, _, _, _, spellId)
		if spellId == 122949 and self:GetCID(UnitGUID("target")) == 64340 then
			self:Sync("Strike") -- Instructor Maltik
		end
	end
	function mod:OnSync(sync)
		if sync == "Strike" then
			self:Bar("unseenstrike", L["unseenstrike_inc"], 6, L.unseenstrike_icon)
			if not timer then
				timer = self:ScheduleRepeatingTimer(warnStrike, 0.05)
			end
			self:ScheduleTimer(removeIcon, 6.2, "notboss")
		end
	end
end

function mod:Assault(args)
	self:LocalMessage(123474, CL["stack"], "Urgent", args.spellId, "Info", args.destName, args.amount or 1, L["assault_message"])
end

function mod:AssaultCast(args)
	-- If a tank dies from an assault, it will never apply, and the CD bar won't show. Show it on cast instead.
	self:Bar(123474, "~"..L["assault_message"], 20.4, args.spellId)

end

function mod:UNIT_HEALTH_FREQUENT(unitId)
	local hp = UnitHealth(unitId) / UnitHealthMax(unitId) * 100
	if hp < 25 and phase == 1 then -- phase starts at 20
		self:Message("storm", CL["soon"]:format(CL["phase"]:format(2)), "Positive", L.storm_icon, "Long")
		phase = 2
	elseif hp < 14 and phase == 2 then
		self:Message("storm", CL["soon"]:format(L["side_swap"]), "Positive", L.storm_icon, "Long")
		self:UnregisterUnitEvent("UNIT_HEALTH_FREQUENT", unitId)
	end
end

