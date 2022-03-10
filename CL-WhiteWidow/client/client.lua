local QBCore = exports['qb-core']:GetCoreObject()

local isPickingUp, isProcessing = false, false
local onDuty = false

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(JobInfo)
	PlayerData.job = JobInfo
end)

--// Blips \\--
Citizen.CreateThread(function()
   for _, info in pairs(Config.BlipLocation) do
	if Config.UseBlips then
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)	
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
  end	
end)

--// PickUp Weed \\--
RegisterNetEvent('CL-WhiteWidow:PickUpWeed', function()         
		if onDuty then
			isPickingUp = true
			loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
			TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
			QBCore.Functions.Progressbar("search_register", "Picking Up Weed...", 7500, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
				StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
				ClearPedTasks(GetPlayerPed(-1))		
				TriggerServerEvent('CL-WhiteWidow:pickUpWeed')
			end, function()
				ClearPedTasks(GetPlayerPed(-1))
			end)
			isPickingUp = false
		else
			QBCore.Functions.Notify('You Are Not On Duty !', 'error')
		end
end)

--// PickUp Weed Skunk \\--
RegisterNetEvent('CL-WhiteWidow:PickUpWeedSkunk', function()         
	if onDuty then
		isPickingUp = true
		loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
		TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
		QBCore.Functions.Progressbar("search_register", "Picking Up Skunk...", 7500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function()
			StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
			ClearPedTasks(GetPlayerPed(-1))		
			TriggerServerEvent('CL-WhiteWidow:pickUpSkunk')
		end, function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
		isPickingUp = false
	else
		QBCore.Functions.Notify('You Are Not On Duty !', 'error')
	end
end)

--// PickUp Weed Ak47 \\--
RegisterNetEvent('CL-WhiteWidow:PickUpWeedAk47', function()         
	if onDuty then
		isPickingUp = true
		loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
		TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
		QBCore.Functions.Progressbar("search_register", "Picking Up AK-47...", 7500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function()
			StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
			ClearPedTasks(GetPlayerPed(-1))		
			TriggerServerEvent('CL-WhiteWidow:pickUpAk47')
		end, function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
		isPickingUp = false
	else
		QBCore.Functions.Notify('You Are Not On Duty !', 'error')
	end
end)

--// PickUp Weed Og-Kush \\--
RegisterNetEvent('CL-WhiteWidow:PickUpWeedOgKush', function()         
	if onDuty then
		isPickingUp = true
		loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
		TaskPlayAnim(PlayerPedId(), 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 'weed_spraybottle_crouch_spraying_02_inspector', 8.0, -8, -1, 16, 0, 0, 0, 0, false, false, false)
		QBCore.Functions.Progressbar("search_register", "Picking Up Og-Kush...", 7500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function()
			StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_spraybottle_crouch_spraying_02_inspector", 1.0)
			ClearPedTasks(GetPlayerPed(-1))		
			TriggerServerEvent('CL-WhiteWidow:pickUpOgKush')
		end, function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
		isPickingUp = false
	else
		QBCore.Functions.Notify('You Are Not On Duty', 'error')
	end
end)

--// Trey \\--
RegisterNetEvent("CL-WhiteWidow:OpenPlate", function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "WhiteWidow Tray", {maxweight = 30000, slots = 10})
	TriggerEvent("inventory:client:SetCurrentStash", "WhiteWidow Tray") 
end)

--// Grab Cola \\--
RegisterNetEvent('CL-WhiteWidow:Client:GrabCola', function()
	if onDuty then
		TriggerServerEvent("CL-WhiteWidow:GrabCola")
	else
		QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end)

--// Grab Snack \\--
RegisterNetEvent('CL-WhiteWidow:Client:GrabSnack', function()
	if onDuty then
	  TriggerServerEvent("CL-WhiteWidow:GrabSnack")
	else
		QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end)

--// Grab Water \\--
RegisterNetEvent('CL-WhiteWidow:Client:GrabWater', function()
	if onDuty then
	  TriggerServerEvent("CL-WhiteWidow:GrabWater")
	else
		QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end)

--// Process Cannabis \\--
RegisterNetEvent('CL-WhiteWidow:Client:ProcessCannabis', function()
	QBCore.Functions.TriggerCallback('CL-WhiteWidow:HasItemProcessCannabis', function(HasItems)
		if HasItems then
			ProcessWeedCannabis()
		else
			QBCore.Functions.Notify('You Dont Have Enough Cannabis / Weed Scissors', 'error')
		end
	end)
end)

--// Process Weed Skunk \\--
RegisterNetEvent('CL-WhiteWidow:Client:ProcessSkunk', function()
	QBCore.Functions.TriggerCallback('CL-WhiteWidow:HasItemProcessSkunk', function(HasItems)
		if HasItems then
			ProcessWeedSkunk()
		else
			QBCore.Functions.Notify('You Dont Have Enough Skunk / Weed Scissors', 'error')
		end
	end)
end)

--// Process Weed Ak47 \\--
RegisterNetEvent('CL-WhiteWidow:Client:ProcessAk47', function()
	QBCore.Functions.TriggerCallback('CL-WhiteWidow:HasItemProcessAk47', function(HasItems)
		if HasItems then
			ProcessWeedAk47()
		else
			QBCore.Functions.Notify('You Dont Have Enough AK-47 / Weed Scissors', 'error')
		end
	end)
end)

--// Process Weed Og-Kush \\--
RegisterNetEvent('CL-WhiteWidow:Client:ProcessOgKush', function()
	QBCore.Functions.TriggerCallback('CL-WhiteWidow:HasItemProcessOgKush', function(HasItems)
		if HasItems then
			ProcessWeedOgKush()
		else
			QBCore.Functions.Notify('You Dont Have Enough Og-Kush / Weed Scissors', 'error')
		end
	end)
end)

--// Process Joints \\--
RegisterNetEvent('CL-WhiteWidow:Client:Joints', function()
	QBCore.Functions.TriggerCallback('CL-WhiteWidow:CheckForItemsJoint', function(HasItems)
		if HasItems then
			ProcessJoints()
		else
			QBCore.Functions.Notify('You Dont Have Any Drugs For Making Joints / Rolling Paper', 'error')
		end
	end)
end)

--// Shop \\--
RegisterNetEvent('CL-WhiteWidowShop:Open', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "WhiteWidow Shop", Config.Items)
end)

--// Stash \\--
RegisterNetEvent('CL-WhiteWidowShop:Stash', function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "WhiteWidow Storage") 
	TriggerEvent("inventory:client:SetCurrentStash", "WhiteWidow Storage")
end)

