{
  plugins.auto-session = {
    enable = true;

    settings = {
      bypass_save_filetypes = [ "dashboard" "nvim-tree" ];

      auto_restore = true;
      auto_save = true;
      enabled = true;
      auto_create = true;
      useGitBranch = true;
    };
  };

  keymaps = [{
    mode = "n";
    action = "<cmd>Telescope session-lens<cr>";
    key = "<leader>fs";
    options = { desc = "Find Session"; };
  }];
}

