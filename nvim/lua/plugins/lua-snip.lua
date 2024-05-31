local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

vim.snippet.expand = ls.lsp_expand

ls.add_snippets("lua", {
    s("tomtom", fmt("<%= {} %>{}", { i(1), i(0) })),
    s("ei", fmt("<%= if {} do %>{}<% end %>{}", { i(1), i(2), i(0) })),
})

ls.add_snippets("go", {
    s("party", fmt("Party dude!", {})),
})

vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true, desc = "Jump forward in snippet" })

vim.keymap.set({ "i", "s" }, "<c-h>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true, desc = "Jump backward in snippet" })

return {}
