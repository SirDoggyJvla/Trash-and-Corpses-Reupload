function Skeletonize_Zombie(zombie)
	if not zombie:isSkeleton() then zombie:setSkeleton(true) end
	if not zombie:getOutfitName() then return end
	if not zombie:isSkeleton() then return end
	local index = zombie:getHumanVisual():getSkinTextureIndex()
	local mData = zombie:getModData()
	if zombie:getOutfitName():contains("Scavid") then 		
		if not mData.skeleSkin then 
			local roll = ZombRand(2)
			if roll ==1 then roll = ZombRand(2) end	
			mData.skeleSkin = roll
		end
		local skin = mData.skeleSkin
		if index ~= skin then zombie:getHumanVisual():setSkinTextureIndex(skin) end
	elseif zombie:getOutfitName():contains("Berzerker") then 
		--local mData = zombie:getModData()
		if not mData.skeleSkin then mData.skeleSkin = 2 end
		if index ~= 2 then zombie:getHumanVisual():setSkinTextureIndex(mData.skeleSkin) end
	elseif mData.skeleSkin then
		zombie:getHumanVisual():setSkinTextureIndex(mData.skeleSkin)
	end
end	