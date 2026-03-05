local M = {}

local cspell_json_file = vim.fn.expand("$HOME/.config/nvim/cspell.json")

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
  local json_file = io.open(cspell_json_file, "r")

  if json_file == nil then
    vim.notify(cspell_json_file .. " is missing.", vim.log.levels.WARN)
    return
  end

  local json_content = json_file:read("*a")
  json_file:close()

  local lua_table = vim.fn.json_decode(json_content)

  if lua_table == nil then
    vim.notify(cspell_json_file .. " is empty.", vim.log.levels.WARN)
    return
  end

  local words = lua_table.words

  if words == nil then
    vim.notify(cspell_json_file .. " is invalid.", vim.log.levels.WARN)
    return
  end

  vim.list_extend(words, { unknown_word })
  words = dedupe(lua_table.words)
  table.sort(words)
  lua_table.words = words
  local json_string = vim.fn.json_encode(lua_table)

  local json_file_write = io.open(cspell_json_file, "w")
  if json_file_write == nil then
    vim.notify(cspell_json_file .. " is missing.", vim.log.levels.WARN)
    return
  end

  json_file_write:write(json_string)
  json_file_write:close()
end

function M.add_selected()
  local unknown_word = get_visual_selection()
  if unknown_word:gsub("%s+", "") == "" then
    vim.notify("No word selected. Nothing added to dictionary.", vim.log.levels.WARN)
    return
  end
  if unknown_word:gsub("%s+", "") ~= unknown_word then
    vim.notify("Can't add a word to dictionary that has spaces.", vim.log.levels.WARN)
    return
  end

  add_unknown_word(unknown_word)

  vim.notify(unknown_word .. " added to cspell.json")
end

function M.add_all_unknown()
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
  vim.notify("Added " .. uniqueCount .. " words to the dictionary.")
end

return M
