{
	plugins = {
		telescope = {
			enable = true;
			extensions = {
				fzf-native.enable = true;
			};
			keymaps = {
				"<leader><space>" = {
					action = "git_files";
					options.desc = "search file in git project";
				};
				"<leader>sd" = {
					action = "live_grep";
					options.desc = "search string in current directory";
				};
				"<leader>bb" = {
					action = "buffers";
					options.desc = "search buffers";
				};
				"<leader>ff" = {
					action = "find_files";
					options.desc = "search files in CWD";
				};
			};
		};
	};
}
