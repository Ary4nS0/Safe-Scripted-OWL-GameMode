addEventHandler( "onClientPlayerVehicleEnter", getLocalPlayer(),
	function( vehicle )
		
)

addEvent( "CantFallOffBike", true )
addEventHandler( "CantFallOffBike", getLocalPlayer(),
	function( )
		--outputDebugString("setPedCanBeKnockedOffBike")
		setPedCanBeKnockedOffBike( getLocalPlayer(), false )
		setTimer( setPedCanBeKnockedOffBike, 5000, 1, getLocalPlayer(), true )
	end
)