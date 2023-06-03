-- Author      : LoaStaub
-- Create Date : 01.06.2023 22:52:42

-- /dump select(4, GetBuildInfo())

SLASH_UNMARKER1 = "/unmarker"

SlashCmdList["UNMARKER"] = function(msg)
	Frame1:Show()
end

local frame = CreateFrame("Frame")
local ownGuid = UnitGUID("player")
local warnCounter = 0

function frame:CHAT_MSG_TARGETICONS(text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, languageID, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
	locClass, engClass, locRace, engRace, gender, name, server = GetPlayerInfoByGUID(ownGuid)
	if string.find(text, name)
	then
		local index = 0
		local evildoer
		for w in string.gmatch(text, "%a+") do
			index = index + 1
			if index == 2 then
				evildoer = w
			end
		end
		inInstance, instanceType = IsInInstance()
		if instanceType == "pvp" and UnmarkerDB.PVP == true then
			WarnThem(evildoer)
		elseif instanceType == "arena" and UnmarkerDB.PVP == true then
			WarnThem(evildoer)
		elseif instanceType == "party" and UnmarkerDB.Dungeons == true then
			WarnThem(evildoer)
		elseif instanceType == "raid" and UnmarkerDB.Raids == true then
			WarnThem(evildoer)
		elseif instanceType == "none" and UnmarkerDB.OpenWorld == true then
			WarnThem(evildoer)
		end		
	end
end

function WarnThem(evildoer)
	SendChatMessage(evildoer.." STOP CASTING ICONS ON ME! NOW!" ,"PARTY")
	SetRaidTarget("player", 0)
	if UnmarkerDB.Kick == true then
		warnCounter = warnCounter + 1
		if tostring(warnCounter) == UnmarkerDB.Times then
			warnCounter = 0
			SendChatMessage(evildoer.." I WILL KICK YOU NOW!" ,"PARTY")
		end
	end
end

function frame:ZONE_CHANGED_NEW_AREA()
	warnCounter = 0
end

frame:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...)
end)


frame:RegisterEvent("CHAT_MSG_TARGETICONS")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")