--// Duty \\--
RegisterNetEvent('CL-WhiteWidowDuty:On', function()
	onDuty = not onDuty
	if onDuty then
		QBCore.Functions.Notify("You Clocked In !")
	else
		QBCore.Functions.Notify("You Clocked Out !", "error")
	end
end)

--// Bong \\--
RegisterNetEvent("CL-WhiteWidow:Client:Bong")
AddEventHandler("CL-WhiteWidow:Client:Bong", function()
	QBCore.Functions.TriggerCallback('CL-WhiteWidow:HasItemSmokeBong', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("snort_coke", "Smoking Bong", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "anim@safehouse@bong",
				anim = "bong_stage1",
				flags = 49,
				TriggerEvent("CL-WhiteWidow:SpawnBong")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "anim@safehouse@bong", "bong_stage1", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.BongItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.BongItem], "remove")
				BongEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "anim@safehouse@bong", "bong_stage1", 1.0)
				QBCore.Functions.Notify("Canceled..", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Bong !', 'error')
		end
	end)
end)

function LoadModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Wait(10)
	end
end

RegisterNetEvent("CL-WhiteWidow:SpawnBong")
AddEventHandler("CL-WhiteWidow:SpawnBong", function()
	LoadModel('prop_bong_01')
	LoadModel("p_cs_lighter_01")
	local bong = CreateObject(GetHashKey('prop_bong_01'), GetEntityCoords(PlayerPedId()), true)
	local lighter = CreateObject(GetHashKey('p_cs_lighter_01'), GetEntityCoords(PlayerPedId()), true)
	local pedCoords = GetEntityCoords(PlayerPedId())
	local objectBong = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("prop_bong_01"), false)
	local objectLighter = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("p_cs_lighter_01"), false)
	local itemid = objectBong
	RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded('core') do
        Citizen.Wait(0)
    end
    UseParticleFxAsset("core")
    StartNetworkedParticleFxLoopedOnEntity("ent_anim_cig_smoke",objectBong,0,0,0.1, 0,0,0, 3.0, 0,0,0)
	AttachEntityToEntity(objectBong,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.10,-0.25,0.0,95.0,190.0,180.0,1,1,0,1,0,1)
	AttachEntityToEntity(objectLighter, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),28422),  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	Wait(5500)
	QBCore.Functions.Notify("You Feel A Bit High !")
	DetachEntity(objectBong, true, true)
	DeleteObject(objectBong)
	DeleteObject(objectLighter)
