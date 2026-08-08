task = {}

local waiting = {}

function task.wait(seconds)
	return coroutine.yield(seconds or 0)
end

function task.spawn(func)
	local thread = coroutine.create(func)

	local success, waitTime = coroutine.resume(thread)

	if not success then
		error(waitTime)
	end

	if coroutine.status(thread) ~= "dead" then
		table.insert(waiting, {
			thread = thread,
			time = waitTime or 0,
		})
	end
end

local function update(dt)
	for i = #waiting, 1, -1 do
		local t = waiting[i]

		t.time = t.time - dt

		if t.time <= 0 then
			local success, waitTime = coroutine.resume(t.thread)

			if not success then
				error(waitTime)
			end

			if coroutine.status(t.thread) == "dead" then
				table.remove(waiting, i)
			else
				t.time = waitTime or 0
			end
		end
	end
end

-- Automatically hook into Love2D
local oldLoveUpdate = love.update

function love.update(dt)
	update(dt)

	if oldLoveUpdate then
		oldLoveUpdate(dt)
	end
end
