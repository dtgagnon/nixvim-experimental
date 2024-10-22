{ lib, ... }:
let theme = lib.spirenix.theme;
in {
  highlight = with theme; {
    RainbowDelimiterBlue.fg = ${theme}7;
    RainbowDelimiterOrange.fg = ${theme}12;
    RainbowDelimiterGreen.fg = ${theme}14;
    RainbowDelimiterViolet.fg = ${theme}15;
    RainbowDelimiterCyan.fg = ${theme}9;
  };

  plugins = {
    rainbow-delimiters = {
      enable = true;

      highlight = [
        "RainbowDelimiterViolet"
        "RainbowDelimiterBlue"
        "RainbowDelimiterGreen"
        "RainbowDelimiterOrange"
        "RainbowDelimiterCyan"
      ];
    };
  };
}
