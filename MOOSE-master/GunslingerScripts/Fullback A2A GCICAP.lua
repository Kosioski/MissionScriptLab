-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--- VFA-105 Gunslinger                                                                                              ---
--- Operation: Fullback                                                                                             ---
--- Air to Air Dispatcher Script                                                                                    ---
--- Author: Ski                                                                                                     ---
-----------------------------------------------------------------------------------------------------------------------
                                                                            
function AI_A2A_GCICAP:NewSkiAD( EWRPrefixes, TemplatePrefixes, CapPrefixes, CapLimit, SquadronGrouping, GroupingRadius, EngageRadius, GciRadius, ResourceCount )

    local EWRSetGroup = SET_GROUP:New()
    EWRSetGroup:FilterPrefixes( EWRPrefixes )
    EWRSetGroup:FilterStart()

    local Detection  = DETECTION_AREAS:New( EWRSetGroup, GroupingRadius or 30000 )

    local self = BASE:Inherit( self, AI_A2A_DISPATCHER:New( Detection ) ) -- #AI_A2A_GCICAP
    
    self:SetEngageRadius( EngageRadius )
    self:SetGciRadius( GciRadius )
    self:SetDisengageRadius( 180000)
    -- MOOSESKI take off and Landing
    self:SetDefaultTakeoffInAirAltitude(400)
    self:SetDefaultLandingNearAirbase()
    -- END

    -- Determine the coalition of the EWRNetwork, this will be the coalition of the GCICAP.
    local EWRFirst = EWRSetGroup:GetFirst() -- Wrapper.Group#GROUP
    local EWRCoalition = EWRFirst:GetCoalition()
    
    -- Determine the airbases belonging to the coalition.
    local AirbaseNames = {} -- #list<#string>
    for AirbaseID, AirbaseData in pairs( _DATABASE.AIRBASES ) do
      local Airbase = AirbaseData -- Wrapper.Airbase#AIRBASE
      local AirbaseName = Airbase:GetName()
      if Airbase:GetCoalition() == EWRCoalition then
        table.insert( AirbaseNames, AirbaseName )
      end
    end    
    
    self.Templates = SET_GROUP
      :New()
      :FilterPrefixes( TemplatePrefixes )
      :FilterOnce()

    -- Setup squadrons
    
    self:I( { Airbases = AirbaseNames  } )

    self:I( "Defining Templates for Airbases ..." )    
    for AirbaseID, AirbaseName in pairs( AirbaseNames ) do
      local Airbase = _DATABASE:FindAirbase( AirbaseName ) -- Wrapper.Airbase#AIRBASE
      local AirbaseName = Airbase:GetName()
      local AirbaseCoord = Airbase:GetCoordinate()
      local AirbaseZone = ZONE_RADIUS:New( "Airbase", AirbaseCoord:GetVec2(), 3000 )
      local Templates = nil
      self:I( { Airbase = AirbaseName } )    
      for TemplateID, Template in pairs( self.Templates:GetSet() ) do
        local Template = Template -- Wrapper.Group#GROUP
        local TemplateCoord = Template:GetCoordinate()
        if AirbaseZone:IsVec2InZone( TemplateCoord:GetVec2() ) then
          Templates = Templates or {}
          table.insert( Templates, Template:GetName() )
          self:I( { Template = Template:GetName() } )
        end
      end
      if Templates then
        self:SetSquadron( AirbaseName, AirbaseName, Templates, ResourceCount )
        self:SetDefaultTakeoffInAirAltitude(400)
        self:SetDefaultLandingNearAirbase()
      end
    end

    -- Setup CAP.
    -- Find for each CAP the nearest airbase to the (start or center) of the zone. 
    -- CAP will be launched from there.
    
    self.CAPTemplates = SET_GROUP:New()
    self.CAPTemplates:FilterPrefixes( CapPrefixes )
    self.CAPTemplates:FilterOnce()
    
    self:I( "Setting up CAP ..." )    
    for CAPID, CAPTemplate in pairs( self.CAPTemplates:GetSet() ) do
      local CAPZone = ZONE_POLYGON:New( CAPTemplate:GetName(), CAPTemplate )
      -- Now find the closest airbase from the ZONE (start or center)
      local AirbaseDistance = 99999999
      local AirbaseClosest = nil -- Wrapper.Airbase#AIRBASE
      self:I( { CAPZoneGroup = CAPID } )    
      for AirbaseID, AirbaseName in pairs( AirbaseNames ) do
        local Airbase = _DATABASE:FindAirbase( AirbaseName ) -- Wrapper.Airbase#AIRBASE
        local AirbaseName = Airbase:GetName()
        local AirbaseCoord = Airbase:GetCoordinate()
        local Squadron = self.DefenderSquadrons[AirbaseName]
        if Squadron then
          local Distance = AirbaseCoord:Get2DDistance( CAPZone:GetCoordinate() )
          self:I( { AirbaseDistance = Distance } )    
          if Distance < AirbaseDistance then
            AirbaseDistance = Distance
            AirbaseClosest = Airbase
          end
        end
      end
      if AirbaseClosest then
        self:I( { CAPAirbase = AirbaseClosest:GetName() } )    
        self:SetSquadronCap( AirbaseClosest:GetName(), CAPZone, 6000, 10000, 500, 800, 800, 1200, "RADIO" )
        self:SetSquadronCapInterval( AirbaseClosest:GetName(), CapLimit, 300, 900, 1 )
        --MOOSEKI
        self:SetSquadronGrouping(AirbaseClosest:GetName(),SquadronGrouping)
        self:SetDefaultTakeoffInAirAltitude(400)
        self:SetDefaultLandingNearAirbase()
        -- END
      end          
    end    

    -- Setup GCI.
    -- GCI is setup for all Squadrons.
    self:I( "Setting up GCI ..." )    
    for AirbaseID, AirbaseName in pairs( AirbaseNames ) do
      local Airbase = _DATABASE:FindAirbase( AirbaseName ) -- Wrapper.Airbase#AIRBASE
      local AirbaseName = Airbase:GetName()
      local Squadron = self.DefenderSquadrons[AirbaseName]
      self:F( { Airbase = AirbaseName } )    
      if Squadron then
        self:I( { GCIAirbase = AirbaseName } )    
        self:SetSquadronGci( AirbaseName, 800, 1200 )
        self:SetDefaultIntercept(600)
        self:SetDefaultTakeoffInAirAltitude(400)
        self:SetDefaultLandingNearAirbase()
      end
    end
    
    self:__Start( 5 )
    
    self:HandleEvent( EVENTS.Crash, self.OnEventCrashOrDead )
    self:HandleEvent( EVENTS.Dead, self.OnEventCrashOrDead )
    --self:HandleEvent( EVENTS.RemoveUnit, self.OnEventCrashOrDead )
    
    self:HandleEvent( EVENTS.Land )
    self:HandleEvent( EVENTS.EngineShutdown )
    
    return self
  end


  --- Create A2A_GCICAP Object ------------------------------------------------------------------------------------------
