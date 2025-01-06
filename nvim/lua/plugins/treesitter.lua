return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "blade", "php", "html" })
    end

    -- Configure blade filetype detection
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    -- Enable highlighting for blade files automatically
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "blade" },
      callback = function()
        vim.cmd("TSEnable highlight")
      end,
    })
    return opts
  end,

  config = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
