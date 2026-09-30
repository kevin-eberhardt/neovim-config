-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_augroup("AutoDeleteNoName", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = "AutoDeleteNoName",
  pattern = "*",
  callback = function()
    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
      if buf.name == "" and buf.bufnr ~= vim.fn.bufnr("%") then
        vim.api.nvim_buf_delete(buf.bufnr, { force = true })
      end
    end
  end,
})
