
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
    use 'luisiacc/gruvbox-baby'
    use 'vim-airline/vim-airline'
    use 'ms-jpq/coq_nvim'
    use 'preservim/tagbar'
    use 'nvim-treesitter/nvim-treesitter'
    use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
    -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
    }
    --use 'rcarriga/nvim-notify'
    --use 'ldelossa/nvim-ide'
    vim.cmd('colorscheme gruvbox-baby')
end)

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.setup()


vim.cmd('nmap <F8> :TagbarToggle<CR>')

vim.bo.filetype = 'lua'

vim.opt.autoindent = true
vim.opt.autowrite = true

--[[
local bufferlist      = require('ide.components.bufferlist')
local explorer        = require('ide.components.explorer')
local outline         = require('ide.components.outline')
local callhierarchy   = require('ide.components.callhierarchy')
local timeline        = require('ide.components.timeline')
local terminal        = require('ide.components.terminal')
local terminalbrowser = require('ide.components.terminal.terminalbrowser')
local changes         = require('ide.components.changes')
local commits         = require('ide.components.commits')
local branches        = require('ide.components.branches')
local bookmarks       = require('ide.components.bookmarks')

require('ide').setup({
    icon_set = "default",
    log_level = "info",
    components = {
        global_keymaps = {
        },
    },
    panels = {
        left = "explorer",
        right = "git"
    },
    panel_groups = {
        explorer = { outline.Name, bufferlist.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
        terminal = { terminal.Name },
        git = { changes.Name, commits.Name, timeline.Name, branches.Name }
    },
    workspaces = {
        auto_open = 'left',
    },
    panel_sizes = {
        left = 30,
        right = 30,
        bottom = 15
    }
})
]]

local set = vim.opt

--set the behavior of tab

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true



