local M = {}
function M.setup()
  local opt = vim.opt
  local optg = vim.g
  local api = vim.api
  local func = vim.fn
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true
  opt.softtabstop = 2
  opt.number = true
  opt.hlsearch = true
  opt.incsearch = true

  opt.foldmethod = "indent"
  opt.foldenable = true
  opt.foldlevel = 99

  optg.neotree_last_dir = nil
  optg.neotree_prev_dir = nil

  opt.termguicolors = false

  optg.loaded_node_provider = 0
  optg.loaded_perl_provider = 0
  optg.loaded_ruby_provider = 0

  api.nvim_create_autocmd("BufEnter", {
    callback = function()
      local dir = func.expand("%:p:h")
      if dir ~= "" then
        optg.neotree_last_dir = dir
      end
    end,
  })
end

return M
