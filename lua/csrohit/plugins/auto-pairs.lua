-- File: lua/csrohit/plugins/autopairs.lua

return {
	"windwp/nvim-autopairs",
	config = function ()
		require('nvim-autopairs').setup()
	end,
}
