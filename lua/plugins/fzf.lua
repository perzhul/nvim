return {
    "ibhagwan/fzf-lua",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            init = function()
                require("nvim-web-devicons").setup({ default = true })
            end,
            lazy = true,
        },
    },
    keys = {
        { "<leader><leader>", function() require("fzf-lua").files() end,                                   desc = "[F]ind files" },
        { "<leader>sh",       function() require("fzf-lua").git_commits() end,                             desc = "[S]earch [H]istory" },
        { "<leader>sb",       function() require("fzf-lua").git_branches() end,                            desc = "[S]earch [B]ranches" },
        -- { "<leader>sk",       function() require("fzf-lua").keymaps() end,                                 desc = "[S]earch [K]eymaps" },
        { "<leader>sw",       function() require("fzf-lua").grep_cword() end,                              desc = "[S]earch current [W]ord" },
        { "<leader>sg",       function() require("fzf-lua").live_grep() end,                               desc = "[S]earch by [G]rep" },
        { "<leader>sc",       function() require("fzf-lua").colorschemes() end,                            desc = "[S]earch [C]olorschemes" },
        { "<leader>sr",       function() require("fzf-lua").resume() end,                                  desc = "[S]earch [R]esume" },
        { "<leader>s.",       function() require("fzf-lua").oldfiles() end,                                desc = "[S]earch Recent Files" },
        { "<leader>sn",       function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch [N]eovim config" },

        -- LSP
        { "<leader>sd",       function() require("fzf-lua").diagnostics_document() end,                    desc = "[S]earch [D]iagnostics" },
        { "<leader>sdw",      function() require("fzf-lua").diagnostics_workspace() end,                   desc = "[S]earch [D]iagnostics in [W]orkspace" },
        { "<leader>ss",       function() require("fzf-lua").lsp_document_symbols() end,                    desc = "[S]earch [S]ymbols" },
        { "gd",               function() require("fzf-lua").lsp_definitions() end,                         desc = "[G]oto [D]efinition" },
        { "gr",               function() require("fzf-lua").lsp_references() end,                          desc = "[G]oto [R]eferences" },
        { "gI",               function() require("fzf-lua").lsp_implementations() end,                     desc = "[G]oto [I]mplementation" },
        { "<leader>D",        function() require("fzf-lua").lsp_type_definitions() end,                    desc = "Type [D]efinition" },
        { "<leader>ws",       function() require("fzf-lua").lsp_workspace_symbols() end,                   desc = "[W]orkspace [S]ymbols" },
        { '<leader>ca',       function() require('fzf-lua').lsp_code_actions() end,                        '[C]ode [A]ction' }

    },
    opts = {},
    config = function(_, opts)
        require("fzf-lua").setup(opts)
    end,
}
