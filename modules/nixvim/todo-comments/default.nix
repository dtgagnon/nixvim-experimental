{ lib, theme, ... }: 
let 
  theme = lib.spirenix.theme;
in {
  plugins.todo-comments = {
    enable = true;

    settings = {
      signs = true;

      highlight = {
        multiline = true;
        pattern = ".*<(KEYWORDS)\\s*:";
        before = "fg";
      };

      search = { pattern = "\\b(KEYWORDS):"; };

      mergeKeywords = true;

      keywords = {
        FIX = {
          icon = " ";
          color = "error";
          alt = [ "FIXME" "BUG" "FIXIT" "ISSUE" ];
        };
        TODO = {
          icon = " ";
          color = "todo";
        };
        HACK = {
          icon = " ";
          color = "error";
          alt = [ "HACK" "DRAGONS" ];
        };
        WARN = {
          icon = " ";
          color = "warning";
          alt = [ "WARNING" "WARNING" "WARN" ];
        };
        PERF = {
          icon = " ";
          color = "info";
          alt = [ "OPTIM" "PERFORMANCE" "OPTIMIZE" "PERF" "PERFORMANCE" ];
        };
        NOTE = {
          icon = " ";
          color = "hint";
          alt = [ "INFO" "NOTE" "INFO" ];
        };
      };

      colors = with theme; {
        error = [ ${theme}11 ];
        warning = [ ${theme}12 ];
        info = [ ${theme}15 ];
        hint = [ ${theme}10 ];
        todo = [ ${theme}6 ];
        default = [ ${theme}6 ];
      };
    };
  };
}
