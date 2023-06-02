-- Author      : Taurentius
-- Create Date : 01.06.2023 22:52:42

SLASH_UNMARKER1 = "/unmarker"

SlashCmdList["UNMARKER"] = function(msg)
    print("Funktioniert")
	Frame1:Show()
end

local frame = CreateFrame("Frame")
local ownGuid = UnitGUID("player")

function frame:CHAT_MSG_TARGETICONS(text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, languageID, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
	print("MARKED")
	print("text")
	print(text) -- [ ist 1
	locClass, engClass, locRace, engRace, gender, name, server = GetPlayerInfoByGUID(ownGuid)
	print("name")
	print(name)
	if string.find(text, name)
	then
		print("FUNKTIONIERT")
		local index = 0
		local evildoer
		for w in string.gmatch(text, "%a+") do
			index = index + 1
			if index == 2 then
				evildoer = w
				print(evildoer)
			end
		end
		-- SendChatMessage(text ,"PARTY")
		SendChatMessage("STOP IT NOW" ,"SAY")
		SetRaidTarget("player", 0)
	end
end

frame:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...)
end)

frame:RegisterEvent("CHAT_MSG_TARGETICONS")
