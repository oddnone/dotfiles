-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    -- Expand the tree to the current buffer's file whenever you switch buffers
    -- (e.g. after opening a file from Telescope)
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false, -- collapse dirs that were auto-expanded once you move away
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
