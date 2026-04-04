{...}: {
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        { __unkeyed-1 = "<leader>b"; group = "buffers"; icon = "󰓩 "; }
        { __unkeyed-1 = "<leader>c"; group = "code"; icon = " "; }
        { __unkeyed-1 = "<leader>f"; group = "find"; icon = " "; }
        { __unkeyed-1 = "<leader>g"; group = "git"; icon = " "; }
        { __unkeyed-1 = "<leader>u"; group = "ui"; icon = " "; }
        { __unkeyed-1 = "<leader>w"; group = "windows"; icon = " "; }
        { __unkeyed-1 = "<leader>x"; group = "diagnostics"; icon = " "; }
      ];
    };
  };
}
