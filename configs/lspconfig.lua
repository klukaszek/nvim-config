local configs = require('plugins.configs.lspconfig')
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require('lspconfig')
local servers = { "rust_analyzer", "lua_ls", "html", "cssls", "clangd", "jdtls", "tsserver", "wgsl_analyzer",
    "tailwindcss", "rust_analyzer", "glsl_analyzer", "ocamllsp", "marksman", "ltex" }

local cmp_nvim_lsp = require "cmp_nvim_lsp"

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
    elseif lsp == "clangd" then
        if vim.fn.executable("clangd") == 1 then
            lspconfig.clangd.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
            }
        else
            lspconfig[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end
    end
end
