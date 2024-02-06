return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      grammarly = {
        filetypes = { "markdown", "tex", "latex" },
        init_options = {
          clientId = "client_BaDkMgx4X19X9UxxYRCXZo",
        },
      },
    },
  },
}
