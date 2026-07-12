return {
  { 'mfussenegger/nvim-jdtls' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = true,
  },
  {
  	"L3MON4D3/LuaSnip",
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets' },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        formatting = lsp_zero.cmp_format({details = true}),
        sources = {
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },

  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {'ts_ls'},  -- Ensure tsserver is installed 
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
          tsserver = function()
            require('lspconfig').tsserver.setup({
              on_attach = function(client, bufnr)
                -- Add any specific settings for tsserver here
                lsp_zero.default_keymaps({buffer = bufnr})
              end,
            })
          end,
        }
      })
      vim.lsp.config("csharp_ls", {
        capabilities = capabilities,
        settings = {
          csharp = {
            solution = (function()
              -- Получаем корень от текущего файла
              local root = vim.fs.root(vim.api.nvim_buf_get_name(0), {
                "*.slnx",
                "*.sln",
                "*.csproj",
                "*.fsproj",
                ".git",
              })

              if root then
                local files = vim.fn.glob(root .. "/*.sln*", false, true)
                return files[1] or nil
              end
              return nil
            end)(),
            applyFormattingOptions = true,
          },
        },
      })

    end
  }
}


-- vim.lsp.config('jdtls', {
--   cmd = {
--     'jdtls'
--   }
-- })
-- vim.lsp.enable('jdtls')
-- vim.lsp.config('cmake', {})
-- vim.lsp.config('csharp_ls',{
--   cmd = {"/home/A1/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls"},
-- })
-- vim.lsp.config('pylsp', {
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {
--             'E2',
--             'E3',
--             'E5',
--             'W2',
--             'W3',
--           },
--           maxLineLength = 500
--         },
--       },
--     },
--   },
-- })
-- 
-- vim.lsp.config('clangd', {
--   cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbous'},
--   init_options = {
--     fallbackFlags = { 'std=c++17' },
--   },
-- })
-- 
-- vim.lsp.config('lua_ls', {
--   settings = {
--     Lua = {
--       diagnostics = {global = {'vim'}}
--     },
--   },
-- })

-- OLD CONFIG

--local lspconfig = require('lspconfig')
--
----vim.lsp.enable('csharp_ls')
----vim.lsp.enable('cmake')
--
--require("lspconfig").csharp_ls.setup({
--  --cmd = {"~/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls"},
--  cmd = {"/home/A1/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls"},
--})
--
----lspconfig.omnisharp.setup({
----  cmd = { "omnisharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" }
----})
--
--lspconfig.cmake.setup{}
--lspconfig.pylsp.setup{
--  settings = {
--    pylsp = {
--      plugins = {
--        pycodestyle = {
--          ignore = {
--            'E2',
--            'E3',
--            'E5',
--            'W2',
--            'W3',
--          },
--          maxLineLength = 500
--        }
--      }
--    }
--  }
--}
--lspconfig.clangd.setup({
--  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbous'},
--  init_options = {
--    fallbackFlags = { 'std=c++17' },
--  }
--})
--lspconfig.lua_ls.setup{
--  settings = {
--    Lua = {
--      diagnostics = {global = {'vim'}}
--    }
--  }
--}
