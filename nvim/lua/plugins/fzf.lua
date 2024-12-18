return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      grep = {
        rg_glob = true, -- enable glob parsing by default to all
        glob_flag = "--iglob", -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
      },
      oldfiles = {
        include_current_session = true, -- include bufs from current session
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
    },
  },
}
