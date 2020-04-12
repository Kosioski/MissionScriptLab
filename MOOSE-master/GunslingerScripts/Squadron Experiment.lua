
IranDetectionGroup = SET_GROUP:New()	
--IranDetectionGroupp:FilterPrefixes( { "DF RED EWR" } )	
IranDetectionGroup:FilterPrefixes( "IEWR" )
IranDetectionGroup:FilterActive()
IranDetectionGroup:FilterStart()
IranDetection = DETECTION_AREAS:New( IranDetectionGroup, 30000 )	
IranDispatcher = AI_A2A_DISPATCHER:New( IranDetection )
IranDispatcher:SetTacticalDisplay( true )
IranBorder = ZONE_POLYGON:New( "IRAN Border", GROUP:FindByName( "IRAN Border" ) ) -- "IRAN International Waters Line"
IranDispatcher:SetBorderZone( IranBorder )
IranDispatcher:SetDefaultTakeoffInAirAltitude(400)
IranDispatcher:SetS
IranDispatcher:SetDefaultFuelThreshold( 0.15 )

--IranDispatcher:SetDefaultDamageThreshold( 0.60 )
IranDispatcher:SetDefaultCapLimit( 1 )
IranDispatcher:SetDefaultTakeoffInAirAltitude(400)

IranDispatcher:SetEngageRadius( 200000 )
IranDispatcher:SetGciRadius( 200000 )
IranDispatcher:SetDisengageRadius( 250000 )	

-- ["Abu_Dhabi_International_Airport"] = "Abu Dhabi International Airport",
-- ["Abu_Musa_Island_Airport"] = "Abu Musa Island Airport",
-- ["Al_Ain_International_Airport"] = "Al Ain International Airport",
-- ["Al_Bateen_Airport"] = "Al-Bateen Airport",
-- ["Al_Dhafra_AB"] = "Al Dhafra AB",
-- ["Al_Maktoum_Intl"] = "Al Maktoum Intl",
-- ["Al_Minhad_AB"] = "Al Minhad AB",
-- ["Bandar_Abbas_Intl"] = "Bandar Abbas Intl",
-- ["Bandar_Lengeh"] = "Bandar Lengeh",
-- ["Bandar_e_Jask_airfield"] = "Bandar-e-Jask airfield",
-- ["Dubai_Intl"] = "Dubai Intl",  
-- ["Fujairah_Intl"] = "Fujairah Intl",
-- ["Havadarya"] = "Havadarya",
-- ["Jiroft_Airport"] = "Jiroft Airport",
-- ["Kerman_Airport"] = "Kerman Airport",
-- ["Khasab"] = "Khasab",
-- ["Kish_International_Airport"] = "Kish International Airport",
-- ["Lar_Airbase"] = "Lar Airbase",
-- ["Lavan_Island_Airport"] = "Lavan Island Airport",
-- ["Liwa_Airbase"] = "Liwa Airbase",
-- ["Qeshm_Island"] = "Qeshm Island",
-- ["Ras_Al_Khaimah"] = "Ras Al Khaimah",
-- ["Sas_Al_Nakheel_Airport"] = "Sas Al Nakheel Airport",
-- ["Sharjah_Intl"] = "Sharjah Intl",
-- ["Shiraz_International_Airport"] = "Shiraz International Airport",
-- ["Sir_Abu_Nuayr"] = "Sir Abu Nuayr",
-- ["Sirri_Island"] = "Sirri Island",
-- ["Tunb_Island_AFB"] = "Tunb Island AFB",
-- ["Tunb_Kochak"] = "Tunb Kochak",

IranDispatcher:SetSquadron( "Jask", AIRBASE.Pe], { "SSC 45th Baz Jask", "SSC 58th Brq Jask"} )
IranDispatcher:SetSquadronOverhead( "Jask", 1.0)
IranDispatcher:SetSquadronGrouping( "Jask", 2 )

IranDispatcher:SetSquadronLandingAtRunway( "Jask" )

CAPZoneJask = ZONE:New("CAPSC Jask")

IranBorder:SetSquadronCap( "Jask", CAPZoneJask, 1000, 11000, 750, 900, 800, 1200, "RADIO" )
IranBorder:SetSquadronCapInterval( "Jask", 1, 450, 900, 1 )
