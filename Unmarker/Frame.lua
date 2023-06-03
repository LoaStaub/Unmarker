-- Author      : LoaStaub
-- Create Date : 01.06.2023 21:46:03

function ButtonAccept_OnClick()
	UnmarkerDB.OpenWorld = CheckButtonOpenWorld:GetChecked()
	UnmarkerDB.PVP = CheckButtonPVP:GetChecked()
	UnmarkerDB.Raids = CheckButtonRaids:GetChecked()
	UnmarkerDB.Kick = CheckButtonKick:GetChecked()
	UnmarkerDB.Times = EditBoxTimes:GetText()
	UnmarkerDB.Dungeons = CheckButtonDungeons:GetChecked()
	Frame1:Hide()
end

function ButtonAbort_OnClick()
	Frame1:Hide()
end

function Frame1_OnShow()
	if not UnmarkerDB then
		UnmarkerDB = {}
		Frame1:Hide()
	end
	CheckButtonPVP:SetChecked(UnmarkerDB.PVP)
	CheckButtonDungeons:SetChecked(UnmarkerDB.Dungeons)
	CheckButtonOpenWorld:SetChecked(UnmarkerDB.OpenWorld)
	CheckButtonRaids:SetChecked(UnmarkerDB.Raids)
	CheckButtonKick:SetChecked(UnmarkerDB.Kick)
	EditBoxTimes:SetText(UnmarkerDB.Times)
end

function Unmarker()
	Frame1:Show()

end

