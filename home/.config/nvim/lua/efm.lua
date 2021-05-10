-- EFM is a generic language server which can levarage various developer tools
-- that are not actual LSPs themselves. This allows having a single interface
-- to plug in all sorts of tools, like eslint, black, etc.

local M = {}

local black = {
  formatCommand = "black -",
  formatStdin = true
}

local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {
    "%f:%l:%c: %m [%t%r]",
  }
}

local flake8 =  {
  -- Requires flake8-efm
  lintCommand = "flake8 --format efm --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = {
    "%f:%l:%c:%t:%m",
  }
}

local mypy = {
  lintCommand = "mypy --show-column-numbers --ignore-missing-imports",
  lintIgnoreExitCode = true,
  lintFormats = {
    "%f:%l:%c: %trror: %m",
    "%f:%l:%c: %tarning: %m",
    "%f:%l:%c: %tote: %m",
  }
}

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local reorder_python_imports = {
  formatCommand = "reorder-python-imports -",
  formatStdin = true
}

local shellcheck = {
  lintCommand = "shellcheck -f gcc -x",
  lintSource = "shellcheck",
  lintFormats = {
    '%f:%l:%c: %trror: %m',
    '%f:%l:%c: %tarning: %m',
    '%f:%l:%c: %tote: %m',
  }
}

M.languages = {
  css = {prettier},
  html = {prettier},
  javascript = {prettier, eslint},
  json = {prettier},
  python = {flake8, mypy, black, reorder_python_imports},
  scss = {prettier},
  sh = {shellcheck},
  typescript = {prettier, eslint},
  vue = {prettier},
  yaml = {prettier},
  -- TODO: sql -> pgformatter
  -- TODO: swift -> swiftformat
}

M.filetypes = {}
for k, _ in pairs(M.languages) do
  M.filetypes[#M.filetypes + 1] = k
end

return M
