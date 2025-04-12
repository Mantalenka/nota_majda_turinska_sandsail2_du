local sensorInfo = {
	name = "ExampleDebug",
	desc = "Sends data to example debug widget",
	author = "PepeAmpere",
	date = "2018-04-16",
	license = "MIT",
}

local EVAL_PERIOD_DEFAULT = -1 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return current wind statistics
return function(listOfUnits)
	local groupDefinition = {}
	
	for i=1, #listOfUnits do
		local unitID = listOfUnits[i] -- get unitID
		groupDefinition[unitID]= i
	end
	
	return groupDefinition
end