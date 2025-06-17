return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      { 'fredrikaverpil/neotest-golang', version = '*' }, -- Go adapter
    },
    config = function()
      local neotest_golang_opts = { -- Specify configuration
        runner = 'go',
        go_test_args = {
          '-v',
          '-race',
          '-count=1',
          '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
        },
      }
      ---@diagnostic disable-next-line: missing-fields
      require('neotest').setup {
        adapters = {
          require 'neotest-golang'(neotest_golang_opts), -- Registration
        },
      }
    end,
    keys = {
      {
        '<leader>ta',
        function()
          require('neotest').run.attach()
        end,
        desc = '[T]est [a]ttach',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[T]est run [f]ile',
      },
      {
        '<leader>tA',
        function()
          require('neotest').run.run(vim.uv.cwd())
        end,
        desc = '[T]est [A]ll files',
      },
      {
        '<leader>tS',
        function()
          require('neotest').run.run { suite = true }
        end,
        desc = '[T]est [S]uite',
      },
      {
        '<leader>tn',
        function()
          require('neotest').run.run()
        end,
        desc = '[T]est [N]earest',
      },
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = '[T]est [L]ast',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[T]est [S]ummary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = '[T]est [O]utput',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = '[T]est [O]utput panel',
      },
      {
        '<leader>tt',
        function()
          require('neotest').run.stop()
        end,
        desc = '[T]est [T]erminate',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { suite = false, strategy = 'dap' }
        end,
        desc = 'Debug nearest test',
      },
      {
        '<leader>tD',
        function()
          require('neotest').run.run { vim.fn.expand '%', strategy = 'dap' }
        end,
        desc = 'Debug current file',
      },
    },
  },
  -- DAP setup
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'toggle [d]ebug [b]reakpoint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = '[d]ebug [B]reakpoint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = '[d]ebug [c]ontinue (start here)',
      },
      {
        '<leader>dC',
        function()
          require('dap').run_to_cursor()
        end,
        desc = '[d]ebug [C]ursor',
      },
      {
        '<leader>dg',
        function()
          require('dap').goto_()
        end,
        desc = '[d]ebug [g]o to line',
      },
      {
        '<leader>do',
        function()
          require('dap').step_over()
        end,
        desc = '[d]ebug step [o]ver',
      },
      {
        '<leader>dO',
        function()
          require('dap').step_out()
        end,
        desc = '[d]ebug step [O]ut',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = '[d]ebug [i]nto',
      },
      {
        '<leader>dj',
        function()
          require('dap').down()
        end,
        desc = '[d]ebug [j]ump down',
      },
      {
        '<leader>dk',
        function()
          require('dap').up()
        end,
        desc = '[d]ebug [k]ump up',
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = '[d]ebug [l]ast',
      },
      {
        '<leader>dp',
        function()
          require('dap').pause()
        end,
        desc = '[d]ebug [p]ause',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.toggle()
        end,
        desc = '[d]ebug [r]epl',
      },
      {
        '<leader>dR',
        function()
          require('dap').clear_breakpoints()
        end,
        desc = '[d]ebug [R]emove breakpoints',
      },
      {
        '<leader>ds',
        function()
          require('dap').session()
        end,
        desc = '[d]ebug [s]ession',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = '[d]ebug [t]erminate',
      },
      {
        '<leader>dw',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = '[d]ebug [w]idgets',
      },
    },
  },

  -- DAP UI setup
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'mfussenegger/nvim-dap',
    },
    opts = {},
    config = function(_, opts)
      -- setup dap config by VsCode launch.json file
      -- require("dap.ext.vscode").load_launchjs()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end
    end,
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle {}
        end,
        desc = '[d]ap [u]i',
      },
      {
        '<leader>de',
        function()
          require('dapui').eval()
        end,
        desc = '[d]ap [e]val',
      },
    },
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {},
  },

  -- Nvim dap Go setup
  {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup {
        dap_configurations = {
          {
            type = 'go',
            name = 'Attach remote',
            mode = 'remote',
            request = 'attach',
          },
        },
        delve = {
          path = 'dlv',
          initialize_timeout_sec = 20,
          port = '${port}',
          args = {},
          build_flags = {},
          detached = vim.fn.has 'win32' == 0,
          cwd = nil,
        },
        tests = {
          verbose = false,
        },
      }
    end,
  },
  {
    'sebdah/vim-delve',
    config = function() end,
  },
}
