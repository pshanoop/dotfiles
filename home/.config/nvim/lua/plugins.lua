-- Automatically install packer if it's not there.
-- Great for bootstrapping new setups.
-- You'll still need to run :PackerCompile and :PackerInstall")
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

require('packer').startup(function()
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
  use { 'neovim/nvim-lspconfig', config = [[require('lsp')]]}

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

  use 'itchyny/lightline.vim'
  use 'dietsche/vim-lastplace'
  use 'ryanoasis/vim-devicons'
  use { 'simrat39/symbols-outline.nvim', config = [[require('_symbols_outline')]] }
  use 'psliwka/vim-smoothie'  -- Smooth scrolling

  -- Distraction-free writing.
  use 'junegunn/goyo.vim'

  -- Shortcuts ===================================================================
  use 'tomtom/tcomment_vim'

  -- Interoperability ============================================================
  use 'editorconfig/editorconfig-vim'
end)

-- Automatically recompile packer's... stuff.
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
