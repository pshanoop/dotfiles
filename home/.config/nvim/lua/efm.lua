-- EFM is a generic language server which can levarage various developer tools
-- that are not actual LSPs themselves. This allows having a single interface
-- to plug in all sorts of tools, like eslint, black, etc.

local M = {}

M.eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
  lintIgnoreExitCode = true,
  lintStdin = true
}

M.prettier = {
  formatCommand = "./node_modules/.bin/prettier"
}

return M
