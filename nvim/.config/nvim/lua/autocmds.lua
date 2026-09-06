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
