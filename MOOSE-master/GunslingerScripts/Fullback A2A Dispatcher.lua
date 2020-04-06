---------------------------------------------------------------------------------------------------
--- VFA-105 Gunslinger                                                                          ---
--- Operation: Fullback                                                                         ---
--- Air to Air Dispatcher Script                                                                ---
--- Author: Ski                                                                                 ---
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
--- Dispatcher Construction -----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--- 1 - Detection object creation
--- 2 - Adding in EWR prefixes of the assets used
--- 3 - Starting the object

IranDetectionGroup = SET_GROUP:New()
IranDetectionGroup:FilterPrefixes ("EWR Iran")
IranDetectionGroup:FilterActive()
IranDetectionGroup:FilterStart()

--- Creating Detection Areas

IranDetectionAreas = DETECTION_AREAS:New(IranDetectionGroup,30000)

--- Create Dispatcher and initialize it 

IranA2ADispatcher = AI_A2A_DISPATCHER:New(IranDetectionAreas)

--- Parameters for the Iranian Dispatcher and Squadrons

IranA2ADispatcher:SetEngageRadius(50000)
IranA2ADispatcher:SetGciRadius(140000)
IranA2ADispatcher:SetDefaultFuelThreshold(.15)
IranA2ADispatcher:SetDisengageRadius(150000)
IranA2ADispatcher:SetDefaultTakeoffInAirAltitude(600)
IranA2ADispatcher:SetDefaultLandingNearAirbase()
IranA2ADispatcher:SetTacticalDisplay( false )

---------------------------------------------------------------------------------------------------
--- Squadron Configuration Section ----------------------------------------------------------------
---------------------------------------------------------------------------------------------------

    -- Iran AIRBASES - GCI prefix for GCI tasking or else they are CAP
    
	-- Alpha    -- * AIRBASE.PersianGulf.Bandar_e_Jask_airfield
	-- Beta     -- * AIRBASE.PersianGulf.Bandar_Abbas_Intl
	-- Charlie  -- * AIRBASE.PersianGulf.Bandar_Lengeh
	-- Delta    -- * AIRBASE.PersianGulf.Havadarya
	-- Echo     -- * AIRBASE.PersianGulf.Jiroft_Airport
	-- Foxtrot  -- * AIRBASE.PersianGulf.Kerman_Airport
	-- Golf     -- * AIRBASE.PersianGulf.Khasab (Allied Base Invaded)
	-- Hotel    -- * AIRBASE.PersianGulf.Kish_International_Airport
	-- India    -- * AIRBASE.PersianGulf.Lar_Airbase
	-- Juliet   -- * AIRBASE.PersianGulf.Lavan_Island_Airport
	-- Kilo     -- * AIRBASE.PersianGulf.Qeshm_Island
	-- Lima     -- * AIRBASE.PersianGulf.Shiraz_International_Airport
	-- Mike     -- * AIRBASE.PersianGulf.Tunb_Island_AFB
    -- November -- * AIRBASE.PersianGulf.Tunb_Kochak

--- CAP Squadron Configuration --------------------------------------------------------------------

IranA2ADispatcher:SetSquadron("Beta", AIRBASE.PersianGulf.Bandar_Abbas_Intl,{
        "SQ RED 55th Brq MiG-21",
        "SQ RED 40th Baz F-5",
        "SQ RED 30th Sperdar F-4"
    }
)
IranA2ADispatcher:SetSquadron("Charlie",AIRBASE.PersianGulf.Bandar_Lengeh,{
        "SQ RED 54th Brq MiG-21",
        "SQ RED 41st Baz F-5"
    }
)
IranA2ADispatcher:SetSquadron("Hotel", AIRBASE.PersianGulf.Kish_International_Airport, {
        "SQ RED 59th Brq MiG-21",
        "SQ RED 20th Antqam F-14",
        "SQ RED 91st Saaf MiG-29"
    }
)
IranA2ADispatcher:SetSquadron("India",AIRBASE.PersianGulf.Lar_Airbase,{
        "SQ RED 90th Saaf MiG-29"
    }
)
IranA2ADispatcher:SetSquadron("Lima",AIRBASE.PersianGulf.Shiraz_International_Airport,{
        "SQ RED 31st Sperdar F-4",
        "SQ RED 21st Antqam F-14"
    }
)

--- GCI Squadron Configuration --------------------------------------------------------------------

IranA2ADispatcher:SetSquadronGci("GCIAlpha", AIRBASE.PersianGulf.Bandar_e_Jask_airfield,{
        "SQ RED 58th Brq MiG-21"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIBeta",AIRBASE.PersianGulf.Bandar_Abbas_Intl,{
        "SQ RED 55th Brq MiG-21",
        "SQ RED 30th Sperdar F-4"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIDelta", AIRBASE.PersianGulf.Havadarya, {
        "SQ RED 54th Brq MiG-21",
        "SQ RED 41st Baz F-5"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIFoxtrot",AIRBASE.PersianGulf.Kerman_Airport, {
        "SQ RED 42nd Baz F-5"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIHotel", AIRBASE.PersianGulf.Kish_International_Airport, {
        "SQ RED 59th Brq MiG-21",
        "SQ RED 91st Saaf MiG-29"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIIndia", AIRBASE.PersianGulf.Lar_Airbase, {
        "SQ RED 90th Saaf MiG-29"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIKilo",AIRBASE.PersianGulf.Qeshm_Island, {
        "SQ RED 53rd Brq MiG-21",
        "SQ RED 43rd Baz F-5",
        "SQ RED 32nd Sperdar F-4"
    }
)
IranA2ADispatcher:SetSquadronGci("GCILima", AIRBASE.PersianGulf.Shiraz_International_Airport, {
        "SQ RED 31st Sperdar F-4",
        "SQ RED 21st Antqam F-14"
    }
)
IranA2ADispatcher:SetSquadronGci("GCIMike",AIRBASE.PersianGulf.Tunb_Island_AFB, {
        "SQ RED 52nd Brq MiG-21"
    }
)  

