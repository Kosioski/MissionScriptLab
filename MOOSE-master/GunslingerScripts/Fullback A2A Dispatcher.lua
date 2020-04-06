---------------------------------------------------------------------------------------------------
--- VFA-105 Gunslinger                                                                          ---
--- Operation: Fullback                                                                         ---
--- Air to Air Dispatcher Script                                                                ---
--- Author: Ski                                                                                 ---
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
IranA2ADispatcher:SetTacticalDisplay( false )

--- Squadron Notes --------------------------------------------------------------------------------

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
IranA2ADispatcher:SetSquadron("Hotel", AIRBASE.PersianGulf.Kish_International_Airport.{
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
IranA2ADispatcher:SetSquadronGci("Mike",AIRBASE.PersianGulf.Tunb_Island_AFB, {
        "SQ RED 52nd Brq MiG-21"
    }
)  





