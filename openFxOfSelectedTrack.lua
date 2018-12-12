local activeProjectIndex = 0
local selectedTrackIndex = 0
local wantMaster = true

local track = reaper.GetSelectedTrack2(activeProjectIndex, selectedTrackIndex, wantMaster)
local fxIndex = 0
local showFlag = 1

reaper.TrackFX_Show(track, fxIndex, showFlag)