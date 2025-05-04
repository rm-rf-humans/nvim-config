local builtin = require('telescope.builtin')
require("telescope").load_extension("file_browser")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>e', builtin.diagnostics, { desc = 'Telescope diagnostics' })
--open the directory of the current file
vim.keymap.set('n', '<leader>ce', function()
  builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Telescope find files in current directory' })

vim.keymap.set("n", "<leader>fa", function()
  require("telescope").extensions.file_browser.file_browser({
    path = vim.loop.os_homedir(),
    hidden = true,
    respect_gitignore = false,
  })
end, { desc = "File browser from ~ (with hidden)" })

vim.keymap.set("n", "<leader>fd", function()
  require("telescope").extensions.file_browser.file_browser({
    prompt_title = "📁 Open Workspace (Directory)",
    path = vim.loop.os_homedir(),
    select_buffer = true,
    hidden = true,
    respect_gitignore = false,
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      map("i", "<CR>", function()
        local entry = require("telescope.actions.state").get_selected_entry()
        local dir = entry and entry.Path and entry.Path:is_dir() and entry.Path:absolute()
        if dir then
          actions.close(prompt_bufnr)
          vim.cmd("cd " .. dir)
          vim.cmd("edit .")
          print("📂 Changed workspace to: " .. dir)
        end
      end)

      return true
    end,
  })
end, { desc = "Change root directory like VSCode workspace" })

