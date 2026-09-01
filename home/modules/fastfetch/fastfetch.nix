{ config, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${config.home.homeDirectory}/dotfiles/Stickers/mahiro.png";
        type = "auto";
        height = 14;
        width = 22;
        padding = {
          top = 1;
          right = 5;
          left = 5;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [
        "break"
        {
          type = "custom";
          key = "╭─────────────────────────────────────────╮";
        }
        {
          type = "custom";
          key = "│                                         │";
        }
        {
          type = "command";
          key = "│  User          ";
          text = "echo $USER | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}'";
          format = "{1>22} {#keys}│";
        }
        {
          type = "os";
          key = "│  OS            ";
          format = "{3>22} {#keys}│";
        }
        {
          type = "command";
          key = "│  Kernel        ";
          text = "uname -r | cut -d '-' -f1";
          format = "{1>22} {#keys}│";
        }
        {
          type = "shell";
          key = "│  Shell         ";
          format = "{1>22} {#keys}│";
        }
        {
          type = "command";
          key = "│  WM            ";
          text = "echo $XDG_CURRENT_DESKTOP";
          format = "{1>22} {#keys}│";
        }
        {
          type = "cpu";
          key = "│  CPU           ";
          format = "{1>22} {#keys}│";
        }
        {
          type = "command";
          key = "│  Memory        ";
          text = "free -m | awk 'NR==2{printf \"%.2f / %.2f GiB\",$3/1024,$2/1024}'";
          format = "{1>22} {#keys}│";
        }
        {
          type = "gpu";
          key = "│  GPU           ";
          hideType = "integrated";
          format = "{2>22} {#keys}│";
        }
        {
          type = "command";
          key = "│  Disk (/)      ";
          text = "df -B1M / | awk 'NR==2 { u=$3/1024; s=$2/1024; u_fmt = (u>=1024) ? sprintf(\"%.2f TiB\", u/1024) : sprintf(\"%.1f GiB\", u); s_fmt = (s>=1024) ? sprintf(\"%.2f TiB\", s/1024) : sprintf(\"%.1f GiB\", s); printf \"%s / %s\", u_fmt, s_fmt }'";
          format = "{1>22} {#keys}│";
        }
        {
          type = "command";
          key = "│  Disk (games)  ";
          text = "df -B1M /mnt/games | awk 'NR==2 { u=$3/1024; s=$2/1024; u_fmt = (u>=1024) ? sprintf(\"%.2f TiB\", u/1024) : sprintf(\"%.1f GiB\", u); s_fmt = (s>=1024) ? sprintf(\"%.2f TiB\", s/1024) : sprintf(\"%.1f GiB\", s); printf \"%s / %s\", u_fmt, s_fmt }'";
          format = "{1>22} {#keys}│";
        }
        {
          type = "command";
          key = "│  Disk (media)  ";
          text = "df -B1M /mnt/media | awk 'NR==2 { u=$3/1024; s=$2/1024; u_fmt = (u>=1024) ? sprintf(\"%.2f TiB\", u/1024) : sprintf(\"%.1f GiB\", u); s_fmt = (s>=1024) ? sprintf(\"%.2f TiB\", s/1024) : sprintf(\"%.1f GiB\", s); printf \"%s / %s\", u_fmt, s_fmt }'";
          format = "{1>22} {#keys}│";
        }
        {
          type = "custom";
          key = "│                                         │";
        }
        {
          type = "custom";
          key = "╰─────────────────────────────────────────╯";
        }
        "break"
      ];
    };
  };
}
