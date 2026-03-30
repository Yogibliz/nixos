-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- LaTeX engine swap between pdfLaTeX and XeLaTeX
vim.api.nvim_create_user_command("ToggleLatexEngine", function()
	local current_opts = vim.tbl_deep_extend("force", {}, vim.g.vimtex_compiler_latexmk or {})
	if (current_opts.engine or "-pdf") == "-pdf" then
		current_opts.engine = "-xelatex"
		print("VimTeX: Switched to XeLaTeX. Restart compiler (\\lk then \\ll) to apply.")
	else
		current_opts.engine = "-pdf"
		print("VimTeX: Switched to pdfLaTeX. Restart compiler (\\lk then \\ll) to apply.")
	end
	vim.g.vimtex_compiler_latexmk = current_opts
end, { desc = "Toggle between pdflatex and xelatex in VimTeX" })

vim.keymap.set(
	"n",
	"<leader>te",
	":ToggleLatexEngine<CR>",
	{ noremap = true, silent = true, desc = "Toggle LaTeX Engine" }
)

-- Tabbing
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Remove newline from row without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Movement
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", ";", "^")
vim.keymap.set("n", "'", "$")

-- Diagnostic navigation
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next Diagnostic" })
