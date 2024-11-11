-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

autocmd = vim.api.nvim_create_autocmd
opt = vim.opt

-- Set syntax highlighting for wgsl files
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    opt.filetype = "wgsl"
  end,
})

-- Set syntax highlighting for cup and flex files
autocmd("BufRead", {
  pattern = { "*.cup", "*.flex" },
  callback = function()
    opt.filetype = "cup"
  end,
})

-- Initialize LSP servers

local lspconfig = require "lspconfig"
local servers = {
  "rust_analyzer",
  "lua_ls",
  "html",
  "cssls",
  "clangd",
  "jdtls",
  "ts_ls",
  "tailwindcss",
  "rust_analyzer",
  "marksman",
  "ltex",
  "pylsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- swift sourcekit-lsp
lspconfig.sourcekit.setup {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.wgsl_analyzer.setup {}
