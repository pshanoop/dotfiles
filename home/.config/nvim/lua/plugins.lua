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
    config = [[require('config/fzf')]]
  }


  -- Syntax checking and linting.
  use { 'dense-analysis/ale', config = function()
    vim.cmd('highlight ALEError guifg=White guibg=Red')
    vim.cmd('highlight ALEWarning guifg=White guibg=Teal')

    -- Clearing these two sets them to black, rather than the original gutter color.
    -- I've copy-pasted this colour is copied over from the theme.
    vim.cmd('highlight ALEErrorSign guifg=#cf6242 guibg=#333333')
    vim.cmd('highlight ALEWarningSign guifg=#ffb964 guibg=#333333')

    vim.g.ale_sign_error = ''
    vim.g.ale_sign_warning = ''

    vim.g.ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'
  end}

  -- A few miscelaneous settings that just make sense.
  use 'tpope/vim-sensible'

  -- Completion.
  use 'hrsh7th/nvim-compe'

  -- My current theme: jellybeans
  use { 'nanotech/jellybeans.vim', config = function()
    vim.g.jellybeans_use_term_italics = 1
    vim.g.jellybeans_overrides = { background = { guibg= '000000' } }

    vim.cmd 'colorscheme jellybeans'
  end}

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
  use { 'Yggdroot/indentLine', config = function()
    vim.g.indentLine_char = '│'
    vim.g.indentLine_color_gui = '#333333'
  end}
  -- XXX: The below doesn't always work. Do I need to enforce a loading order?
  -- The above doesn't draw anything on empty lines. This does:
  use 'lukas-reineke/indent-blankline.nvim'

  -- Show git blame at the end of lines.
  use { 'APZelos/blamer.nvim', config = [[require('config.blamer')]] }

  use 'itchyny/lightline.vim'
  use 'maximbaz/lightline-ale'
  use 'airblade/vim-gitgutter'  -- Shows git status in the gutter.
  use 'dietsche/vim-lastplace'
  use 'ryanoasis/vim-devicons'
  use 'liuchengxu/vista.vim'  -- Sidebar with symbols, tags, etc.
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
