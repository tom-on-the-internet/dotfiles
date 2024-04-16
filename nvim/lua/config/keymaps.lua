-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<leader>o", "<cmd>silent! only<cr>", { desc = "Close other windows" })
map("n", "<leader>gb", "<cmd>G blame<cr>", { desc = "Git blame" })
map("n", "<leader>gh", function()
    require("telescope").extensions.git_file_history.git_file_history()
end, { desc = "Git log current file" })
map("n", "<leader>y", "@q", { desc = "Run q macro" })
map("n", "<leader>s?", function()
    require("telescope.builtin").live_grep({
        search = "",
        additional_args = { "--hidden", "--no-ignore" },
        prompt_title = "Search (hidden and ignored)",
    })
end, { desc = "Grep including hidden and ignored" })
map("n", "<leader>fa", function()
    require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "Find files including hidden and ignored" })
map(
    "n",
    "<leader>fc",
    ":let @+=@%<cr>",
    { desc = "Copy current file name to clipboard" }
)
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

local function add_unknown_word()
    local unknown_word = get_visual_selection()
    if unknown_word:gsub("%s+", "") == "" then
        vim.notify("No word selected. Nothing added to dictionary.", "warn")
        return
    end
    if unknown_word:gsub("%s+", "") ~= unknown_word then
        vim.notify("Can't add a word to dictionary that has spaces.", "warn")
        return
    end

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

    vim.notify(unknown_word .. " added to cspell.json")
end

map(
    "v",
    "<leader>cs",
    add_unknown_word,
    { desc = "Add word to spell cspell dictionary" }
)

map("n", "<leader>cw", function()
    vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Adjust line wrapping" })

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
