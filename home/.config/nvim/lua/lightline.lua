M = {}

local diagnostics = require('lsp-status/diagnostics')
local icons = {
  errors = " ",
  warnings = " ",
  hints = "? ",
  info = " ",
}

function M.getDiagnostics(level)
  local bufnr = vim.api.nvim_get_current_buf()

  if #vim.lsp.buf_get_clients(bufnr) == 0 then
    return ""
  end

  local buf_diagnostics = diagnostics(bufnr)

  if buf_diagnostics[level] > 0 then
    return icons[level] .. buf_diagnostics[level]
  end

  return ""
end

function M.getStatus()
  local bufnr = vim.api.nvim_get_current_buf()

  if #vim.lsp.buf_get_clients(bufnr) == 0 then
    return ""
  end

  return ""
end

vim.g.lightline = {
  colorscheme = 'jellybeans',
  -- TODO: Add hints
  component_expand = {
    lsp_status= 'LspStatus',
    lsp_errors= 'LspErrors',
    lsp_warnings= 'LspWarnings',
    lsp_infos= 'LspInfos',
  },
  component_type = {
    lsp_status = 'tabsel',
    lsp_errors = 'error',
    lsp_warnings = 'warning',
    lsp_infos = 'warning',
  },
  component_function = {
    filetype = 'MyFiletype',
    fileformat = 'MyFileformat',
    filename = 'MyFilename',
  },
  active = {
    right = {
      {'lsp_status', 'lsp_errors', 'lsp_warnings', 'lsp_hints', 'lsp_infos', 'lineinfo'},
      {'percent'},
      {'fileformat', 'fileencoding', 'filetype'},
    }
  }
}

return M
