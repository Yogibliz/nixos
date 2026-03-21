# ── Git ───────────────────────────────────────────────────
{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Iris";
        email = "irisphere@pm.me";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
