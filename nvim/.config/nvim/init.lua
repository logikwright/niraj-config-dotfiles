--==================================================
-- Leader Key
--==================================================

-- Set the leader key to Space
-- The leader key is used as a prefix for custom shortcuts.
-- Example:
--  <leader>ff  -> Space f f
vim.g.mapleader = " "

--==================================================
-- Editor Options
--==================================================

-- Show absolute line numbers.
vim.opt.number = true

-- Show relative line numbers for easier movement.
vim.opt.relativenumber = true

-- Highlight the line where the cursor is.
vim.opt.cursorline = true

-- Keep atleast 10 lines visible above and below the curosr
-- while scrolling.
vim.opt.scrolloff = 10

--==================================================
-- Indentation
--==================================================

-- Automatically copy indentation from the previous line.
vim.opt.autoindent = true

-- Make indentation smarter for programming languages.
vim.opt.smartindent = true

-- Display a tab character as 4 spaces.
vim.opt.tabstop = 4

-- Indent and unindent by 4 spaces.
vim.opt.shiftwidth = 4

-- Make the Tab key behave like 4 spaces while editing.
vim.opt.softtabstop = 4

-- Insert spaces instead of actual tab characters.
vim.opt.expandtab = true

--==================================================
-- Spell Checking
--==================================================

-- Create an autocommand group for spell checking.
vim.api.nvim_create_augroup("SpellCheck", { clear = true })

-- Enable spell checking only for writing-related file types.
vim.api.nvim_create_autocmd("FileType", {
	group = "SpellCheck",
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
        -- Enable spell checking for this buffer only.
		vim.opt_local.spell = true

        -- Use the English dictionary.
		vim.opt_local.spelllang = "en"
	end,
})

--==================================================
-- WSL Clipboard
--==================================================

-- Create an autocommand group for clipboard integeration.
vim.api.nvim_create_augroup("WSLClipboard", { clear = true })

-- After every yank operation ...
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "WSLClipboard",
	callback = function()
        -- Only copy after a yank (not delete/change).
		if vim.v.event.operator == "y" then
            -- Send the yanked text to the Windows clipboard
            -- using the existing vim-copy script.
			vim.fn.system("vim-copy", vim.fn.getreg("0"))
		end
	end,
})
