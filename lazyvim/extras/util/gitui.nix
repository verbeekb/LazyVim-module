self:
{
    config,
    lib,
    pkgs,
    ...
  }:
  let 
    inherit (lib.modules) mkIf;
    inherit (lib.options) mkEnableOption;

    cfg = config.programs.lazyvim;
  in
  {
      options.programs.lazyvim.extras.util.gitui = {
          enable = mkEnableOption "the util.gitui extra";
        };

        config = mkIf cfg.extras.util.gitui.enable {
          programs.neovim = {
            extraPackages = [pkgs.gitui];
            };
          };
  }
