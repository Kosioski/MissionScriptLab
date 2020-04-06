
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

--- GCI squadron execution ------------------------------------------------------------------------

--- IranA2ADispatcher:SetSquadronGci("GCIAlpha", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIBeta", 900, 1200)
---IranA2ADispatcher:SetSquadronGci("GCIHotel", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIKilo", 900, 1200)
IranA2ADispatcher:SetSquadronGci("GCIMike", 900, 1200)