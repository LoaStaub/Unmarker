-- Author      : Taurentius
-- Create Date : 01.06.2023 21:46:03

function ButtonAccept_OnClick()
	print("Taurentius: Save")
	UnmarkerDB.OpenWorld = CheckButtonOpenWorld:GetChecked()
	UnmarkerDB.PVP = CheckButtonPVP:GetChecked()
	UnmarkerDB.Raids = CheckButtonRaids:GetChecked()
	UnmarkerDB.Kick = CheckButtonKick:GetChecked()
	UnmarkerDB.Times = EditBoxTimes:GetText()
	UnmarkerDB.Dungeons = CheckButtonDungeons:GetChecked()
	print("Taurentius: Save success")
end

function ButtonAbort_OnClick()
	Frame1:Hide()
end

function Frame1_OnShow()
	print("OnShow Step 1")
	if not UnmarkerDB then
		print("OnShow INIT DB")
		UnmarkerDB = {}
		UnmarkerDB.Times = "3"
		Frame1:Hide()
	end
	print("OnShow Step 2")
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

