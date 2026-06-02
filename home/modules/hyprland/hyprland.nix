{
  config,
  lib,
  ...
}:
{
  # home.activation.installHy3 = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   if ! /usr/bin/hyprpm list 2>/dev/null | grep -q "hy3"; then
  #     $DRY_RUN_CMD /usr/bin/hyprpm add https://github.com/outfoxxed/hy3
  #     $DRY_RUN_CMD /usr/bin/hyprpm enable hy3
  #   fi
  # '';

  # hl.plugin.load("${config.home.homeDirectory}/.local/share/hyprpm/installedPlugins/hy3/hy3.so")
  # local hy3 = hl.plugin.hy3
  xdg.configFile."hypr/hyprland.lua".text = ''
    local config_dir = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
    dofile(config_dir .. "/hypr/monitors.lua")
    dofile(config_dir .. "/hypr/colors.lua")
  '';
}
