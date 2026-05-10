local auto = require("lualine.themes.auto")
local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }

-- Loop through all modes to ensure transparency
for _, field in ipairs(lualine_modes) do
	if auto[field] and auto[field].c then
		auto[field].c.bg = "NONE"
	end
end

require("lualine").setup({
	options = {
		theme = auto,
	},
})
