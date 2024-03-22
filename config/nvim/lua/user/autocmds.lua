-- Ansible file pattern
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("Ansible", { clear = true }),
  pattern = {
    "*/roles/*/*/*.yaml",
    "*/roles/*/*/.yml",
    "main.yml",
    "main.yaml",
    "Debian*.yaml",
    "Debian*.yml",
    "*/ansible-devbox/*.yaml",
    "*/ansible-devbox/*.yml",
    "group_vars/*.yml",
    "group_vars/*.yaml",
    "files/*.yaml",
    "files/*.yml",
    "environments/*.yaml",
    "environments/*.yml,",
  },
  callback = function()
    vim.opt.filetype = "yaml.ansible"
  end,
}),
