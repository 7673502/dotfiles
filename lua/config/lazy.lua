-- 1. Bootstrap lazy.nvim (This downloads the package manager if it's missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2. Setup lazy.nvim with LSP and Autocompletion
require("lazy").setup({
  spec = {
    -- Mason manages external binaries
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },

    -- >>> NEW: The Autocompletion Engine <<<
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Connects LSP data to the completion menu
        "L3MON4D3/LuaSnip",     -- Snippet engine (required by LSPs to expand functions)
      },
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Press Enter to accept
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then cmp.select_next_item() else fallback() end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then cmp.select_prev_item() else fallback() end
            end, { 'i', 's' }),
          }),
          sources = {
            { name = 'nvim_lsp' }, -- Tells the menu to grab data from pyright/ruff
          }
        })
      end,
    },

    -- The core Neovim LSP configuration plugin
    {
      "neovim/nvim-lspconfig",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "pyright", "ruff" },
        })

        -- Let the LSPs know that we now have an autocompletion engine installed
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Pass the capabilities to the servers
        vim.lsp.config("pyright", { capabilities = capabilities })
        vim.lsp.config("ruff", { capabilities = capabilities })

        vim.lsp.enable("pyright")
        vim.lsp.enable("ruff")

        -- Global keymaps for LSP actions when a file opens
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(args)
            local bufopts = { silent = true, buffer = args.buf }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
          end,
        })
      end,
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

