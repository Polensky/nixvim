{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ../modules/bufferline.nix
		../modules/telescope.nix
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
			settings.options.theme = "everforest";
    };
		web-devicons.enable = true;
    vim-surround.enable = true;
    treesitter.enable = true;
  };

  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      yamlls.enable = true;
			bashls.enable = true;
    };
  };

  plugins = {
    cmp = {
      enable = true;
      settings = {
				sources = [
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
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
		cmp_luasnip.enable = true;
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
