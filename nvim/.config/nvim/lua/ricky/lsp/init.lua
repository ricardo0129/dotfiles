require("ricky.lsp.pyright")
require("ricky.lsp.clangd")

-- clangd setup
vim.lsp.config('clangd', {
    on_attach = on_attach,
})

-- pyright setup
vim.lsp.config('pyright', {
  before_init = function(_, config)
    local handle = io.popen("pipenv --venv 2>/dev/null")
    local result = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if result ~= "" then
      config.settings.python = {
        pythonPath = result .. "/bin/python"
      }
    end
  end,
  on_attach = on_attach
})


-- Never focus the floating signature window
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { focusable = false }
)

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = 'E'})
sign({name = 'DiagnosticSignWarn', text = 'W'})
sign({name = 'DiagnosticSignHint', text = 'H'})
sign({name = 'DiagnosticSignInfo', text = 'I'})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        source = 'always',
        header = '',
        prefix = '',
    },
})

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

