require "nvchad.options"

-- add yours here!

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.glsl", "*.vert", "*.frag", "*.comp"},
    command = "set filetype=glsl",
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