end)

function BongEffect()
    local startStamina = 8
    SmokingBongEffect()
	TriggerClientEvent("lj-hud:Server:RelieveStress")
    while startStamina > 0 do 
        Citizen.Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 51 then
            SmokingBongEffect()
        end
    end
    startStamina = 0
end

function SmokingBongEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Citizen.Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Citizen.Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
    StopScreenEffect("DrugsTrevorClownsFight")
    StopScreenEffect("DrugsTrevorClownsFightIn")
    StopScreenEffect("DrugsTrevorClownsFightOut")
end

--// WhiteWidows Garage \\--
RegisterNetEvent('WhiteWidow:garage')
AddEventHandler('WhiteWidow:garage', function(vehicle)
    local vehicle = vehicle
    local coords = { ['x'] = 199.30825, ['y'] = -269.8516, ['z'] = 49.924686, ['h'] = 246.63543 }
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "WHITE	"..tostring(math.random(1000, 9999)))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        SetVehicleCustomPrimaryColour(veh, 255,255,255)
        SetEntityHeading(veh, coords.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)     
end)

--// WhiteWidows Garage Store Vehicle \\--
RegisterNetEvent('WhiteWidow:storecar')
AddEventHandler('WhiteWidow:storecar', function()
    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    DeleteVehicle(car)
    DeleteEntity(car)
end)

--// WhiteWidows Garage Menu \\--
RegisterNetEvent('WhiteWidow:Garage:Menu', function()
    TriggerEvent('nh-context:createMenu', {
        {
            header = "White Widow Garage",
        },
        {
            header = "Baller",
            context = "White Widows Vehicle",
            event = "WhiteWidow:garage",
            args = { 
                "baller3",               
            }
        },
        {
            header = "Store Vehicle",
            context = "Store Vehicle Inside Garage",
            event = "WhiteWidow:storecar",
        },
		{
            header = "Close Menu",
            event = "nh-context:client:closeMenu",
        },       
    })
end)


CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        local letSleep = true
		local Player = QBCore.Functions.GetPlayerData()
        
        if Player.job.name == Config.Job then
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 196.96069, -268.2592, 50.046707, true) < 10) then
                letSleep = false
                DrawMarker(2, 196.96069, -268.2592, 50.046707, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 0, 0, 0, 222, false, false, false, true, false, false, false)
                 if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 196.96069, -268.2592, 50.046707, true) < 1.5) then
                    DrawText3D(196.96069, -268.2592, 50.046707, "~g~E~w~ - White Widow Garage") 
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("WhiteWidow:Garage:Menu")
                    end
                end  
            end
        end

        if letSleep then
            Wait(2000)
        end

        Wait(1)
    end
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

