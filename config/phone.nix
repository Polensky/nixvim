{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
		./telescope.nix
  ];

  colorscheme = "everforest";
  clipboard.register = "unnamedplus";

  opts = {
    number = true;
    relativenumber = true;
    tabstop = 2;
    shiftwidth = 2;
    mouse = "a";
    hlsearch = true;
  };

  globals.mapleader = " ";

  plugins = {
    lualine = {
      enable = true;
      theme = "everforest";
    };
    surround.enable = true;
    treesitter.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    everforest
  ];

  keymaps = [
    {
      action = "<cmd>nohlsearch<CR>";
      key = "<Esc>";
      mode = "n";
    }
    {
      action = "<cmd>:w<CR>";
      key = "<leader>fs";
      mode = "n";
    }
		# Split navigation
    {
      action = "<C-w>l";
      key = "<leader>wl";
      mode = "n";
    }
    {
      action = "<C-w>h";
      key = "<leader>wh";
      mode = "n";
    }
    {
      action = "<C-w>k";
      key = "<leader>wk";
      mode = "n";
    }
    {
      action = "<C-w>j";
      key = "<leader>wj";
      mode = "n";
    }
    {
      action = "<cmd>vsplit<CR>";
      key = "<leader>wv";
      mode = "n";
    }
    {
      action = "<cmd>split<CR>";
      key = "<leader>ws";
      mode = "n";
    }
  ];
}
