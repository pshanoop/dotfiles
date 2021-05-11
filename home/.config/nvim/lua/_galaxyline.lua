local sections = require('galaxyline').section
local fileinfo = require('galaxyline.provider_fileinfo')
local lsp_messages = require('lsp-status/messaging').messages

-- These are copied over from jellybeans.
-- Moving to a lua-based theme rewrite would allow trimming this out.
local theme = {
  base03 = '#151513',
  base02 = '#30302c',
  base01 = '#4e4e43',
  base00 = '#666656',
  base0 = '#808070',
  base1 = '#949484',
  base2 = '#a8a897',
  base3 = '#e8e8d3',
  yellow = '#ffb964',
  orange = '#fad07a',
  red = '#cf6a4c',
  magenta = '#f0a0c0',
  blue = '#8197bf',
  cyan = '#8fbfdc',
  green = '#99ad6a',
}

local mode_map = {
    ['n'] = {'NORMAL', theme.blue},
    ['i'] = {'INSERT', theme.green},
    ['R'] = {'REPLACE', theme.red},
    ['v'] = {'VISUAL', theme.magenta},
    ['V'] = {'V-LINE', theme.magenta},
    [''] = {'V-BLOCK', theme.magenta},
    ['c'] = {'COMMAND', theme.blue},
    ['s'] = {'SELECT', theme.magenta},
    ['S'] = {'S-LINE', theme.magenta},
    [''] = {'S-BLOCK', theme.magenta},
    ['t'] = {'TERMINAL', theme.blue},
    -- ['Rv'] = {'VIRTUAL'},
    -- ['rm'] = {'--MORE'},
}

local spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}

-- One space is always trimmed (by galaxyline?)
local space = function() return '  ' end
local inner_separator = function() return '|' end
local function filename()
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then
    file = '[No Name]'
  end

  if vim.bo.modifiable and vim.bo.modified then
    return file .. ' | + '
  end
  return file .. ' '
end

local function readonly()
  if vim.bo.readonly == true then return "RO | " end
  return ""
end

sections.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode = mode_map[vim.fn.mode()]

      vim.api.nvim_command('hi GalaxyViMode guifg='..theme.base02..' guibg='..mode[2])
      return string.format("  %s ", mode[1])
    end,
  },
}

sections.left[2] = {
  FileIcon = {
    provider = {space, readonly, 'FileIcon', filename},
    highlight = {theme.base3, theme.base01},
  }
}

sections.left[3] = {
  LspProgress = {
    provider = {function()
      local msgs = lsp_messages()
      local spinner

      if #msgs > 0 and msgs[1].spinner then
        local index = (msgs[1].spinner % #spinner_frames) + 1
        spinner = spinner_frames[index]
      else
        spinner = ""
      end

      return spinner
    end},
    highlight = {theme.base00, theme.base02}
  }
}

sections.left[4] = {
  Void = {
    provider = {space},
    highlight = {theme.base00, theme.base02}
  }
}

sections.right[1] = {
  FileInfo = {
    provider = {
      function() return vim.bo.fileformat end,
      inner_separator,
      -- fenc might be empty, in which case we want to exlude the separator
      function() return vim.bo.fenc or vim.o.enc end,
      inner_separator,
      function() return vim.bo.filetype end,
      fileinfo.get_file_icon,
    },
    icon = " ",
    highlight = {theme.base00, theme.base02},
  },
}

sections.right[2] = {
  LinePercent = {
    provider = 'LinePercent',
    icon = " ",
    highlight = {theme.base2, theme.base01},
  },
}

sections.right[3] = {
  LineInfo = {
    provider = function()
      return string.format(" %d:%d ", vim.fn.line('.'), vim.fn.col('.'))
    end,
    highlight = {theme.base02, theme.base1},
    icon = " ",
  },
}

sections.right[4] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '   ',
    highlight = {theme.yellow,theme.base01},
  }
}

sections.right[5] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '   ',
    highlight = {theme.yellow,theme.base01},
  }
}

sections.right[6] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '   ',
    highlight = {theme.yellow,theme.base01},
  }
}

sections.right[7] = {
  DiagnosticError = {
    provider = { 'DiagnosticError'},
    icon = '   ',
    highlight = {theme.red, theme.base02},
  }
}
