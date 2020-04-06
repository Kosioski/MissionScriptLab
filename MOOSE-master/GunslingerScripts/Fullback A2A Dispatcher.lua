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
IranDetectionGroup:FilterPrefixes ("EWR IRAN")
IranDetectionGroup:FilterActive()
IranDetectionGroup:FilterStart()

--- Creating Detection Areas

IranDetectionAreas = DETECTION_AREAS:New(IranDetectionGroup,30000)

--- Create Dispatcher and initialize it 

IranA2ADispatcher = AI_A2A_DISPATCHER:New(IranDetectionAreas)

--- Parameters for the Iranian Dispatcher and Squadrons

IranA2ADispatcher:SetEngageRadius(50000)
IranA2ADispatcher:SetGciRadius(180000)
IranA2ADispatcher:SetDefaultFuelThreshold(.15)
IranA2ADispatcher:SetDisengageRadius(180000)
IranA2ADispatcher:SetDefaultTakeoffInAirAltitude(400)
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

--- GCI Squadron Configuration --------------------------------------------------------------------

--- IranA2ADispatcher:SetSquadron("GCIAlpha", AIRBASE.PersianGulf.Bandar_e_Jask_airfield, "SQ IRAN 58th Brq MiG-21")
IranA2ADispatcher:SetSquadron("GCIBeta", AIRBASE.PersianGulf.Bandar_Abbas_Intl, {"SQ IRAN 55th Brq MiG-21", "SQ IRAN 40th Baz F-5", "SQ IRAN 30th Sperdar F-4", "SQ IRAN 92nd Saaf MiG-29"})
--- IranA2ADispatcher:SetSquadron("GCIHotel", AIRBASE.PersianGulf.Kish_International_Airport, {"SQ IRAN 59th Brq MiG-21", "SQ IRAN 44th Baz F-5", "SQ IRAN 91st Saaf MiG-29"})
IranA2ADispatcher:SetSquadron("GCIKilo", AIRBASE.PersianGulf.Qeshm_Island, {"SQ IRAN 53rd Brq MiG-21","SQ IRAN 43rd Baz F-5","SQ IRAN 32nd Sperdar F-4"})
IranA2ADispatcher:SetSquadron("GCIMike", AIRBASE.PersianGulf.Tunb_Island_AFB, {"SQ IRAN 52nd Brq MiG-21", "SQ IRAN 33nd Sperdar F-4"})

---------------------------------------------------------------------------------------------------
--- Defense Tuning of Squads ----------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--- How many units spawn in response to intrusion -------------------------------------------------

-- IranA2ADispatcher:SetSquadronOverhead("GCIAlpha", 1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIBeta", 1.2)
---IranA2ADispatcher:SetSquadronOverhead("GCIHotel", 1.2)
IranA2ADispatcher:SetSquadronOverhead("GCIKilo", 1.0)
IranA2ADispatcher:SetSquadronOverhead("GCIMike", 1.0)

--- How many units per Group ----------------------------------------------------------------------

--- IranA2ADispatcher:SetSquadronGrouping("GCIAlpha",2)
IranA2ADispatcher:SetSquadronGrouping("GCIBeta",2)
---IranA2ADispatcher:SetSquadronGrouping("GCIHotel",2)
IranA2ADispatcher:SetSquadronGrouping("GCIKilo",2)
IranA2ADispatcher:SetSquadronGrouping("GCIMike",2)


--- Set take off. Doing air starts to avoid runway conflicts --------------------------------------


--- Set take off. Doing air starts to avoid runway conflicts --------------------------------------


---------------------------------------------------------------------------------------------------
--- CAP Configuration -----------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--- CAP Zone config -------------------------------------------------------------------------------

-- CAPZoneHormuz = ZONE_POLYGON:NewFromGroupName("IRAN CAP Hormuz")


--- CAP Zone Execution ----------------------------------------------------------------------------

-- IranA2ADispatcher:SetSquadronCap("Beta", CAPZoneHormuz, 1000, 11000, 750, 900, 800, 1200, "BARO")
-- IranA2ADispatcher:SetSquadronCapInterval("Beta", 1, 300, 900, 1)


--- GCI squadron execution ------------------------------------------------------------------------

--- IranA2ADispatcher:SetSquadronGci("GCIAlpha", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIBeta", 900, 1200)
---IranA2ADispatcher:SetSquadronGci("GCIHotel", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIKilo", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIMike", 900, 1200)




