﻿------------------------------
--      Are you local?    --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Nightbane"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

--[[
n phase1 (on the ground) he has a fear and sometimes at a random player the ground is burning and do aoe dmg to ppl on it.
fear cooldown seems to be 30-40seconds, at least enough that one warrior can tank it without fearward.
every 25% he going into the air. one person will get "rain of bones" debuff and will damage nearby people. 
5 skeletons spawn and nightbane will cast some damage spell on some people. after some time he will come back.
]]--

----------------------------
--      Localization     --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Nightbane",

	fear_cmd = "fear",
	fear_name = "Fear Alert",
	fear_desc = "Warn for Bellowing Roar",

	fear_you = "You",
	fear_trigger = "^([^%s]+) ([^%s]+) afflicted by Bellowing Roar",
	fear_warn = "AoE Fear - ~30 seconds until next!",
	fear5sec_warn = "~5 sec until AoE Fear",
	fear_bar = "AoE Fear", 
	
} end )

----------------------------------
--    Module Declaration   --
----------------------------------

BigWigsNightbane = BigWigs:NewModule(boss)
BigWigsNightbane.zonename = AceLibrary("Babble-Zone-2.2")["Karazhan"]
BigWigsNightbane.enabletrigger = boss
BigWigsNightbane.toggleoptions = {"fear", "bosskill"}
BigWigsNightbane.revision = tonumber(string.sub("$Revision$", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsNightbane:OnEnable()
	prior = nil
	self:RegisterEvent("BigWigs_RecvSync")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckRoar")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckRoar")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckRoar")

	self:TriggerEvent("BigWigs_ThrottleSync", "NightbaneFear", 5)
end

------------------------------
--     Event Handlers    --
------------------------------

function BigWigsNightbane:BigWigs_RecvSync( sync, rest, nick )
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
	elseif sync == "NightbaneFear" and self.db.profile.fear then
		self:Bar( L["fear_bar"], 30, "Spell_Shadow_PsychicScream" )
		self:Message( L["fear_warn"], "Important" )
		self:DelayedMessage( 25, L["fear5sec_warn"], "Urgent" )
	end
end

function BigWigsNightbane:CheckRoar( msg )
	if not prior and msg:find( L["fear_trigger"] ) then
		self:Sync( "NightbaneFear" )
		prior = true
	end
end

function BigWigsNightbane:BigWigs_Message( text )
	if text == L["fear5sec_warn"] then prior = nil end
end
