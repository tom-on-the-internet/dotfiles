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
      colorscheme = "opencode",
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
    "al3rez/opencode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark", -- "dark" or "light"
      transparent = false, -- enable transparent background
      italic_comments = true,
    },
    config = function(_, opts)
      require("opencode").setup(opts)
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
