require("conform").setup({
  formatters_by_ft = {
    python = { "black", "isort" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    javascript = { "eslint_d", "prettierd" },
    typescript = { "eslint_d", "prettierd" },
    typescriptreact = { "eslint_d", "prettierd" },
    javascriptreact = { "eslint_d", "prettierd" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 1000,
  },
})
