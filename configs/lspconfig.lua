local configs = require('plugins.configs.lspconfig')
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require('lspconfig')
local servers = {"rust_analyzer", "lua_ls", "html", "cssls", "clangd", "jdtls", "tsserver", "wgsl_analyzer", "tailwindcss", "ocamllsp", "rust_analyzer", "glsl_analyzer"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local cmp_nvim_lsp = require "cmp_nvim_lsp"
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  }

