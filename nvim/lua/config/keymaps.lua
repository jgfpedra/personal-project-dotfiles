local K = {}

local function set_root(dir)
  local current = vim.fn.getcwd()
  if current ~= dir then
    vim.g.neotree_prev_dir = current
    vim.cmd("cd " .. vim.fn.fnameescape(dir))
  end
  vim.cmd("Neotree filesystem reveal dir=" .. vim.fn.fnameescape(dir))
end

function K.setup()
  local km = vim.keymap
  km.set("v", "y", '"+y')
  km.set("v", "p", '"+p')
  km.set("n", "p", '"+p')
  km.set("v", "d", '"+d')
  km.set("v", "c", '"+c')
  km.set("v", ">", ">gv")
  km.set("v", "<", "<gv")
  km.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

  -- Neo-tree
  --
  km.set("v", "?", "y?\\V<C-r>\"<CR>", { noremap = true, silent = true })

  km.set("n", "<C-e>", ":Neotree show<CR>")

  km.set("n", "<C-A-e>", function()
    local last = vim.g.neotree_last_dir or vim.fn.getcwd()

    -- aqui você DECIDE trocar o root
    set_root(last)
  end, { desc = "Neo-tree at last dir (explicit root change)" })


  vim.keymap.set("n", "<C-A-eb>", function()
    local prev = vim.g.neotree_prev_dir
    if not prev then
      vim.notify("Nenhum diretório anterior salvo", vim.log.levels.INFO)
      return
    end
    set_root(prev)
  end, { desc = "Neo-tree back to previous root" })

  km.set("n", "<C-b>", ":Neotree buffers<CR>")
  km.set("n", "<C-q>", "<C-w>p")

  -- Buffers
  km.set("n", "<C-n>", ":Telescope find_files<CR>")
  km.set("n", "<C-l>", ":bnext<CR>")
  km.set("n", "<C-h>", ":bprevious<CR>")
  km.set("n", "<C-w>", ":bdelete<CR>")

  -- Tabs
  km.set("n", "<A-n>", ":tabnew<CR>")
  km.set("n", "<A-o>", ":tabnew %<CR>")
  km.set("n", "<A-l>", ":tabnext<CR>")
  km.set("n", "<A-h>", ":tabprevious<CR>")
  km.set("n", "<A-w>", ":tabclose<CR>")

  -- Terminal
  km.set("n", "<C-t>", ":terminal<CR>")

  -- Funções / símbolos
  km.set("n", "<C-s>", ":Telescope lsp_document_symbols<CR>")

  km.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format file" })
  -- %s/[^/]$/... --> substituir ultimo char
end

return K
