-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

    -- == Examples of Adding Plugins ==
    --
    { "Mofiqul/dracula.nvim" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┆" },
                },
                signs_staged_enable = true,
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    follow_files = true,
                },
                auto_attach = true,
                attach_to_untracked = false,
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
                current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
            }
        end,
    },
    "nvim-lua/plenary.nvim",
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    "sindrets/diffview.nvim",
    "HiPhish/nvim-ts-rainbow2",
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but recommended
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup").setup {
                strategy = {
                    enabled = true,
                },
                query = {
                    enabled = true,
                },
                highlight = {
                    enabled = true,
                },
            }
        end,
    },
    {
        "Mathijs-Bakker/godotdev.nvim",
        dependencies = { "nvim-lspconfig", "nvim-dap", "nvim-dap-ui", "nvim-treesitter" },
    },

    "andweeb/presence.nvim",
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require("lsp_signature").setup {
                handler_opts = {
                    border = "rounded",
                },
                hint_enable = false, -- Disable virtual text hint
            }
        end,
    },

    -- == Examples of Overriding Plugins ==

    -- customize dashboard options
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    header = [[

   ▄████████    ▄████████     ███        ▄████████  ▄██████▄       ███▄▄▄▄    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
  ███    ███   ███    ███ ▀█████████▄   ███    ███ ███    ███      ███▀▀▀██▄ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
  ███    ███   ███    █▀     ▀███▀▀██   ███    ███ ███    ███      ███   ███ ███    ███ ███▌ ███   ███   ███
  ███    ███   ███            ███   ▀  ▄███▄▄▄▄██▀ ███    ███      ███   ███ ███    ███ ███▌ ███   ███   ███
▀███████████ ▀███████████     ███     ▀▀███▀▀▀▀▀   ███    ███      ███   ███ ███    ███ ███▌ ███   ███   ███
  ███    ███          ███     ███     ▀███████████ ███    ███      ███   ███ ███    ███ ███  ███   ███   ███
  ███    ███    ▄█    ███     ███       ███    ███ ███    ███      ███   ███ ███    ███ ███  ███   ███   ███
  ███    █▀   ▄████████▀     ▄████▀     ███    ███  ▀██████▀        ▀█   █▀   ▀██████▀  █▀    ▀█   ███   █▀
                                        ███    ███
                    ]],
                },
            },
        },
    },

    -- You can disable default plugins as follows:
    { "max397574/better-escape.nvim", enabled = true },

    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                        -- don't add a pair if the next character is %
                        :with_pair(
                            cond.not_after_regex "%%"
                        )
                        -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                        -- don't move right when repeat character
                        :with_move(cond.none())
                        -- don't delete if the next character is xx
                        :with_del(
                            cond.not_after_regex "xx"
                        )
                        -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },
}
