{ ... }:
{
  programs.nixvim.plugins.yanky = {
    enable = true;
    enableTelescope = true;

    settings = {
      highlight = {
        on_put = true;
        on_yank = true;
        timer = 500;
      };

      picker = {
        telescope = {
          mappings = {
            default = "mapping.put('p')";
            i = {
              "<c-g>".__raw = "mapping.put('p')";
              "<c-k>".__raw = "mapping.put('P')";
              "<c-r>".__raw = "mapping.set_register(utils.get_default_register())";
              "<c-x>".__raw = "mapping.delete()";
            };
            n = {
              P.__raw = "mapping.put('P')";
              d.__raw = "mapping.delete()";
              gP.__raw = "mapping.put('gP')";
              gp.__raw = "mapping.put('gp')";
              p.__raw = "mapping.put('p')";
              r.__raw = "mapping.set_register(utils.get_default_register())";
            };
          };
        };
      };

      preserve_cursor_position = {
        enabled = true;
      };
    };
  };
}
