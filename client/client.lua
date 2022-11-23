local QBCore = exports['qb-core']:GetCoreObject()

---Checks if the specified vehicle has back engine
---@param veh vehicle
---@return boolean
local function IsBackEngine(veh)
	if BackEngineVehicles[veh] then 
        return true 
    else 
        return false 
    end
end

local isOpen = false

RegisterNUICallback('closenui', function(data)
    isOpen = false
    SetNuiFocus(false,false)
end)

-- Command
RegisterCommand('vehinfo', function()
    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player)
    if veh ~= 0 then
        VehicleInfoMenu()
        SetNuiFocus(true, true)
    else 
        QBCore.Functions.Notify(Lang:t('error.needvehicle'), 'error')
    end
end, false)
 
-- Keymapping
RegisterKeyMapping('vehinfo', Lang:t('text.description'), 'keyboard', 'u')

-- Events
RegisterNetEvent("moditems:client:installMod", function(mod, type, itemName)
    local veh = QBCore.Functions.GetClosestVehicle()
    local currentmod = GetVehicleMod(veh, mod)
    local maxtype = GetNumVehicleMods(veh, mod) - 1 
    if mod == 18 then
        if IsToggleModOn(veh) then
            QBCore.Functions.Notify(Lang:t('error.alreadyinstalled'), "error")
        end
    else
        if maxtype < type then
            QBCore.Functions.Notify(Lang:t('error.nosupport'), "error")
            return
        end
        if currentmod == type then
            QBCore.Functions.Notify(Lang:t('error.alreadyinstalled'), "error")
            return
        end
    end

    if veh ~= nil and veh ~= 0 then
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehpos = GetEntityCoords(veh)
		if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
			local drawpos = GetOffsetFromEntityInWorldCoords(veh, 0, 2.5, 0)
			if (IsBackEngine(GetEntityModel(veh))) then
				drawpos = GetOffsetFromEntityInWorldCoords(veh, 0, -2.5, 0)
			end
			if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                if mod ~= nil and type ~= nil and itemName ~= nil then
                    local modmax = GetVehiclenumbre
                    InstallMod(veh, mod, type, itemName)
                else
                    QBCore.Functions.Notify(Lang:t('wrong'), 'error')
                end
			end
		else
			if #(pos - vehpos) > 4.9 then
				QBCore.Functions.Notify(Lang:t('error.farfromvehicle'), "error")
			else
				QBCore.Functions.Notify(Lang:t('error.insidevehicle'), "error")
			end
		end
	else
		if veh == nil or veh == 0 then
			QBCore.Functions.Notify(Lang:t('error.farfromvehicle'), "error")
        else
            QBCore.Functions.Notify(Lang:t('error.alreadyinstalled'), "error")
		end
	end
end)

-- Functions
---Installs the specified mod leve in a specified vehicle consuming the specified item
---@param veh vehicle
---@param mod number
---@param type number
---@param itemName string
function InstallMod(veh, mod, type, itemName)
    local currentmod = GetVehicleMod(veh, mod)
    local modLabel = GetModLabel(mod)
    local typeLabel = GetModTypeLabel(mod, type)

    local returnitem = false
    if currentmod ~= -1 then 
        returnitem = true 
    end   


    local pBarText = ""
    if mod == 18 then 
        pBarText = Lang:t('text.installing')..modLabel
    else 
        pBarText = Lang:t('text.installing')..modLabel..": "..typeLabel
    end

    if (IsBackEngine(GetEntityModel(veh))) then
        SetVehicleDoorOpen(veh, 5, false, false)
    else
        SetVehicleDoorOpen(veh, 4, false, false)
    end	

	QBCore.Functions.Progressbar("install_turbo", pBarText, math.random(20000, 30000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
        animDict = "mini@repair",
		anim = "fixing_a_player",
		flags = 9, -- loop
	}, {}, {}, function() -- Done
		StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        SetVehicleModKit(veh, 0)
        if mod == 18 then 
		    ToggleVehicleMod(veh, mod, true)
        end
        if type ~= nil then
            SetVehicleMod(veh, mod, type, false)
        end
        TriggerServerEvent('moditems:server:removeItem', itemName)
        if returnitem then 
            QBCore.Functions.Notify(Lang:t('text.recoverpart'), "success")
            TriggerServerEvent('moditems:server:addItem', ItemToGiveBack(mod,currentmod))
        end
        QBCore.Functions.Notify(Lang:t('text.installed'), "success")
		if (IsBackEngine(GetEntityModel(veh))) then
			SetVehicleDoorShut(veh, 5, false)
		else
			SetVehicleDoorShut(veh, 4, false)
		end
	end, function() -- Cancel
		StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
		QBCore.Functions.Notify(Lang:t('error.installcancel'), "error")
		if (IsBackEngine(GetEntityModel(veh))) then
			SetVehicleDoorShut(veh, 5, false)
		else
			SetVehicleDoorShut(veh, 4, false)
		end
	end)
