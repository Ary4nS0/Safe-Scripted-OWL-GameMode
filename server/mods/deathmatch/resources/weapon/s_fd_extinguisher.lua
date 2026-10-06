function supplyExtinguisher()
	local weapon=getPedWeapon(client)
	if weapon ~= 42 then return end
	setWeaponAmmo(client, 42, 500)
end
addEvent("fdextinguisher:supply", true)
addEventHandler("fdextinguisher:supply", resourceRoot, supplyExtinguisher)
