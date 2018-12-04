function print(arg)
  reaper.ShowConsoleMsg(tostring(arg) .. "\n")
end

local activeProjectIndex = 0
local selectedItemIndex = 0
local selectedTrack = reaper.GetSelectedTrack(activeProjectIndex, selectedItemIndex)

local _, trackStateChunk = reaper.GetTrackStateChunk(selectedTrack, "", false)

--print(trackStateChunk)
