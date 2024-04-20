local configs = require('plugins.configs.lspconfig')
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require('lspconfig')
local servers = { "rust_analyzer", "lua_ls", "html", "cssls", "clangd", "jdtls", "tsserver", "wgsl_analyzer",
  "tailwindcss", "rust_analyzer", "glsl_analyzer", "ocamllsp", "marksman", "ltex" }

for _, lsp in ipairs(servers) do
  if lsp == "ocamllsp" then
    lspconfig.ocamllsp.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "ocamllsp",
      },
      filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
      root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
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
