return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        -- Order of formatters matters. They are used in order of appearance.
        -- nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2", "-sr", "-s", "-ci" },
        }),
      })
    end,
  },
}
