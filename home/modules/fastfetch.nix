{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = "${./logos/.face.ascii}";

      display = {
        separator = "  ";
      };

      modules = [
        "host"
        "os"
        "kernel"
        "uptime"
        "shell"
        "wm"
        "cpu"
        "memory"
        "gpu"
        "disk"
        "packages"
      ];
    };
  };
}
