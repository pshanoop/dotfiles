-- Plugin definitions for neovim, using packer.nvim.
--
-- Many plugins have additional configuration files, which are named after the
-- plugin (e.g.: `fzf` has `_fzf.lua`). Each configuration file is executed
-- _after_ the plugin itself has been loaded.

-- Automatically install packer if it's not there.
-- You'll still need to run :PackerInstall".
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- Automatically recompile packer when this file changes.
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

require('packer').startup(function(use)
  -- Packer can manage itself.
  use 'wbthomason/packer.nvim'

  -- Core ========================================================================
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
    config = [[require('_fzf')]]
  }

  -- A few miscelaneous settings that just make sense.
  use 'tpope/vim-sensible'

  -- Completion.
  use { 'hrsh7th/nvim-compe', config = [[require('_compe')]]}

  -- My current theme: jellybeans
  use { 'nanotech/jellybeans.vim', config = [[require('_theme')]]}

  -- Save files using sudo via !SudaWrite.
  use 'lambdalisue/suda.vim'

  -- Configuration for various LSP servers.
  use {
    'neovim/nvim-lspconfig',
    requires = "nvim-lua/lsp-status.nvim",
    config = [[require('lsp')]]
  }

  -- Language-specific ===========================================================

  -- These are just highlighting:
  use 'cakebaker/scss-syntax.vim'  -- Highlighting.
  use 'keith/swift.vim'  -- Syntax and indent files.
  use 'b4b4r07/vim-hcl'  -- Highlighting and sets the right filetype.

  -- Highlighting and some other features. Not sure I'm actually using those.
  use 'rust-lang/rust.vim'

  -- Very sophisticated and efficient highlighting for lots of languages:
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('tree-sitter')]] }
  use 'nvim-treesitter/playground'

  -- UI ==========================================================================

  -- Show thin vertical lines on each indentation level:
  use { 'lukas-reineke/indent-blankline.nvim', branch='lua', config = [[require('_indentlines')]] }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require('_gitsigns')]]
  }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = [[require('_galaxyline')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use 'dietsche/vim-lastplace'
  use { 'simrat39/symbols-outline.nvim', config = [[require('_symbols_outline')]] }
  use 'psliwka/vim-smoothie'  -- Smooth scrolling

  -- Shortcuts ===================================================================
  use 'tomtom/tcomment_vim'

  -- Interoperability ============================================================
  use 'editorconfig/editorconfig-vim'
end)

-- Automatically recompile packer's... stuff.
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
