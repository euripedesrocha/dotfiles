-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'nvim-tree/nvim-web-devicons'
  use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }
  use 'kdheepak/tabline.nvim'

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    "FeiyouG/command_center.nvim",
    requires = { "nvim-telescope/telescope.nvim" }
  }
  use {
    "renerocksai/telekasten.nvim",
    requires = { "nvim-telescope/telescope.nvim", "renerocksai/calendar-vim" }
  }
  use {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup()
    end
  }
  -- -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }
  --
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "paopaol/cmp-doxygen",
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip' },
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use 'folke/lsp-trouble.nvim'
  use 'glepnir/lspsaga.nvim'
  use { 'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'numToStr/Comment.nvim',
  }
  use { "akinsho/toggleterm.nvim",
  }
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


--	-- surround vim
--	use 'tpope/vim-surround'
--
--	-- better hotfix window (for showing and searching through results in telescope's find usages)
--	-- TODO: learn how to use?
--	use {"kevinhwang91/nvim-bqf"}
--
--	-- prettier tabs
--	use 'romgrk/barbar.nvim'
--
--
--	-- support the missing lsp diagnostic colors
--	use 'folke/lsp-colors.nvim'
--
--
--	-- highlight variables under cursor
--	use 'RRethy/vim-illuminate'
--

-- "Plugin 'octol/vim-cpp-enhanced-highlight'
-- Plugin 'jackguo380/vim-lsp-cxx-highlight'
-- Plugin 'rhysd/vim-clang-format'
-- Plugin 'vim-voom/VOoM'
-- Plugin 'wakatime/vim-wakatime'
