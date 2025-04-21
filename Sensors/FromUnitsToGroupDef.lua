local sensorInfo = {
	name = "FromUnitsToGroupDef",
	desc = "Flip keys and values of units table",
	author = "PepeAmpere",
	date = "2025-04-12",
	license = "MIT",
}

local EVAL_PERIOD_DEFAULT = -1 -- instatnt, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return stuctured description of the formation 
-- @argument listOfUnits [array]
return function(listOfUnits)
	local groupDefinition = {}
	
	for i=1, #listOfUnits do
		local unitID = listOfUnits[i] -- get unitID
		groupDefinition[unitID]= i
	end
	
	return groupDefinition
end