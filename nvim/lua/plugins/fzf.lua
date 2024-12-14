return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      grep = {
        rg_glob = true, -- enable glob parsing by default to all
        glob_flag = "--iglob", -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
      },
    },
  },
}
