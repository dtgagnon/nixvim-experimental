{
  plugins.navic = {
    enable = true;

    settings = {
      separator = "  ";
      highlight = true;
      lsp = {
        auto_Attach = true;
        preference = [ "nixd" ];
      };
    };
  };
}
