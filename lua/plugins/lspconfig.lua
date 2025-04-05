return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      { 'j-hui/fidget.nvim',       opts = {} },
      'saghen/blink.cmp',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    config = function()
      ----------------------------------------------------------------
      -- 💡 Helper: Keymaps + LSP Attach
      ----------------------------------------------------------------
      local function on_attach(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Document highlighting
        if client and client.server_capabilities.documentHighlightProvider then
          local group = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = group,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = group, buffer = event2.buf }
            end,
          })
        end

        -- Inlay hints
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
          end, '[T]oggle Inlay [H]ints')
        end
      end

      ----------------------------------------------------------------
      -- 🧠 Capabilities
      ----------------------------------------------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
      capabilities.workspace.workspaceFolders = true

      ----------------------------------------------------------------
      -- 🔧 Servers Setup
      ----------------------------------------------------------------
      local servers = {
        eslint = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'EslintFixAll',
            })
          end,
        },
        vtsls = {},
        protolint = {},
        buf = {},
        prettierd = {},
        prettier = {},
        jsonls = {
          settings = {
            json = {
              schemas = {
                {
                  fileMatch = { 'package.json' },
                  url = 'https://json.schemastore.org/package.json',
                },
              },
            },
          },
        },
        clangd = {},
        sqlls = {},
        sqlfmt = {},
        gopls = {
          gofumpt = true,
          codelenses = {
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
            regenerate_cgo = true,
            generate = true,
            gc_details = false,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          vulncheck = 'Imports',
          staticcheck = true,
          directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
          semanticTokens = true,
        },
        pyright = {},
        rust_analyzer = {},
        cssls = {},
        html = {},
        taplo = {},
        hclfmt = {},
        astro = {},
        nginx_language_server = {},
        tailwindcss = {},
        terraformls = {
          on_attach = function()
            vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
              pattern = { '*.tf', '*.tfvars' },
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end,
        },
        dockerls = {},
        docker_compose_language_service = {},
        volar = {},
        yamlls = {},
        stylelint = {},
        csharp_ls = {},
        markdown_oxide = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      ----------------------------------------------------------------
      -- 📦 Mason + LSP Setup
      ----------------------------------------------------------------
      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      ----------------------------------------------------------------
      -- 📌 LspAttach Autocmd
      ----------------------------------------------------------------
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = on_attach,
      })
    end,
  },
}
