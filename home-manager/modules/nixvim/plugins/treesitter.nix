{ ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      ensure_installed = [
        "bash"
        "c"
        "cpp"
        "json"
        "lua"
        "markdown"
        "markdown_inline"
        "nix"
        "python"
        "rust"
        "toml"
        "vim"
        "vimdoc"
        "yaml"
      ];
    };
  };
}
