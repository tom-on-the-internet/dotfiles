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

local copilot_on = false

local function copilot()
    if copilot_on then
        copilot_on = false
        vim.notify("Copilot disabled", "info", { title = "🤖️" })
    else
        copilot_on = true
        vim.notify("Copilot enabled", "info", { title = "🤖️" })
    end

    require("copilot.suggestion").toggle_auto_trigger()
end

map("n", "<leader>o", "<cmd>silent! only<cr>", { desc = "Close other windows" })
map("n", "<leader>gb", "<cmd>G blame<cr>", { desc = "Git blame" })
map("n", "<leader>gl", "<cmd>0Gclog<cr>", { desc = "Git log current file" })
map("n", "<leader>y", "@q", { desc = "Run q macro" })
map("n", "<leader>cc", copilot, { desc = "toggle copilot" })
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

map("n", "<leader>gy", function()
    require("gitlinker").get_buf_range_url("n")
end, { desc = "Copy link to Github to clipboard" })
map("v", "<leader>gy", function()
    require("gitlinker").get_buf_range_url("v")
end, { desc = "Copy link to Github to clipboard" })
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

map("n", "<leader>xxx", function()
    local bufnr = vim.api.nvim_get_current_buf()
    print(vim.bo[bufnr].filetype)
    -- vim.bo[bufnr].buflisted = true -- same as vim.bo.buflisted = true
    -- print(vim.bo.comments)
    -- print(vim.bo.baz) -- error: invalid key
end, { desc = "Add word to spell cspell dictionary" })
