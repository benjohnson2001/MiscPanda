function activeMidiEditor()
  return reaper.MIDIEditor_GetActive()
end

function activeTake()
  return reaper.MIDIEditor_GetTake(activeMidiEditor())
end

local function getCursorPositionPPQ()

	local cursorPositionInSeconds = reaper.GetCursorPosition()
	return reaper.MIDI_GetPPQPosFromProjTime(activeTake(), cursorPositionInSeconds)
end

local function getNumberOfNotes()

  local _, numberOfNotes = reaper.MIDI_CountEvts(activeTake())
  return numberOfNotes
end


--

local numberOfNotes = getNumberOfNotes()
local cursorPositionPPQ = getCursorPositionPPQ()

for noteIndex = numberOfNotes-1, 0, -1 do

	local _, noteIsSelected, noteIsMuted, noteStartPositionPPQ, noteEndPositionPPQ  = reaper.MIDI_GetNote(activeTake(), noteIndex)

	if cursorPositionPPQ > noteStartPositionPPQ and cursorPositionPPQ < noteEndPositionPPQ then
		reaper.MIDI_DeleteNote(activeTake(), noteIndex)
	end
end