end

---Returns the item name for a specified mod and level
---@param mod number
---@param type number
---@return string
function ItemToGiveBack(mod, type)
    local item = ''
    if mod == 11 then
        if type == 0 then item = 'engine_0'
        elseif type == 1 then item = 'engine_1'
        elseif type == 2 then item = 'engine_2'
        elseif type == 3 then item = 'engine_3'
        elseif type == 4 then item = 'engine_4'
        end
    elseif mod == 12 then
        if type == 0 then item = 'brakes_1'
        elseif type == 1 then item = 'brakes_2'
        elseif type == 2 then item = 'brakes_3'
        elseif type == 3 then item = 'brakes_4'
        end
    elseif mod == 13 then
        if type == 0 then item = 'transmision_1'
        elseif type == 1 then item = 'transmision_2'
        elseif type == 2 then item = 'transmision_3'
        elseif type == 3 then item = 'transmision_4'
        end
    elseif mod == 15 then
        if type == 0 then item = 'suspension_0'
        elseif type == 1 then item = 'suspension_1'
        elseif type == 2 then item = 'suspension_2'
        elseif type == 3 then item = 'suspension_3'
        elseif type == 4 then item = 'suspension_4'
        end 
    end
    return item
end

---Returns the name of the mod type
---@param mod number
---@return string
function GetModLabel(mod)
    local label = Lang:t('text.modlabelunknown')
    if mod == 11 then label = Lang:t('text.modlabelengine')
    elseif mod == 12 then label = Lang:t('text.modlabelbrakes')
    elseif mod == 13 then label = Lang:t('text.modlabeltransmision')
    elseif mod == 15 then label = Lang:t('text.modlabelsuspension')
    elseif mod == 16 then label = Lang:t('text.modlabelarmor')
    elseif mod == 18 then label = Lang:t('text.modlabelturbo')
    end
    return label
end

---Returns the name of the mod level for the specified mod
---@param mod number
---@param type number
---@return string
function GetModTypeLabel(mod, type)
    local label = Lang:t('text.modlabelunknown')
    if mod == 12 or mod == 13 then
        if type == -1 then label = Lang:t('text.typenotmodified')
        elseif type == 0 then label = Lang:t('text.typeclassC')
        elseif type == 1 then label = Lang:t('text.typeclassB')
        elseif type == 2 then label = Lang:t('text.typeclassA')
        elseif type == 3 then label = Lang:t('text.typeclassS') end
    elseif mod == 11 or mod == 15 then
        if type == -1 then label = Lang:t('text.typenotmodified')
        elseif type == 0 then label = Lang:t('text.typeclassD')
        elseif type == 1 then label = Lang:t('text.typeclassC')
        elseif type == 2 then label = Lang:t('text.typeclassB')
        elseif type == 3 then label = Lang:t('text.typeclassA')
        elseif type == 4 then label = Lang:t('text.typeclassS') end
    elseif mod == 16 then
        if type == -1 then label = Lang:t('text.typenotmodified')
        elseif type == 0 then label = Lang:t('text.armor1')
        elseif type == 1 then label = Lang:t('text.armor2')
        elseif type == 2 then label = Lang:t('text.armor3')
        elseif type == 3 then label = Lang:t('text.armor4')
        elseif type == 4 then label = Lang:t('text.armor5') end
    elseif mod == 17 or mod == 18 then
        if type == false then label = Lang:t('text.modnotinstalled')
        else label = Lang:t('text.modinstalled') end
    end
    return label
end

---Returns a number rounded with the amount of decimals specified
---@param num number
---@param numDecimalPlaces number
---@return number
function round(num, numDecimalPlaces)
    local mult = 100^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

---Returns the vehicle tier based on performance values
---The minimum value for the tier is set on the config.lua
---@return string
function GetVehicleTier(veh)
    local tier = 'E'
    local speed = round(GetVehicleEstimatedMaxSpeed(veh) * 3.6, 0)
    local acceleration = round(GetVehicleAcceleration(veh)*100, 0)
    local braking = round(GetVehicleMaxBraking(veh)*100, 0)
    local traction = round(GetVehicleMaxTraction(veh)*100, 0)
    local total = speed + acceleration + braking + traction
    if total >= TierD then tier = 'D' end
    if total >= TierC then tier = 'C' end
    if total >= TierB then tier = 'B' end
    if total >= TierA then tier = 'A' end
    if total >= TierAplus then tier = 'A+' end
    if total >= TierS then tier = 'S' end
    if total >= TierSplus then tier = 'S+' end
    return tier
end

