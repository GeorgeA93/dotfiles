return {
  -- colorscheme
  {
    "chriskempson/base16-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd "colorscheme base16-eighties"
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {}
      -- install parsers (no-ops if already installed)
      vim.schedule(function()
        require("nvim-treesitter").install {
          "lua", "vim", "vimdoc",
          "html", "css", "javascript", "typescript", "json",
          "ruby", "python",
          "c_sharp",
        }
      end)
    end,
  },

  -- mason (auto-install LSP servers & tools)
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "typescript-language-server",
        "csharpier",
        "roslyn",
        "netcoredbg",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      -- auto-install listed tools
      local mr = require "mason-registry"
      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },

  -- LSP config (nvim 0.11 native API)
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- roslyn (C# LSP)
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      }
    end,
  },

  -- fzf (same plugin as Vim)
  { "junegunn/fzf", build = "./install --bin" },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_layout = { down = "~20%" }
      vim.g.fzf_preview_window = {}
    end,
  },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
      {
        "<leader>f",
        function()
          local ok, view = pcall(require, "nvim-tree.view")
          if ok and view.is_visible() then
            vim.cmd "NvimTreeClose"
          else
            vim.cmd "NvimTreeOpen"
          end
        end,
        desc = "Toggle file tree",
      },
      { "<leader>v", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in tree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        -- load default mappings first
        api.config.mappings.default_on_attach(bufnr)
        -- disable f (filter) so <leader>f works to close the tree
        vim.keymap.del("n", "f", { buffer = bufnr })
      end,
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "base16",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- buffer tabline (matches airline tabline)
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
      },
    },
  },

  -- close buffers without closing windows
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },

  -- auto-pairs
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- git
  { "tpope/vim-fugitive", cmd = { "Git", "G", "Gblame", "Gdiff", "Glog" } },

  -- tmux navigation
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- surround
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },

  -- formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cs = { "csharpier" },
        css = { "prettier" },
        html = { "prettier" },
      },
    },
  },

  -- debug adapter
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    config = function()
      require "configs.nvim-dap"
      require "configs.nvim-dap-ui"
    end,
  },

  -- debug UI
  { "rcarriga/nvim-dap-ui" },

  { "nvim-neotest/nvim-nio" },

  -- test runner
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    config = function()
      require("neotest").setup {
        adapters = { require "neotest-dotnet" },
      }
    end,
    event = "VeryLazy",
  },

  { "Issafalcon/neotest-dotnet" },
}
