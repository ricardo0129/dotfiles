require("ricky.lsp.pyright")
require("ricky.lsp.clangd")


vim.diagnostic.config({
  virtual_text = true, -- Ensure this is set to true
  -- other diagnostic configurations
})


vim.api.nvim_create_autocmd("TextChangedI", {
  callback = function()
    local col = vim.fn.col(".") - 1
    local char = vim.fn.getline("."):sub(col, col)
    if char == "(" then
      vim.lsp.buf.signature_help()
    end
  end,
})

-- clangd setup
require("lspconfig").clangd.setup {
  on_attach = on_attach,
}

-- pyright setup
require("lspconfig").pyright.setup {
  on_attach = on_attach,
}

-- Never focus the floating signature window
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { focusable = false }
)