---------------------------------------------------------------------------------------------------
--- Defense Tuning of Squads ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--- How many units spawn in response to intrusion -------------------------------------------------

IranA2ADispatcher:SetSquadronOverhead("Beta",1.0)
IranA2ADispatcher:SetSquadronOverhead("Charlie",1.0)
IranA2ADispatcher:SetSquadronOverhead("Hotel",1.0)
IranA2ADispatcher:SetSquadronOverhead("India",1.0)
IranA2ADispatcher:SetSquadronOverhead("Lima",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIAlpha",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIBeta",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIDelta",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIFoxtrot",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIHotel",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIIndia",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIKilo",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCILima",1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIMike",1.0)

--- How many units per Group ----------------------------------------------------------------------

IranA2ADispatcher:SetSquadronGrouping("Beta",2)
IranA2ADispatcher:SetSquadronGrouping("Charlie",2)
IranA2ADispatcher:SetSquadronGrouping("Hotel",2)
IranA2ADispatcher:SetSquadronGrouping("India",2)
IranA2ADispatcher:SetSquadronGrouping("Lima",2)
IranA2ADispatcher:SetSquadronGrouping("GCIAlpha",2)
IranA2ADispatcher:SetSquadronGrouping("GCIBeta",2)
IranA2ADispatcher:SetSquadronGrouping("GCIDelta",2)
IranA2ADispatcher:SetSquadronGrouping("GCIFoxtrot",2)
IranA2ADispatcher:SetSquadronGrouping("GCIHotel",2)
IranA2ADispatcher:SetSquadronGrouping("GCIIndia",2)
IranA2ADispatcher:SetSquadronGrouping("GCIKilo",2)
IranA2ADispatcher:SetSquadronGrouping("GCILima",2)
IranA2ADispatcher:SetSquadronGrouping("GCIMike",2)

--- Set take off. Doing air starts to avoid runway conflicts --------------------------------------

IranA2ADispatcher:SetDefaultTakeoffInAir("Beta",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("Charlie",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("Hotel",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("India",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("Lima",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIAlpha",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIBeta",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIDelta",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIFoxtrot",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIHotel",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIIndia",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIKilo",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCILima",400)
IranA2ADispatcher:SetDefaultTakeoffInAir("GCIMike",400)

--- Set take off. Doing air starts to avoid runway conflicts --------------------------------------

-- IranA2ADispatcher:SetDefaultLandingNearAirbase("Beta")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("Charlie")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("Hotel")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("India")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("Lima")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIAlpha")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIBeta")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIDelta")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIFoxtrot")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIHotel")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIIndia")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIKilo")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCILima")
-- IranA2ADispatcher:SetDefaultLandingNearAirbase("GCIMike")

---------------------------------------------------------------------------------------------------
--- CAP Configuration -----------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--- CAP Zone config -------------------------------------------------------------------------------

CAPZoneHormuz = ZONE_POLYGON:NewFromGroupName("IRAN CAP Hormuz")
CAPTunbIsland = ZONE_POLYGON:NewFromGroupName("IRAN CAP Tunb Island")
CAPKish = ZONE_POLYGON:NewFromGroupName("IRAN CAP Kish")
CAPLarCentral = ZONE_POLYGON:NewFromGroupName("IRAN CAP Lar Central")
CAPNorth = ZONE_POLYGON:NewFromGroupName("IRAN CAP North")

--- CAP Zone Execution ----------------------------------------------------------------------------

IranA2ADispatcher:SetSquadronCap("Beta", CAPZoneHormuz, 1000, 11000, 750, 900, 800, 1200, "BARO")
IranA2ADispatcher:SetSquadronCapInterval("Beta", 1, 300, 900, 1)

IranA2ADispatcher:SetSquadronCap("Charlie", CAPTunbIsland, 1000, 11000, 750, 900, 800, 1200, "BARO")
IranA2ADispatcher:SetSquadronCapInterval("Charlie", 1, 300, 900, 1)

IranA2ADispatcher:SetSquadronCap("Hotel", CAPKish, 1000, 11000, 750, 900, 800, 1200, "BARO")
IranA2ADispatcher:SetSquadronCapInterval("Hotel", 1, 300, 900, 1)

IranA2ADispatcher:SetSquadronCap("India", CAPCAPLarCentral, 1000, 11000, 750, 900, 800, 1200, "BARO")
IranA2ADispatcher:SetSquadronCapInterval("India", 1, 300, 900, 1)

IranA2ADispatcher:SetSquadronCap("Lima", CAPNorth, 1000, 11000, 750, 900, 800, 1200, "BARO")
IranA2ADispatcher:SetSquadronCapInterval("Lima", 1, 300, 900, 1)

--- GCI squadron execution ------------------------------------------------------------------------

IranA2ADispatcher:SetSquadronGci("GCIAlpha", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIBeta", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIDelta", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIFoxtrot", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIHotel", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIIndia", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIKilo", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCILima", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIMike", 900, 1200)



