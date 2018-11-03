dirs    = { "tn", "pd", "apis"  }
sources = { "/db/backup/daily", "/home" }

local source, target

for _, dir in ipairs(dirs) do
	for s, src in ipairs(sources) do
		if s == 2 then
			source = src .. '/' .. dir .. '/www'
			if dir == 'apis' then
				target = "/backupdrive/pams/services/s2/" .. dir
			else
				target = "/backupdrive/pams/" .. dir .. '/app'
			end
		else
			if dir ~= 'apis' then
				if dir == 'pd' then
					source = src .. '/pede'
				else
					source = src .. '/' .. dir
				end
				target = "/backupdrive/pams/" .. dir .. '/db'
			else
				source = nil
				target = nil
			end
		end

		if target ~= nil and source ~= nil then
			print (source .. ' --> ' .. target)
			-- sync { here }
		end
	end
end
