{ helpers, lib, ... }:

let
  theme = lib.spirenix.theme;
in
{
  colorschemes.${theme} = {
    enable = true;
    settings = {
      borders = true;
      contrast = false;
      disable_background = false;
      enable_sidebar_background = true;
    };
  };
}
