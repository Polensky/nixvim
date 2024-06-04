{
	telescope = {
		enable = true;
		extensions = {
		  fzf-native.enable = true;
		};
		keymaps = {
			"<leader><space>" = {
				action = "git_files";
				options.desc = "Telescope Git files";
			};
		};
	};
}