--// WhiteWidows Process Menu \\--
RegisterNetEvent('CL-WhiteWidow:Process:Menu', function()
    TriggerEvent('nh-context:createMenu', {
        {
            header = "White Widow Process",
        },
        {
            header = "Process Cannabis",
            context = "1X Cannabis 1X Weed Scissors",
            event = "CL-WhiteWidow:Client:ProcessCannabis",
        },       
		{
            header = "Process Skunk",
            context = "1X Skunk 1X Weed Scissors",
            event = "CL-WhiteWidow:Client:ProcessSkunk",
        },    
		{
            header = "Process AK-47",
            context = "1X AK-47 1X Weed Scissors",
            event = "CL-WhiteWidow:Client:ProcessAk47",
        },   
		{
            header = "Process Og-Kush",
            context = "1X Og-Kush 1X Weed Scissors",
            event = "CL-WhiteWidow:Client:ProcessOgKush",
        },   
		{
            header = "Close Menu",
            event = "nh-context:client:closeMenu",
        },   
    })
end)

--// WhiteWidows Bong Menu \\--
RegisterNetEvent('CL-WhiteWidow:OpenBong:Menu', function()
    TriggerEvent('nh-context:createMenu', {
        {
            header = "Smoke Bong",
            context = "Smoke Bong But Dont Smoke To Much Otherwise You Will Feel High !",
            event = "CL-WhiteWidow:Client:Bong",
        },        
		{
            header = "Close Menu",
            event = "nh-context:client:closeMenu",
        },   
    })
end)

--// WhiteWidows Vanding Machine Menu \\--
RegisterNetEvent('CL-WhiteWidowShop:Menu:Open', function()
	local colaprice = Config.ColaContextPrice
	local snackprice = Config.SnackContextPrice
	local waterprice = Config.WaterContextPrice
    TriggerEvent('nh-context:createMenu', {
		{
			header = "White Widow Vanding Machine",
		},
		{
			header = "Grab Cola",
			context = 'Buy Cola For ' .. colaprice,
			event = "CL-WhiteWidow:Client:GrabCola",
		},       
		{
			header = "Grab Snack",
			context = 'Buy Snack For ' .. snackprice,
			event = "CL-WhiteWidow:Client:GrabSnack",
		},    
		{
			header = "Grab Water",
			context = 'Buy Water For ' .. waterprice,
			event = "CL-WhiteWidow:Client:GrabWater",
		},   
		{
			header = "Close Menu",
			event = "nh-context:client:closeMenu",
		},  
    })
end)

--// Joints Process Menu \\--
RegisterNetEvent('CL-WhiteWidow:ProcessJoints:Menu', function()
    TriggerEvent('nh-context:createMenu', {
        {
            header = "White Widow Process Joints",
        },
        {
            header = "Roll Joints",
            context = "Required: 1X Proccesed Cannabis / Proccesed Ak-47 / Proccesed Og-Kush / Proccesed Skunk",
            event = "CL-WhiteWidow:Client:Joints",
        },       
		{
            header = "Close Menu",
            event = "nh-context:client:closeMenu",
        },   
    })
end)


