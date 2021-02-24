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
  use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf' }, config = function()
    -- Properly position the fzf prompt:
    vim.g.fzf_layout = { down = '40%' }
    vim.g.fzf_preview_window = {}

    -- TODO: Exclude current file from prompt
    -- See https://github.com/junegunn/fzf.vim/issues/695

    -- Ctrl-P for file navigation
    -- TODO: It'd be great if matches in pwd are weighted higher.
    vim.api.nvim_set_keymap(
      'n',
      '<c-p>',
      [[(len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"]],
      { noremap = true, silent = true, expr = true}
    )

    -- Hide ruler and line numbers and stuff from fzf window.
    vim.cmd('autocmd FileType fzf set noshowmode noruler nospell nonu nornu')
  end }

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
  use 'neovim/nvim-lspconfig'

  -- Language-specific ===========================================================

  -- These are just highlighting:
  use 'cakebaker/scss-syntax.vim'

  -- Highlighting and some other features. Not sure I'm actually using those.
  use 'rust-lang/rust.vim'

  -- Very sophisticated and efficient highlighting for lots of languages:
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- UI ==========================================================================
  -- Show thin vertical lines on each indentation level:
  use { 'Yggdroot/indentLine', config = function()
    vim.g.indentLine_char = '│'
    vim.g.indentLine_color_gui = '#333333'
  end}
  -- The above doesn't draw anything on empty lines. This does:
  use 'lukas-reineke/indent-blankline.nvim'

  -- Show git blame at the end of lines.
  use { 'APZelos/blamer.nvim', config = function()
    vim.g.blamer_enabled = 1

    -- Don't have any delay. The delay gives an impression of laggyness.
    vim.g.blamer_delay = 0

    -- In visual mode it's visually annoying AND slows down Vim A LOT.
    vim.g.blamer_show_in_visual_modes = 0

    -- Default date format does not make sense.
    -- Can upstream make it localed-dependant?
    vim.g.blamer_date_format = '%Y-%m-%d'

    vim.cmd('highlight Blamer guifg=#c06371')
  end}

  use 'itchyny/lightline.vim'
  use 'maximbaz/lightline-ale'
  use 'airblade/vim-gitgutter'
  use 'dietsche/vim-lastplace'
  use 'ryanoasis/vim-devicons'

  -- Sidebar with symbols, tags, etc.
  use 'liuchengxu/vista.vim'

  -- Smooth scrolling
  use 'psliwka/vim-smoothie'

  -- Distraction-free writing.
  use 'junegunn/goyo.vim'

  -- Shortcuts ===================================================================
  use 'tomtom/tcomment_vim'

  -- Interoperability ============================================================
  use 'editorconfig/editorconfig-vim'
end)

-- Automatically recompile packer's... stuff.
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
