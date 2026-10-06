Inject_Ban = true 
TypeCode_Ban = true
Disable_JetPack = true 
Ban_Fake_Trigger = true
Trigger_Spam_Ban = true 

max_player_triggered_events_per_interval = 50
player_triggered_event_interval = 1000 

Admin_Element = {
  "admin_level","supporter_level"
}


Var = {
  ["load"] = {
    "dgs",
  },

  ["pcall"] = {
    "AzarAC",
  },
  
  ["loadstring"] = {
    "dgs",
  },
  
  ["createFire"] = {
    "Azar",
  },
  
  ["fixVehicle"] = {
    "Azar",
  },

  ["blowVehicle"] = {
    "Azar",
  },
  
  ["setPedArmor"] = {
    "Azar",

  },
  
  ["setPedOnFire"] = {
    "Azar",
  },
  
  ["createProjectile"] = {
    "Azar",
  },
  
  ["setElementHealth"]  = {
    "AC",
    "realism-system",
    "ped-system",
    "abghaza",
    "es-system",
    "godmode",

  },
  
  ["addVehicleUpgrade"] = {
    "Azar",
  },
  
  ["setElementPosition"]  = {
    "official-interiors",
    "account",
    "freecam",
    "bone_attach",
    "carshop-system",
    "activities",
	  "admin-system",
	  "interior_system",
	  "es-system",
	  "freecam-tv",
	  "gate-manager",
	  "item-move",
	  "job-system",
	  "object-browser",
	  "object-interaction",
	  "parachute",
	  "pd-system",
	  "ped-system",
	  "realism-system",
	  "sittablechairs",
	  "vehicle-system",
    "carradio",
    "global",
    "global",
    "item-system",
    "DL_Mavad",
    "interior-system",
    "DL_MenuPD",
    "DL_MenuMedic",
    "DL_MenuMechanic",
    "PD-Locker",

	"AzarAC",
	"pAttach",
  },

  ["getAllElementData"] = {
    "AzarAC",
  },
  
  ["setPedAnimationSpeed"] = {
    "AzarAC",
  },

  ["setVehicleEngineState"] = {
    "vehicle-system",
  },

  ["setVehicleDamageProof"] = {
    "Azar",
  },
  
  ["getElementsWithinRange"] = {
    "N_hud1",
  },
  
}

-- World Special

WorldSpecial = {
  ["hovercars"] = false,
  ["aircars"] = false,
  ["extrabunny"] = false,
  ["extrajump"] = false,
  ["randomfoliage"] = true,
  ["snipermoon"] = false,
  ["underworldwarp"] = true,
  ["vehiclesunglare"] = false,
  ["coronaztest"] = true,
  ["watercreatures"] = true,
  ["burnflippedcars"] = true,
  ["fireballdestruct"] = true,
}


VehElementDatas = {
    ["seatbeltwarning"] = true,
    ["groundoffset"] = true,
    ["blip"] = true,
    ["gpsDestination"] = true,
    ["upcodes > map route"] = true,
}


function Player_ID(thePlayer)
  return thePlayer:getData("playerid") or 0
end

function getFromID(thePlayer, Player)
	return exports.global:findPlayerByPartialNick(thePlayer, Player)
end

function isPlayerStaff(Player)
  for _, v in ipairs(Admin_Element) do
    if (Player:getData(v) or 0) > 0 then 
      return true
    end
  end 
  return false
end


