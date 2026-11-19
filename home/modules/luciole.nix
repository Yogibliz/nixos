{ inputs, ... }:
{
  imports = [ inputs.luciole.homeModules.default ];

  programs.luciole = {
    enable = true;
    settings = {
      browser = {
        view_mode = "list";
        show_hidden = true;
        always_show_tab_bar = false;
        background_opacity = 0.8;
        confirm_permanent_deletion = true;
        switch_to_new_tab = false;
        show_sidebar = true;
        show_drives = true;
        show_preview = true;
        sidebar_width = 300;
        preview_width = 420;
      };
    };
  };
}
