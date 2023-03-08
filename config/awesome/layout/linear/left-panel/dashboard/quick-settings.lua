local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local bar_color = beautiful.groups_bg
local dpi = beautiful.xresources.apply_dpi
local toggle_widgets = require("widget.toggles")
local volume_slider = require("widget.volume-slider")
local brightness_slider = require("widget.brightness-slider")
local blur_slider = require("widget.blur-slider")

local quick_header = wibox.widget({
	text = "Quick Settings",
	font = "Inter Regular 12",
	align = "left",
	valign = "center",
	widget = wibox.widget.textbox,
})

return wibox.widget({
	layout = wibox.layout.fixed.vertical,
	spacing = dpi(7),
	{
		layout = wibox.layout.fixed.vertical,
		{
			{
				quick_header,
				left = dpi(24),
				right = dpi(24),
				widget = wibox.container.margin,
			},
			forced_height = dpi(35),
			bg = beautiful.groups_title_bg,
			border_width = dpi(1),
			border_color = beautiful.groups_title_bg,
			shape = function(cr, width, height)
				gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, beautiful.groups_radius)
			end,
			widget = wibox.container.background,
		},
		{
			layout = wibox.layout.fixed.vertical,
			spacing = dpi(7),
			{
				{
					layout = wibox.layout.fixed.vertical,
					brightness_slider,
					volume_slider,
					toggle_widgets.airplane_mode.circular,
					toggle_widgets.keyboard_light.circular,
					toggle_widgets.blue_light.circular,
				},
				bg = beautiful.groups_bg,
				border_width = dpi(1),
				border_color = beautiful.groups_title_bg,
				shape = function(cr, width, height)
					gears.shape.partially_rounded_rect(
						cr,
						width,
						height,
						false,
						false,
						true,
						true,
						beautiful.groups_radius
					)
				end,
				widget = wibox.container.background,
			},
			{
				{
					layout = wibox.layout.fixed.vertical,
					blur_slider,
					toggle_widgets.blur_effects.circular,
				},
				bg = beautiful.groups_bg,
				border_width = dpi(1),
				border_color = beautiful.groups_title_bg,
				shape = function(cr, width, height)
					gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius)
				end,
				widget = wibox.container.background,
			},
		},
	},
})