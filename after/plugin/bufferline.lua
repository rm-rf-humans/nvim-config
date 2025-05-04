vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",       -- 👈 this must match the NvimTree filetype
        text = "File Explorer",      -- Optional: text displayed in the offset
        highlight = "Directory",     -- Optional: highlight group
        text_align = "left",         -- Options: "left" | "center" | "right"
        separator = true             -- Adds a visual separator line
      }
    },
    separator_style = "slant",       -- Optional: customize tab separators
    show_buffer_close_icons = true,
    show_close_icon = false,
    diagnostics = "nvim_lsp",        -- Optional: show LSP diagnostics in tabs
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    --hover effect and underline effect
    hover = {
      enabled = true,
      delay = 0,
      reveal = { "close" }
    	},
    }
}

vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "Q", ":BufferLinePickClose<CR>", {noremap = true, silent = true})
