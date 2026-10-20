-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "rust-analyzer",
        "gopls",
        "typescript-language-server",
        "json-lsp",
        "yaml-language-server",
        "ruff",

        -- install formatters
        "stylua",

        -- install debuggers
        "codelldb",
        "delve",
        "js-debug-adapter",
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
