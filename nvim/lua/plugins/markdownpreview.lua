return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- <leader>mdにマッピング
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "markdown",
      callback = function()
        vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", {
          desc = "Markdown Preview Toggle",
        })
      end,
    })
  end,
  ft = { "markdown" },
}
