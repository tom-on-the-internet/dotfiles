return {
  "tamton-aquib/duck.nvim",
  config = function()
    vim.keymap.set("n", "<leader>dd", function()
      require("duck").hatch("텀")
    end, { desc = "Make a 텀" })
    vim.keymap.set("n", "<leader>dm", function()
      for _ = 1, 5 do
        require("duck").hatch("텀")
      end
    end, { desc = "Make 5  텀" })
    vim.keymap.set("n", "<leader>da", function()
      require("duck").cook_all()
    end, { desc = "Remove the 텀" })
  end,
}
