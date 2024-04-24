-- local function hasWaterObject(square)	
	-- for i=0, square:getObjects():size()-1 do
		-- local v = square:getObjects():get(i);
		-- if instanceof(v, "IsoObject") and v:getSprite() and v:getSprite():getProperties() and v:getSprite():getProperties():Is(IsoFlagType.water) then
			-- ----print("Water Tile")
			-- return true;
		-- end
	-- end
-- end
 
function trashSquare(square)
	local mData = square:getModData()
    mData.trashSquare = true
	square:transmitModdata()
    --if mData.trashSquare then return end
	if ZombRand(0,5) ~= 0 then return end
    if not square then return end
	if checkBlockedSquare(square) == false then return false end
    if mData.stashSquare then return end
	if not square:getZone() then return end
	--if square:hasFloor(false) then return end
	if not square:getZone():getType() then return end
	--if square:isVehicleIntersecting() then return end
	--if not square:isNotBlocked(true) then return end
	local zoneType = square:getZone():getType()
	local vehicleZone = nil
	if getVehicleZoneAt and getVehicleZoneAt(square:getX(), square:getY(), square:getZ()) then
		vehicleZone = getVehicleZoneAt(square:getX(), square:getY(), square:getZ())
	end
	----print("SQUARE")
	local cell = getCell()
	
	--if hasWaterObject(square) then return false end
	
	if not square:isOutside() then

		if square:getZ() > 0 and not square:hasFloor(true) then return end

		--if ZombRand(0,49)== 0 then
		if ZombRand(0,10)== 0 then
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		end
		--if ZombRand(0,9) == 0 then
		if ZombRand(0,2) == 0 then
			local cont = scattered_trash(square)
		end
		--return
		--if ZombRand(0,99) == 0 then
		if ZombRand(0,20) == 0 then
			----print("Crash Glass")
			local glass = square:addBrokenGlass()		
		  local glass = IsoBrokenGlass.new(getCell());
		  glass:setSquare(square);
		  square:AddSpecialObject(glass)
			mData.specialSquare = true
		 end	
		 return
	end
	if square:getZ() > 0 and not square:hasFloor(true) then return end
	local vehicleZoneType = nil
	if vehicleZone and vehicleZone:getType() then vehicleZoneType = vehicleZone:getType() end
	--if  vehicleZone and vehicleZone:getName():contains("trafficjam") then
	if  vehicleZoneType and vehicleZoneType:contains("trafficjam") then

		--if ZombRand(0,9) == 0 then
		if ZombRand(0,2) == 0 then
			----print("Crash Trash")
			local cont = scattered_trash(square)
		end
		--if ZombRand(0,99)== 0 then
		if ZombRand(0,20)== 0 then
			----print("Crash Glass")
			local glass = square:addBrokenGlass()		
		  local glass = IsoBrokenGlass.new(getCell());
		  glass:setSquare(square);
		  square:AddSpecialObject(glass)
			mData.specialSquare = true
		end
		--if ZombRand(0,99)== 0 then
		if ZombRand(0,20)== 0 then
			----print("Crash Corpse")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end	
			mData.specialSquare = true
		end
	elseif  vehicleZone then

		--if ZombRand(0,19) == 0 then
		if ZombRand(0,4) == 0 then
			----print("Car Trash")
			local cont = scattered_trash(square)
		end
		--if ZombRand(0,199)== 0 then
		if ZombRand(0,40)== 0 then
			----print("Car Corpse")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end	
			mData.specialSquare = true
		end		
		--if ZombRand(0,499)== 0 then	
		if ZombRand(0,100)== 0 then
			----print("Crash Glass")
			local glass = square:addBrokenGlass()		
		  local glass = IsoBrokenGlass.new(getCell());
		  glass:setSquare(square);
		  square:AddSpecialObject(glass)
			mData.specialSquare = true
		end
	elseif zoneType =="Nav" then

		--if ZombRand(0,999) == 0 then
		if ZombRand(0,200) == 0 then
			-- --print("Trash Spawn")
			local cont = scattered_trash(square)
		end		
		--if ZombRand(0,1999)== 0 then	
		if ZombRand(0,400)== 0 then
			----print("Corpse Spawn")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			local worn = body:getWornItems()
			worn:clear()		
			--print("Body " .. tostring(body))
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		end		
		--if ZombRand(0,9999)== 0 then	
		if ZombRand(0,2000)== 0 then
			----print("Crash Glass")
			local glass = square:addBrokenGlass()		
		  local glass = IsoBrokenGlass.new(getCell());
		  glass:setSquare(square);
		  square:AddSpecialObject(glass)
			mData.specialSquare = true
		end	
	elseif zoneType == "TownZone" or zoneType == "ZoneStory" or  zoneType == "TrailerPark"  then

		--if ZombRand(0,99) == 0 then
		if ZombRand(0,20) == 0 then
			local cont = scattered_trash(square)

		end
		--if square:getZ() > 0 and ZombRand(0,3999)== 0 then
		if square:getZ() > 0 and ZombRand(0,800)== 0 then
			----print("Roof Corpse Spawn")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		-- end		
		--elseif square:getZ()==0 and ZombRand(0,399)== 0 then
		elseif square:getZ()==0 and ZombRand(0,80)== 0 then
			----print("Corpse Spawn")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			if not body:isSkeleton() then body:setSkeleton(true) end
			local worn = body:getWornItems()
			worn:clear()		
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		end
		--if ZombRand(0,999)== 0 then
		if ZombRand(0,200)== 0 then
			----print("Crash Glass")
			local glass = square:addBrokenGlass()		
		  local glass = IsoBrokenGlass.new(getCell());
		  glass:setSquare(square);
		  square:AddSpecialObject(glass)
			mData.specialSquare = true
		end	
			
	elseif zoneType == "Vegitation"   or zoneType == "Farm" then

		--if ZombRand(0,999) == 0 then
		if ZombRand(0,200) == 0 then
			local cont = scattered_trash(square)
		end		
		--if ZombRand(0,1999)== 0 then
		if ZombRand(0,400)== 0 then
			----print("Corpse Spawn")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		end				
	elseif zoneType == "Forest" then

		--if ZombRand(0,9999) == 0 then
		if ZombRand(0,2000) == 0 then
			local cont = scattered_trash(square)
		end		
		--if ZombRand(0,99999)== 0 then
		if ZombRand(0,2000)== 0 then
			----print("Corpse Spawn")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		end				
	elseif zoneType == "DeepForest" then

		if ZombRand(0,2000) == 0 then
			local cont = scattered_trash(square)
		end		
		if ZombRand(0,20000)== 0 then
			----print("Corpse Spawn")
			
			local body = addZombiesInOutfit(square:getX(), square:getY(), square:getZ(), 1, "Naked", 100)
			body = body:get(0)
			--print("Body " .. tostring(body))
			local worn = body:getWornItems()
			worn:clear()		
			if not body:isSkeleton() then body:setSkeleton(true) end
			body:Kill(nil)
			local worn = body:getWornItems()
			worn:clear()		
			if body and ZombRand(0,3) == 0 then -- used so that all spawned bodies are not on their backs
				body:setFallOnFront(true)
			end
			mData.specialSquare = true
		end	
	end
	square:transmitModdata()
end
