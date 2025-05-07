return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      proto = { 'buf' },
      lua = { 'stylua' },
      typescript = { 'prettierd' },
      javascript = { 'prettierd' },
    },
    format_on_save = {
      timeout_ms = 250,
      lsp_format = 'fallback',
    },
  },
}
