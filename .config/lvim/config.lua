-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Options
vim.opt.relativenumber = true
vim.opt.timeoutlen = 250
vim.opt.smartindent = true

lvim.builtin.nvimtree.active = false
lvim.builtin.treesitter.autotag.enable = true
lvim.format_on_save = true

lvim.colorscheme = "github_dark_dimmed"

-- Plugins
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "windwp/nvim-ts-autotag",
  "projekt0n/github-nvim-theme",
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "theHamsta/nvim-dap-virtual-text",
  "prabirshrestha/vim-lsp",
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "olexsmir/gopher.nvim" },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "projekt0n/github-nvim-theme",
  "folke/trouble.nvim",
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
          },
        },
      })
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "buschco/nvim-cmp-ts-tag-close",
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  "lervag/vimtex",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },

    config = function()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 40,
        },
        buffers = {
          follow_current_file = false,
        },
        filesystem = {
          follow_current_file = false,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
            },
            always_show = { -- remains visible even if other settings would normally hide it
              ".gitignore",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
        },
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted = "✖", -- this can only be used in the git_status source
              renamed = "󰁕", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },
      })
    end,
  },
}
-- Synthax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
  "markdown_inline",
  "regex",
  "bash",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "yaml",
  "gomod",
  "go",
  "hcl",
  "markdown",
}

-- Language Server: install with mason
vim.filetype.add({ extension = { templ = "templ" } })
local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

lspconfig.tailwindcss.setup({
  filetypes = { "templ", "astro", "javascript", "typescript", "react" },
  init_options = { userLanguages = { templ = "html" } },
})

lspconfig.html.setup({
  filetypes = { "html", "templ" },
})

lspconfig.htmx.setup({
  filetypes = { "html", "templ" },
})

-- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "black" },
  { name = "stylua" },
  { name = "prettier" },
  { name = "gofumpt" },
  { name = "golines" },
})

-- Linting
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { name = "mypy" } })

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

lvim.lsp.installer.setup.ensure_installed = {
  "lua_ls",
  "rust_analyzer",
  "texlab",
  "templ",
  "pyright",
  "html",
  "htmx",
  "awk_ls",
  "bashls",
  "cssls",
  "dockerls",
  "graphql",
  "html",
  "jsonls",
  "tsserver",
  "marksman",
  "pyright",
  "sqlls",
  "tailwindcss",
  "terraformls",
  "yamlls",
}

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    }),
  },
})

-- Key mappings
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dM"] =
  { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
  "Test Class",
}
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  "Test Class DAP",
}
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

lvim.builtin.which_key.mappings["bx"] = { "<cmd>BufferKill<cr>", "Close buffer" }
lvim.builtin.which_key.mappings["<Tab>"] = {
  "<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true })<cr>",
  "Switch buffers",
}

lvim.builtin.which_key.mappings["P"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
  r = { "<cmd>!python3 %<cr>", "Run current file" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}

lvim.builtin.which_key.mappings["e"] = {
  "<cmd>NeoTreeRevealToggle<cr>",
  "Explorer",
}

lvim.builtin.which_key.mappings["G"] = {
  name = "+Go",
  j = { "<cmd>GoTagAdd json<cr>", "Add json struct tags" },
  e = { "<cmd>GoIfErr<cr>", "If/err snippet" },
  y = { "<cmd>GoTagAdd yaml<cr>", "Add yaml struct tags" },
  t = { "<cmd>GoTestsAll<cr>", "Generate unit tests" },
}

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>k", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end)
vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end)
vim.keymap.set("n", "<leader>6", function()
  harpoon:list():select(6)
end)
vim.keymap.set("n", "<leader>7", function()
  harpoon:list():select(7)
end)
vim.keymap.set("n", "<leader>8", function()
  harpoon:list():select(8)
end)
vim.keymap.set("n", "<leader>9", function()
  harpoon:list():select(9)
end)