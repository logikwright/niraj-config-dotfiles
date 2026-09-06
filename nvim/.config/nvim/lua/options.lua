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

