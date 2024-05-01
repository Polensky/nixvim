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
    mapping = {
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "<Tab>" = {
        action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end
        '';
        modes = [ "i" "s" ];
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    everforest
  ];
}
