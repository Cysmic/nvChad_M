require "nvchad.options"

-- add yours here!

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.glsl", "*.vert", "*.frag", "*.comp"},
    command = "set filetype=glsl",
})

if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    vim.o.fileformat = 'dos'
else
    vim.o.fileformat = 'unix'
end
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
