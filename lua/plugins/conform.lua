return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      proto = { 'buf' },
      lua = { 'stylua' },
    },
    format_on_save = {
      timeout_ms = 250,
      lsp_format = 'fallback',
    },
  },
}
