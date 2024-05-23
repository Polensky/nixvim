{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

  colorscheme = "everforest";
  clipboard.register = "unnamedplus";

  opts = {
    number = true;
    relativenumber = true;
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
    telescope = {
      enable = true;
      keymaps = {
	"<leader><space>" = {
	  action = "git_files";
	  options.desc = "Telescope Git files";
	};
      };
    };
  };

  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      nixd.enable = true;
      elixirls.enable = true;
      yamlls.enable = true;
    };
  };

  plugins = {
    cmp = {
      enable = true;
      settings = {
	sources= [
	  {name = "nvim_lsp";}
	];
	mapping = {
	  "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	  "<C-j>" = "cmp.mapping.select_next_item()";
	  "<C-k>" = "cmp.mapping.select_prev_item()";
	  "<C-e>" = "cmp.mapping.abort()";
	  "<C-b>" = "cmp.mapping.scroll_docs(-4)";
	  "<C-f>" = "cmp.mapping.scroll_docs(4)";
	  "<C-Space>" = "cmp.mapping.complete()";
	  "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
	};
      };
    };
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-nvim-lsp-document-symbol = {enable = true;}; # lsp
    cmp-buffer = {enable = true;};
    cmp-path = {enable = true;};
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
  ];
}
