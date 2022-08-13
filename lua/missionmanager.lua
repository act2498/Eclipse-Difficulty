if Global.editor_mode then
	StreamHeist:log("Editor mode is active, mission script changes disabled")
	return
end


-- Add custom mission script changes and triggers for specific levels
-- Execution of mission scripts can trigger reinforce locations (trigger that has just a name disables previously enabled reinforcement with that id)
-- Mission script elements can be disabled or enabled
local mission_script_elements = StreamHeist:mission_script_patches()
if not mission_script_elements then
	return
end

Hooks:PostHook(MissionManager, "_activate_mission", "sh__activate_mission", function (self)
	for element_id, data in pairs(mission_script_elements) do
		local element = self:get_element_by_id(element_id)
		if not element then
			StreamHeist:error("Mission script element", element_id, "could not be found")
		else
			-- Check if this element is supposed to trigger reinforce points
			if data.reinforce then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_reinforce_" .. element_id, function ()
					StreamHeist:log(string.format("%s executed, toggled %u reinforce point(s)", element:editor_name(), #data.reinforce))
					for _, v in pairs(data.reinforce) do
						managers.groupai:state():set_area_min_police_force(v.name, v.force, v.position)
					end
				end)
				StreamHeist:log(string.format("%s hooked as reinforce trigger for %u area(s)", element:editor_name(), #data.reinforce))
			end

			-- Check if this element is supposed to trigger a difficulty change
			if data.difficulty then
				Hooks:PostHook(element, "on_executed", "sh_on_executed_difficulty_" .. element_id, function ()
					StreamHeist:log(string.format("%s executed, set difficulty to %.2f", element:editor_name(), data.difficulty))
					managers.groupai:state():set_difficulty(data.difficulty)
				end)
				StreamHeist:log(string.format("%s hooked as difficulty change trigger", element:editor_name()))
			end

			-- Check if this element has custom values set
			if data.values then
				for k, v in pairs(data.values) do
					element._values[k] = v
					StreamHeist:log(string.format("%s value \"%s\" has been set to \"%s\"", element:editor_name(), k, tostring(v)))
				end
			end
		end
	end
end)