-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tom note: This should be tidied up

local map = vim.keymap.set

map("n", "<leader>y", "@q", { desc = "Run q macro" })
map(
  "n",
  "<leader>fl",
  ":let @+=expand('%') .. ':' .. line('.')<cr>",
  { desc = "Copy current file name and line number to clipboard" }
)

map("n", "<leader>Y", function()
  vim.cmd("let @+ = expand('%')")
end, { desc = "Copy relative file path to clipboard" })

local function get_visual_selection()
  vim.cmd('noau normal! "vy"')
  return vim.fn.getreg("v")
end

local function dedupe(arr)
  local hash = {}
  local res = {}

  for _, v in ipairs(arr) do
    if not hash[v] then
      res[#res + 1] = v
      hash[v] = true
    end
  end

  return res
end

local function add_unknown_word(unknown_word)
  local cspell_json_file = vim.fn.expand("$HOME/.config/nvim/cspell.json")
  -- Open and read the JSON file
  local json_file = io.open(cspell_json_file, "r")

  if json_file == nil then
    vim.notify(cspell_json_file .. " is missing.", "warn")
    return
  end

  local json_content = json_file:read("*a")
  json_file:close()

  local lua_table = vim.fn.json_decode(json_content)

  if lua_table == nil then
    vim.notify(cspell_json_file .. " is empty.", "warn")
    return
  end

  local words = lua_table.words

  if words == nil then
    vim.notify(cspell_json_file .. " is invalid.", "warn")
    return
  end

  vim.list_extend(words, { unknown_word })
  words = dedupe(lua_table.words)
  table.sort(words)
  lua_table.words = words
  local json_string = vim.fn.json_encode(lua_table)

  -- Open the JSON file for writing (this will overwrite the existing data)
  local json_file_write = io.open(cspell_json_file, "w")
  if json_file_write == nil then
    vim.notify(cspell_json_file .. " is missing.", "warn")
    return
  end

  -- Write the JSON data to the file
  json_file_write:write(json_string)
  json_file_write:close()
end

local function add_selected_word()
  local unknown_word = get_visual_selection()
  if unknown_word:gsub("%s+", "") == "" then
    vim.notify("No word selected. Nothing added to dictionary.", "warn")
    return
  end
  if unknown_word:gsub("%s+", "") ~= unknown_word then
    vim.notify("Can't add a word to dictionary that has spaces.", "warn")
    return
  end

  add_unknown_word(unknown_word)

  vim.notify(unknown_word .. " added to cspell.json")
end

local function add_all_unknown_words_to_dictionary()
  local diagnostics = vim.diagnostic.get(0)
  local uniqueMessages = {}
  local uniqueCount = 0
  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.source == "cspell" then
      local message = diagnostic.message
      local unknown_word = message:match("%((.-)%)")
      if unknown_word then
        if not uniqueMessages[unknown_word] then
          add_unknown_word(unknown_word)
          uniqueMessages[unknown_word] = true
          uniqueCount = uniqueCount + 1
        end
      end
    end
  end
  print("Added " .. uniqueCount .. " words to the dictionary.")
end

map("n", "<leader>cW", add_all_unknown_words_to_dictionary, { desc = "Add all unknown words to cspell dictionary." })

map("v", "<leader>cx", add_selected_word, { desc = "Add word to cspell dictionary" })

vim.g.cmp_toggle = true
map("n", "<leader>ua", function()
  vim.g.cmp_toggle = not vim.g.cmp_toggle
  require("cmp").setup({ enabled = vim.g.cmp_toggle })
  if vim.g.cmp_toggle then
    vim.notify("completions are ON")
  else
    vim.notify("completions are OFF")
  end
end, { desc = "Toggle Completion" })

-- Window resize (respecting `v:count`)
-- for my mac
map(
  "n",
  "<M-Left>",
  '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Decrease window width" }
)
map(
  "n",
  "<M-Down>",
  '"<Cmd>resize -"          . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Decrease window height" }
)
map(
  "n",
  "<M-Up>",
  '"<Cmd>resize +"          . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Increase window height" }
)
map(
  "n",
  "<M-Right>",
  '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
  { expr = true, replace_keycodes = false, desc = "Increase window width" }
)