CreateThread(function()
	local Player = QBCore.Functions.GetPlayerData()
		--// Shop Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowShopMenu", vector3(185.30625, -242.0963, 54.16048), 1.0, 2.2, {
			name = "WhiteWidowShopMenu",
			heading = 65.22052,
			debugPoly = false,
			minZ = 53.16048,
			maxZ = 55.16048,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidowShop:Open",
					icon = "fa fa-shop",
					label = "Open Shop",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.0
		})
		
		--// Drinks Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowDrinksMenu", vector3(187.12597, -245.377, 53.808071), 0.8, 0.8, {
			name = "WhiteWidowDrinksMenu",
			heading = 251.49156,
			debugPoly = false,
			minZ = 52.808071,
			maxZ = 54.808071,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidowShop:Menu:Open",
					icon = "fa fa-shop",
					label = "Open Vanding Machine",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.0
		})
		
		--// Pick 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick1", vector3(170.10705, -244.7768, 50.367435), 1.0, 3, {
			name = "WhiteWidowPick1",
			heading = 257.0451,
			debugPoly = false,
			minZ = 49.367435,
			maxZ = 51.367435,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick2", vector3(169.60479, -246.0026, 50.36737), 1.0, 3, {
			name = "WhiteWidowPick2",
			heading = 232.04508,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.336737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick3", vector3(169.28524, -247.451, 50.36737), 1.0, 3, {
			name = "WhiteWidowPick3",
			heading = 154.54508,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick4", vector3(168.66157, -248.5414, 50.36737), 1.0, 3, {
			name = "WhiteWidowPick4",
			heading = 174.54508,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowPick5", vector3(168.39279, -249.3025, 50.135208), 1.0, 3, {
			name = "WhiteWidowPick5",
			heading = 192.04489,
			debugPoly = false,
			minZ = 49.135208,
			maxZ = 51.135208,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeed",
					icon = "fa fa-cannabis",
					label = "Pick Cannabis",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick1", vector3(167.59107, -244.1141, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick1",
			heading = 225.96217,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick2", vector3(167.08296, -245.2875, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick2",
			heading = 138.46217,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick3", vector3(166.32737, -246.294, 50.055263), 1.0, 3, {
			name = "WhiteWidowSkunkPick3",
			heading = 193.45697,
			debugPoly = false,
			minZ = 49.055263,
			maxZ = 51.055263,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Skunk 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick4", vector3(166.34451, -247.64, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick4",
			heading = 193.45697,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.3
		})
		
		--// Pick Skunk 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowSkunkPick5", vector3(165.78178, -248.8942, 50.36737), 1.0, 3, {
			name = "WhiteWidowSkunkPick5",
			heading = 148.46218,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedSkunk",
					icon = "fa fa-cannabis",
					label = "Pick Skunk",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.3
		})
		
		--// Pick Ak47 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick1", vector3(165.09664, -243.0975, 50.36737), 1.0, 3, {
			name = "WhiteWidowAk47Pick1",
			heading = 196.58908,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick2", vector3(164.59544, -244.2542, 50.36737), 1.0, 3, {
			name = "WhiteWidowAk47Pick2",
			heading = 144.08908,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick3", vector3(164.09489, -245.5303, 50.36737), 1.0, 3, {
			name = "WhiteWidoAk47Pick3",
			heading = 151.58908,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick4", vector3(163.52682, -246.6997, 50.36737), 1.0, 3, {
			name = "WhiteWidowAk47Pick4",
			heading = 151.58908,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Ak47 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowAk47Pick5", vector3(163.30659, -247.5116, 50.364101), 1.0, 3, {
			name = "WhiteWidowAk47Pick5",
			heading = 161.46582,
			debugPoly = false,
			minZ = 49.364101,
			maxZ = 51.364101,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedAk47",
					icon = "fa fa-cannabis",
					label = "Pick AK-47",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 1 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick1", vector3(162.51042, -242.0645, 50.055507), 1.0, 3, {
			name = "WhiteWidowOgKushPick1",
			heading = 161.58906,
			debugPoly = false,
			minZ = 49.055507,
			maxZ = 51.055507,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 2 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick2", vector3(162.11291, -243.459, 50.36737), 1.0, 3, {
			name = "WhiteWidowOgKushPick2",
			heading = 161.58906,
			debugPoly = false,
			minZ = 49.36737,
			maxZ = 51.36737,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 3 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick3", vector3(162.03102, -244.4711, 50.054496), 1.0, 3, {
			name = "WhiteWidowOgKushPick3",
			heading = 161.58258,
			debugPoly = false,
			minZ = 49.054496,
			maxZ = 51.054496,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 4 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick4", vector3(161.56398, -245.8443, 50.055507), 1.0, 3, {
			name = "WhiteWidowOgKushPick4",
			heading = 161.59028,
			debugPoly = false,
			minZ = 49.055507,
			maxZ = 51.055507,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Pick Og-Kush 5 Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowOgKushPick5", vector3(161.15199, -246.9786, 50.055507), 1.0, 3, {
			name = "WhiteWidowOgKushPick5",
			heading = 161.58903,
			debugPoly = false,
			minZ = 49.055507,
			maxZ = 51.055507,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:PickUpWeedOgKush",
					icon = "fa fa-cannabis",
					label = "Pick Og-Kush",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Duty Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowDuty", vector3(184.8912, -241.8809, 54.069698), 0.6, 2.4, {
			name = "WhiteWidowDuty",
			heading = 251.634,
			debugPoly = false,
			minZ = 53.069698,
			maxZ = 55.069698,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidowDuty:On",
					icon = "fa fa-clock",
					label = "On/Off Duty",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.0
		})
		
		--// Stash Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowStash", vector3(184.17364, -244.2578, 53.918201), 1.1, 1.2, {
			name = "WhiteWidowStash",
			heading = 335.49276,
			debugPoly = false,
			minZ = 52.918201,
			maxZ = 54.918201,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidowShop:Stash",
					icon = "fa fa-box",
					label = "Storage",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Processing Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowProcess", vector3(165.55667, -235.6183, 50.681068), 1.0, 2.7, {
			name = "WhiteWidowProcess",
			heading = 166.99382,
			debugPoly = false,
			minZ = 49.681068,
			maxZ = 51.681068,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:Process:Menu",
					icon = "fa fa-smoking",
					label = "To Process Cannabis",
				  	canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
		
		--// Processing Joint Target \\--
		exports['qb-target']:AddBoxZone("WhiteWidowProcessJoints", vector3(164.46914, -233.2938, 50.274959), 1.0, 2.7, {
			name = "WhiteWidowProcessJoints",
			heading = 68.521919,
			debugPoly = false,
			minZ = 49.274959,
			maxZ = 51.274959,
		}, {
			options = {
				{
					type = "client",
					event = "CL-WhiteWidow:ProcessJoints:Menu",
					icon = "fa fa-smoking",
					label = "To Roll Joints",
					canInteract = function()
						return Player.job.name == Config.Job
					end,
				},
			},
			distance = 1.2
		})
