local sensorInfo = {
  name = "Move_grup",
  desc = "Compute move for line",
  author = "MajdaT",
  date = "2025-04-22",
  license = "MIT",
}

local EVAL_PERIOD_DEFAULT = -1

function getInfo()
  return {
    period = EVAL_PERIOD_DEFAULT
  }
end

-- @description: Compute move for line
-- @argument M_pos_last [table] - {x, y, z} Last position of Maverick
-- @argument M_pos [table] - {x, y, z} Actual position of Maverick
-- @argument listOfUnits [array of unitIDs] - list of units to determine group center
return function(M_pos_last, M_pos, listOfUnits)
  if (M_pos == nil) then
	M_pos = M_pos_last
  end
  -- compute center position of units
  local cx, cy, cz = 0, 0, 0
  for i = 1, #listOfUnits do
    local unitID = listOfUnits[i]
    local x, y, z = Spring.GetUnitPosition(unitID)
    cx = cx + x
    cy = cy + y
    cz = cz + z
  end
  cx = cx / #listOfUnits
  cy = cy / #listOfUnits
  cz = cz / #listOfUnits


  dx = M_pos[1]-M_pos_last[1]
  dy = M_pos[2]-M_pos_last[2]
  dz = M_pos[3]-M_pos_last[3]

  -- apply offset
  local tx = cx + dx 
  local ty = cy + dy 
  local tz = cz + dz 

  return {x = tx, y = ty, z = tz}
end
