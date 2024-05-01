{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

  colorscheme = "everforest";

  plugins = {
    lualine = {
      enable = true;
      theme = "everforest";
    };
    surround.enable = true;
  };

  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      nixd.enable = true;
    };
  };

  plugins.cmp = {
    enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    everforest
  ];
}