end)

		
--// Bong 1 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu", vector3(199.3464, -247.0425, 54.2457), 1.2, 1.5, {
	name = "WhiteWidowBongMenu",
	heading = 353.21023,
	debugPoly = false,
	minZ = 53.2457,
	maxZ = 55.2457,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		
--// Bong 2 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu2", vector3(197.09948, -253.1783, 54.165195), 1.2, 1.5, {
	name = "WhiteWidowBongMenu2",
	heading = 346.44049,
	debugPoly = false,
	minZ = 53.165195,
	maxZ = 55.165195,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		
--// Bong 3 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu3", vector3(195.71369, -257.6099, 53.818511), 1.2, 1.5, {
	name = "WhiteWidowBongMenu3",
	heading = 227.85815,
	debugPoly = false,
	minZ = 52.818511,
	maxZ = 54.818511,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		
--// Bong 4 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu4", vector3(187.9223, -252.8529, 53.816345), 1.2, 1.5, {
	name = "WhiteWidowBongMenu4",
	heading = 72.709167,
	debugPoly = false,
	minZ = 52.816345,
	maxZ = 54.816345,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		
--// Bong 5 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu5", vector3(186.29193, -258.6767, 54.224903), 1.2, 1.5, {
	name = "WhiteWidowBongMenu5",
	heading = 107.33751,
	debugPoly = false,
	minZ = 53.33751,
	maxZ = 55.33751,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		
--// Bong 6 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu6", vector3(183.75531, -264.7947, 54.266479), 1.2, 1.5, {
	name = "WhiteWidowBongMenu6",
	heading = 62.859004,
	debugPoly = false,
	minZ = 53.266479,
	maxZ = 55.266479,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		 
--// Bong 7 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu7", vector3(193.70552, -263.079, 54.267448), 1.2, 1.5, {
	name = "WhiteWidowBongMenu7",
	heading = 256.74328,
	debugPoly = false,
	minZ = 53.267448,
	maxZ = 55.267448,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})
		
--// Bong 7 Target \\--
exports['qb-target']:AddBoxZone("WhiteWidowBongMenu7", vector3(192.07296, -267.7816, 53.99266), 1.2, 1.5, {
	name = "WhiteWidowBongMenu7",
	heading = 189.44303,
	debugPoly = false,
	minZ = 52.99266,
	maxZ = 54.99266,
}, {
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenBong:Menu",
			icon = "fa fa-bong",
			label = "Smoke Bong",
		},
	},
	distance = 1.3
})


				
local trayprops = {
	'bkr_prop_meth_tray_01b',
}
		
