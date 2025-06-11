-- vim.g.mkdp_filetypes = { "markdown" }

vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", {
  desc = "Markdown Preview Toggle",
})

-- # change buffers key bind
vim.keymap.set("n", "<C-j>", ":bn<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-k>", ":bp<CR>", { silent = true, noremap = true })
--  バッファをCtrl+j,kで移動する。

-- # jkEsc
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "ｊｋ", "<ESC>", { noremap = true })

-- # normalModeEnter-Carrigeline
vim.keymap.set("n", "<CR>", "A<Return><Esc>^k", { noremap = true })
-- ノーマルモードのままEnterを押して改行を挿入する。

-- # Emacsキーバインド

-- ## insert mode key map
vim.keymap.set("i", "<C-p>", "<Up>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-n>", "<Down>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-f>", "<Right>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-b>", "<Left>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-a>", "<Home>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-e>", "<End>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-h>", "<BS>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-k>", "<ESC>:EmacsKill<CR>a", { silent = true, noremap = true })

-- ## command line key map
vim.keymap.set("c", "<C-p>", "<Up>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-n>", "<Down>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-f>", "<Right>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-b>", "<Left>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-a>", "<Home>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-e>", "<End>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-h>", "<BS>", { silent = true, noremap = true })
vim.keymap.set("c", "<C-d>", "<Del>", { silent = true, noremap = true })

-- ## functions
vim.api.nvim_create_user_command("EmacsKill", function()
  local line_text = vim.fn.getline(".")
  local col_pos = vim.fn.col(".")
  local line_end = vim.fn.col("$")
  if col_pos >= line_end then
    -- カーソルが行末にいるなら、次の行と結合（ただし最終行でなければ）
    if vim.fn.line(".") < vim.fn.line("$") then
      vim.cmd("normal! J")
    end
  else
    if line_text == "" then
      -- 空行ならそのまま削除
      vim.cmd("normal! dd")
    else
      -- カーソル位置から行末まで削除（削除内容はレジスタに入る）
      local register = vim.v.register
      vim.cmd('normal! "' .. register .. "D")
    end
  end
end, { nargs = 0 })
