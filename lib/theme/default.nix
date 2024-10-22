{ lib, config, ... }:

let
  selectedTheme = "everforest"; # Change this to switch themes

  themeFile = builtins.readFile (./ + selectedTheme + "/default.nix");
  theme = import (./ + selectedTheme + "/default.nix") { inherit lib; };
in
{
  inherit theme;
}