addEvent("setDrunkness", true)--safe
addEventHandler("setDrunkness", getRootElement(),
	function( level )
		
		exports.anticheat:changeProtectedElementDataEx( source, "alcohollevel", level or 0, false )
	end
)