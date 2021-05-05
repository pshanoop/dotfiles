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
  lintStdin = true
}

local flake8 =  {
  lintCommand = "flake8 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = {"%f:%l:%c: %m"}
}

local mypy = {
  lintCommand = "mypy --show-column-numbers --ignore-missing-imports",
  lintFormats = {
    "%f=%l:%c: %trror: %m",
    "%f=%l:%c: %tarning: %m",
    "%f=%l:%c: %tote: %m"
  }
}

local prettier = {
  formatCommand = "./node_modules/.bin/prettier"
}

local reorder_python_imports = {
  formatCommand = "reorder-python-imports -",
  formatStdin = true
}

M.languages = {
  css = {prettier},
  html = {prettier},
  javascript = {prettier, eslint},
  json = {prettier},
  python = {flake8, mypy, black, reorder_python_imports},
  scss = {prettier},
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
