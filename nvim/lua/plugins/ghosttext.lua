return {
  "subnut/nvim-ghost.nvim",
  init = function()
    vim.g.nvim_ghost_autostart = false
    vim.keymap.set("n", "<leader>pg", "<cmd>GhostTextStart<CR>", { desc = "Ghost Text Server Start" })
    vim.keymap.set("n", "<leader>pG", "<cmd>GhostTextStop<CR>", { desc = "Ghost Text Server Stop" })
  end,
}
