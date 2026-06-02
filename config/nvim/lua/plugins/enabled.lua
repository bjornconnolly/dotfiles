-- Extra plugins

return {
  { "giuxtaposition/blink-cmp-copilot" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst" } },
  },
  {
    "mfussenegger/nvim-ansible",
    ft = {},
    keys = {
      {
        "<leader>ta",
        function()
          require("ansible").run()
        end,
        desc = "Ansible Run Playbook/Role",
        silent = true,
      },
    },
    lazy = true,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ansible-lint",
        "ansible-language-server",
        "ruff",
        "pyright",
      },
    },
  },
}
