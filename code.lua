return {
	__newindex = function(_,plr,dataToSave)
		if dataToSave and type(dataToSave) == "table" then
			rawset(playerData,plr.Name,dataToSave)
		end
		
	end;
	__call = function(_,plr)
		
		local data = rawget(playerData,plr.Name)
		
		if not data then
			--warn("player has no data in memory, getting from datastore...")
			local suc, err

			while not suc do
				suc, err = pcall(function()
					data = DataStore:GetAsync("Products"..(disguise or plr.UserId)) or {}
				end)
				if not suc then warn(err) task.wait(3) end
			end

			playerData[plr] = data

		else
			--warn("player already has data in memory")
		end
		
		return data
	end;
}
