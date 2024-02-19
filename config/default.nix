{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

  colorschemes.nord.enable= true;

  plugins = {
    lualine.enable = true;
  };

  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      nixd.enable = true;
    };
  };

  plugins.nvim-cmp = {
    enable = true;
  };
}
