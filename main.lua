ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShavtaredObjavtect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)



Citizen.CreateThread(function()
	local ped = GetPlayerPed(-1)
	local id = PlayerId()
	local serverid = GetPlayerServerId(id)
	while true do
		Citizen.Wait(500)
		if IsPedArmed(ped, 7) then
			ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
				if not hasWeaponLicense then
					RemoveAllPedWeapons(ped, false)
				end
			end, serverid, 'weapon')
		end
	end
end)