--- EWR Netwwork, Squadrons, CAP Areas  
--- Params - EWRPrefixes, TemplatePrefixes, CapPrefixes, CapLimit, GroupingRadius, EngageRadius, GciRadius, ResourceCount

------------------------------------------------------------------------------------------------------------------------
--- Command Schedule                                                                                                ----
------------------------------------------------------------------------------------------------------------------------
---                                                                                                                 ----
--- SC - Southern Comand: Jask area                                                                                 ----
--- HC - Hormuz Command: Bandar Abbas and Qeshm Areas                                                               ----
--- WC - Western Command: Kish and Tunb Island                                                                      ----
--- CC - Central Command: Intertior of the country                                                                  ----
---                                                                                                                 ----
------------------------------------------------------------------------------------------------------------------------

IranSouthernAirCommand = AI_A2A_GCICAP:NewSkiAD (
    "ESC",                  --- Early Warning Radars
    "SSC",                  --- Squadrons
    "CAPSC",                --- Cap Zones (late Start helos with waypoint boundaries
    1,                      --- How many Cap flights in the Cap Zones
    1,                      --- How many planes in a flight
    30000,                  --- The range that intruders are grouped together (meters)
    180000,                 --- Aircraft engage radius (meters)
    180000,                 --- Ground Control Intercept aircraft engage radius (meters)
    30                      --- Resource count per squadron
)

IranHormuzAirCommand = AI_A2A_GCICAP:NewSkiAD (
    "EHC",                  --- Early Warning Radars
    "SHC",                  --- Squadrons
    "CAPHC",                --- Cap Zones (late Start helos with waypoint boundaries
    2,                      --- How many Cap flights in the Cap Zones
    2,                      --- How many planes in a flight
    30000,                  --- The range that intruders are grouped together (meters)
    180000,                 --- Aircraft engage radius (meters)
    180000,                 --- Ground Control Intercept aircraft engage radius (meters)
    30                      --- Resource count per squadron
)

IranWesternAirCommand = AI_A2A_GCICAP:NewSkiAD (
    "EWC",                  --- Early Warning Radars
    "SWC",                  --- Squadrons
    "CAPWC",                --- Cap Zones (late Start helos with waypoint boundaries
    1,                      --- How many Cap flights in the Cap Zones
    2,                      --- How many planes in a flight
    30000,                  --- The range that intruders are grouped together (meters)
    180000,                 --- Aircraft engage radius (meters)
    180000,                 --- Ground Control Intercept aircraft engage radius (meters)
    30                      --- Resource count per squadron
)

-- IranCentralAirCommand = AI_A2A_GCICAP:NewSkiAD (
--     "ECC",                  --- Early Warning Radars
--     "SCC",                  --- Squadrons
--     "CAPCC",                --- Cap Zones (late Start helos with waypoint boundaries
--     1,                      --- How many Cap flights in the Cap Zones
--     2,                      --- How many planes in a flight
--     30000,                  --- The range that intruders are grouped together (meters)
--     180000,                 --- Aircraft engage radius (meters)
--     180000,                 --- Ground Control Intercept aircraft engage radius (meters)
--     30                      --- Resource count per squadron
-- )

