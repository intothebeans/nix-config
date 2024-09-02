return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!

  { "wakatime/vim-wakatime", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },
  --{ "github/copilot.vim", lazy = false },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "bash-language-server",
        "emmet-language-server",
        "json-lsp",
        "markdown-oxide",
        "markdownlint",
      },
    },
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  { "lewis6991/gitsigns.nvim", lazy = false },
  {
    "b0o/schemastore.nvim",
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaultq
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "scss",
        "tsx",
        -- scripting
        "bash",
        "python",
        -- data
        "yaml",
        "json",
        "markdown_inline",
      },
    },
  },
}
