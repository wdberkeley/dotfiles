-- wdberkeley's Lua neovim configuration.

-- `vim` is provided by neovim so don't warn.
---@diagnostic disable-next-line: lowercase-global
vim = vim

-- Abbreviations.
local opt = vim.opt
local map = vim.keymap.set
local g = vim.g

-- Tabs, spaces, etc.
opt.tabstop=2         -- Number of spaces shown per tab character.
opt.softtabstop=2     -- Number of spaces added per tab entered.
opt.expandtab = true  -- Expand tabs as spaces.
opt.cindent = true    -- Use C indenting rules as a reasonable default.
opt.shiftwidth=0      -- Use tabstop's value for how much to indent by, per indent.

opt.list = true                             -- Show certain 'invisible' characters (\t, \n).
opt.listchars="tab:>-,eol:¬,trail:-,nbsp:+" -- Set symbols for invisible characters.

-- Location and command information.
opt.title = true       -- Show file info in the title bar.
opt.number = true      -- Show line numbers.
opt.ruler = true       -- Show cursor position.
opt.showcmd = true     -- Show command as it is being typed.
opt.laststatus=2       -- Always show the status line at the bottom.
opt.cursorline = true  -- Highlight current line.
opt.colorcolumn='85'   -- Highlight the 85th column.
opt.visualbell = true  -- On error, blink cursor instead of beeping.
opt.showmatch = true   -- Show matching delimiter briefly.
opt.scrolloff=3        -- Show at least three lines above and below the cursor.

-- Buffers, tabs, windows.
opt.hidden = true  -- Permits hiding buffers with unsaved changes.

-- Searching.
opt.ignorecase = true  -- Case-insensitive search...
opt.smartcase = true   -- ...except if the search text contains capital letters
opt.hlsearch = false   -- Don't highlight previous search matches.

opt.backspace="indent,eol,start"  -- Backspace behaves 'normally'.

-- Keymappings and controls.
g.mapleader = ","
map('n', ';', ':')      -- No <shift> needed for commands.
g.maplocalleader = "\\"
map('i', ';;', '<ESC>') -- Escape is too far away.

-- Plugin manager: lazy

-- Setup.
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  --lazy.install(lazy.path)

  opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.setup({
  {'sjl/badwolf'},
  {'junegunn/fzf'},
  {'jremmen/vim-ripgrep'},
  {'nvim-lua/plenary.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {'lervag/vimtex'},
})

-- fzf
-- Remember the following shortcuts for opening buffers from fzf:
--   ctrl + t = tab split
--   ctrl + x = split
--   ctrl + v = vertical split
map('n', '<leader>fzf', ':FZF')

-- vim-ripgrep
map('n', '<leader>rg',  ':Rg')

-- LSP.
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local lsp = require('lspconfig')
lsp.rust_analyzer.setup{}
lsp.gopls.setup{}
lsp.texlab.setup{}
lsp.r_language_server.setup{}
lsp.lua_ls.setup{}             -- For basics. Won't see nvim plugin code.

-- Snippets.
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
vim.cmd([[
  " Expand or jump in insert mode.
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'Tab' 

  " Jump forward through tabstops in visual mode.
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

  " Jump backward through snippet tabstops with Shift-Tab (for example).
  imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

require("luasnip").config.set_config({
  enable_autosnippets = true,

  -- Use Tab to trigger visual selection.
  store_selection_keys = "<Tab>",
})

-- Colors.
opt.termguicolors = true
vim.cmd.colorscheme('goodwolf')

