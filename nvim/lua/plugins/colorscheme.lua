local function is_macos_light()
  vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  return vim.v.shell_error ~= 0
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      local light = is_macos_light()
      return {
        no_italic = true,
        color_overrides = {
          frappe = light and { base = "#40465e" } or {},
        },
        custom_highlights = function(colors)
          if light then
            return {
              GitSignsCurrentLineBlame = { fg = colors.subtext0 },
            }
          end
          return {}
        end,
      }
    end,
  },
}
