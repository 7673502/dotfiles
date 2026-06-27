return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load only when you start typing
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Connects to the Language Server
      "L3MON4D3/LuaSnip",     -- Snippet engine (Required for cmp to work!)
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        -- 1. This snippet section is required for nvim-cmp to function
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        
        -- 2. The "Tooltip" configuration (VS Code style)
        window = {
          -- Make the completion list have borders
          completion = cmp.config.window.bordered(),
          -- Make the documentation tooltip have borders
          documentation = cmp.config.window.bordered(),
        },

        -- 3. Key Mappings
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space to force trigger
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to pick
          ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab to go down
          ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab to go up
        }),

        -- 4. Where to get the suggestions from
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Suggestions from Rust Analyzer
        }),
      })
    end,
  },
}
