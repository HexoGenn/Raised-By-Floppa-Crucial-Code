function(r,cd,func)
	local plrs = {}
	
	if r:IsA("RemoteEvent") then
		r.OnServerEvent:Connect(function(plr,a,b,c,d,e,f,g) --pain, i forgot how to use "..." --... argument with a table that contains all other arguments i think idk
			if p then return end
			table.insert(plrs,plr.UserId)
			local _,err = pcall(func,plr,a,b,c,d,e,f,g)
			if err then warn(err) end
			task.wait(cd)
			table.remove(plrs,table.find(plrs,plr.UserId))
		end)
	elseif r:IsA("RemoteFunction") then
		r.OnServerInvoke = function(plr,a,b,c,d,e,f,g) --pain, i forgot how to use "..." --... argument with a table that contains all other arguments i think idk
			if table.find(plrs,plr.UserId) then return end
			table.insert(plrs,plr.UserId)
			local result = nil
			local _,err = pcall(function()
				result = func(plr,a,b,c,d,e,f,g)
			end)
			if err then warn(err) end
			task.delay(cd,function()
				table.remove(plrs,table.find(plrs,plr.UserId))
			end)
			return result
		end
	end
end
