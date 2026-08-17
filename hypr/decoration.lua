hl.config({
	decoration = {
		rounding = 15,
		-- rounding_power = ,

		active_opacity = 0.85,
		inactive_opacity = 0.85,

		shadow = {
			enabled = false,
			range = 30,
			render_power = 5,
			offset = "0 5",
			color = "rgba(00000070)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 4,
			vibrancy = 0.5,
			brightness = 1,
			-- noise = 0.1,
			popups = true,
            input_methods = true,
			popups_ignorealpha = 0.2,
			-- xray = true,
			new_optimizations = true,
		},
	},
})
