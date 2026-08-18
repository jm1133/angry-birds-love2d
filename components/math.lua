if _G.math then

	for name, func in pairs(_G.math) do

		if type(func) == "function" then
			_G[name] = func
		end

	end

end