---Returns a table with all the information required for the NUI
---@return table
function GetVehicleInfo()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local model = GetEntityModel(veh, false)
    local vehclass = GetVehicleClass(veh)
    local info = {
        vehname = GetLabelText(GetDisplayNameFromVehicleModel(model)),
        vehplate = GetVehicleNumberPlateText(veh),
        vehclass = GetVehicleClassLabel(vehclass),
        vehgears = GetVehicleHighGear(veh),
        speed = round(GetVehicleEstimatedMaxSpeed(veh) * 3.6, 0),
        acceleration = GetVehicleAcceleration(veh),
        braking = GetVehicleMaxBraking(veh),
        traction = GetVehicleMaxTraction(veh),
        enginemod = GetModTypeLabel(11, GetVehicleMod(veh, 11)),
        engineimg = GetModImg(11, GetVehicleMod(veh, 11)),
        brakesmod = GetModTypeLabel(12, GetVehicleMod(veh, 12)),
        brakesimg = GetModImg(12, GetVehicleMod(veh, 12)),
        transmisionmod = GetModTypeLabel(13, GetVehicleMod(veh, 13)),
        transmisionimg = GetModImg(13, GetVehicleMod(veh, 13)),
        suspensionmod = GetModTypeLabel(15, GetVehicleMod(veh, 15)),
        suspensionimg = GetModImg(15, GetVehicleMod(veh, 15)),
        turbomod = GetModTypeLabel(18, IsToggleModOn(veh, 18)),
        turboimg = GetModImg(18, IsToggleModOn(veh, 18)),
        vehtier = GetVehicleTier(veh)
    }
    return info
end

---Returns the vehicle class name
---@param class number Vehicle class numbre
---@return string
function GetVehicleClassLabel(class)
    local label = Lang:t('text.modlabelunknown')
    if class == 0 then label = "Compact"
    elseif class == 1 then label = "Sedan"
    elseif class == 2 then label = "SUV"
    elseif class == 3 then label = "Coupe"
    elseif class == 4 then label = "Muscle"
    elseif class == 5 then label = "Sport Classic"
    elseif class == 6 then label = "Sport"
    elseif class == 7 then label = "Super"
    elseif class == 8 then label = "Motocicleta"
    elseif class == 9 then label = "Off-Road"
    end
    return label
end

local tipo = type
---Returns the image path for the vehicle mod and type specified
---@param mod number Vehicle mod number (11:engine, 12:brakes, 13:gears, 15:suspension, 18:turbo)
---@param type number Vehicle mod level number (-1:stock, 0 to 4 mod levels) 
---@return string
function GetModImg(mod, type)
    local img = './Images/nada.png'
    if mod == 11 then
        if type == -1 then img = './Images/motor.png'
        elseif type == 0 then img = './Images/engine_0.png'
        elseif type == 1 then img = './Images/engine_1.png'
        elseif type == 2 then img = './Images/engine_2.png'
        elseif type == 3 then img = './Images/engine_3.png'
        elseif type == 4 then img = './Images/engine_4.png' end
    elseif mod == 12 then 
        if type == -1 then img = './Images/frenos.png'
        elseif type == 0 then img = './Images/brake_1.png'
        elseif type == 1 then img = './Images/brake_2.png'
        elseif type == 2 then img = './Images/brake_3.png'
        elseif type == 3 then img = './Images/brake_4.png' end
    elseif mod == 13 then
        if type == -1 then img = './Images/transmision.png'
        elseif type == 0 then img = './Images/transmision_1.png'
        elseif type == 1 then img = './Images/transmision_2.png'
        elseif type == 2 then img = './Images/transmision_3.png'
        elseif type == 3 then img = './Images/transmision_4.png' end
    elseif mod == 15 then
        if type == -1 then img = './Images/suspension.png'
        elseif type == 0 then img = './Images/suspension_0.png'
        elseif type == 1 then img = './Images/suspension_1.png'
        elseif type == 2 then img = './Images/suspension_2.png'
        elseif type == 3 then img = './Images/suspension_3.png'
        elseif type == 4 then img = './Images/suspension_4.png' end
    elseif mod == 18 then
        if type == false then img = './Images/nada.png'
        else img = './Images/turbo.png' end
    end
    return img
end

---Send a message to the NUI with the information needed
function VehicleInfoMenu()
    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player, false)
    local info = GetVehicleInfo()
    if isOpen == false then
        isOpen = true
        SendNUIMessage({
            type = 'show',
            vehname = info.vehname,
            vehplate = info.vehplate,
            vehclass = info.vehclass,
            vehgears = info.vehgears,
            speed = info.speed,
            acceleration = info.acceleration,
            braking = info.braking,
            traction = info.traction,
            enginemod = info.enginemod,
            engineimg = info.engineimg,
            brakesmod = info.brakesmod,
            brakesimg = info.brakesimg,
            transmisionmod = info.transmisionmod,
            transmisionimg = info.transmisionimg,
            suspensionmod = info.suspensionmod,
            suspensionimg = info.suspensionimg,
            turbomod = info.turbomod,
            turboimg = info.turboimg,
            vehtier = info.vehtier
        })
    else
        isOpen = false
        SendNUIMessage({
            type = 'hide'
        })
    end
end