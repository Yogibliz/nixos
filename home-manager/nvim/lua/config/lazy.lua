local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	defaults = {
		lazy = true,
	},
	dev = {
		path = vim.g.nix_lazy_path, -- set by nvim.nix via extraLuaConfig
		patterns = { "" },
		fallback = true,
	},
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- Fix telescope-fzf-native on Nix
		{ "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
		-- Disable Mason (use extraPackages instead)
		{ "mason-org/mason-lspconfig.nvim", enabled = false },
		{ "mason-org/mason.nvim", enabled = false },
		-- Your plugins
		{ import = "plugins" },
		-- Treesitter: parsers handled by xdg.configFile."nvim/parser"
		{
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = {}
			end,
		},
	},
})
