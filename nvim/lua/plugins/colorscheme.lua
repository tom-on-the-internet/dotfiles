local function is_macos_light()
  vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  return vim.v.shell_error ~= 0
end

local light = is_macos_light()

return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = light and "catppuccin-latte" or "catppuccin-mocha",
      colorscheme = "nord",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({})
      -- vim.cmd.colorscheme("nord")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
    },
  },
}