--// Trey Target \\--
exports['qb-target']:AddTargetModel(trayprops, {
	name = "WhiteWidowTray",
	options = {
		{
			type = "client",
			event = "CL-WhiteWidow:OpenPlate",
			icon = "fas fa-random",
			label = "Open Tray",
		},
	},
	distance = 1.3
})

--// Function For Processing Cannabis \\--
function ProcessWeedCannabis()
  if onDuty then
	isProcessing = true
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	TriggerServerEvent('CL-WhiteWidow:ProcessCannabis')
	QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('CL-WhiteWidow:ProcessCannabisAdd')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)
	isProcessing = false
  else
	QBCore.Functions.Notify("You Are Not On Duty !", "error")
  end
end

--// Function For Processing Skunk \\--
function ProcessWeedSkunk()
	if onDuty then
	  isProcessing = true
	  local playerPed = PlayerPedId()
	  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	  TriggerServerEvent('CL-WhiteWidow:ProcessSkunk')
	  QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		  disableMovement = true,
		  disableCarMovement = true,
		  disableMouse = false,
		  disableCombat = true,
	  }, {}, {}, {}, function()
		  ClearPedTasks(GetPlayerPed(-1))
		  TriggerServerEvent('CL-WhiteWidow:ProcessSkunkAdd')
	  end, function()
		  ClearPedTasks(GetPlayerPed(-1))
	  end)
	  isProcessing = false
	else
	  QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end

--// Function For Processing Ak47 \\--
function ProcessWeedAk47()
	if onDuty then
	  isProcessing = true
	  local playerPed = PlayerPedId()
	  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	  TriggerServerEvent('CL-WhiteWidow:ProcessAk47')
	  QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		  disableMovement = true,
		  disableCarMovement = true,
		  disableMouse = false,
		  disableCombat = true,
	  }, {}, {}, {}, function()
		  ClearPedTasks(GetPlayerPed(-1))
		  TriggerServerEvent('CL-WhiteWidow:ProcessAk47Add')
	  end, function()
		  ClearPedTasks(GetPlayerPed(-1))
	  end)
	  isProcessing = false
	else
	  QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end

--// Function For Processing Og-Kush \\--
function ProcessWeedOgKush()
	if onDuty then
	  isProcessing = true
	  local playerPed = PlayerPedId()
	  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	  TriggerServerEvent('CL-WhiteWidow:ProcessOgKush')
	  QBCore.Functions.Progressbar("search_register", "Processing...", 7500, false, true, {
		  disableMovement = true,
		  disableCarMovement = true,
		  disableMouse = false,
		  disableCombat = true,
	  }, {}, {}, {}, function()
		  ClearPedTasks(GetPlayerPed(-1))
		  TriggerServerEvent('CL-WhiteWidow:ProcessOgKushAdd')
	  end, function()
		  ClearPedTasks(GetPlayerPed(-1))
	  end)
	  isProcessing = false
	else
	  QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end

--// Function For Processing Joints \\--
function ProcessJoints()
	if onDuty then
	  isProcessing = true
	  TriggerServerEvent('CL-WhiteWidow:ProcessJoints')                                                       				
	  QBCore.Functions.Progressbar("search_register", "Rolling Joints...", 7000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	 }, {
		animDict = 'anim@amb@business@coc@coc_unpack_cut@',
		anim = 'fullcut_cycle_v6_cokecutter',
		flags = 16,
     }, {}, {}, function()
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('CL-WhiteWidow:ProcessJointsAdd')
	 end, function()
		ClearPedTasks(GetPlayerPed(-1))
	 end)     
	  isProcessing = false
	else
	  QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end

--// Function For Animations \\--
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

print("This Resources Created By Nevo#0652 For CloudDevelopment Please Aware Thats Leaking / Resselling This Resource May Get You Banned !")