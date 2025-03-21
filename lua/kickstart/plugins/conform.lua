---@module "conform"
return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'first' }
        end,
        mode = 'n',
        desc = '[F]ormat buffer',
      },
    },
    opts = {

      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        go = { 'goimports', 'gofumpt' },
        html = { 'prettierd', 'prettier' },
        gotmpl = { 'gofumpt' },
        gotexttmpl = { 'gofumpt' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        typescriptreact = { 'prettierd', 'prettier' },
        javascriptreact = { 'prettierd', 'prettier' },
        json = { 'prettierd' },
        markdown = { 'mdformat' },
        yaml = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        scss = { 'prettierd', 'prettier' },
        vue = { 'prettierd', 'prettier' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
