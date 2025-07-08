{ config, pkgs, ... }:

{
	home.username = "ibilees";
	home.homeDirectory = "/home/ibilees";

	#User packages
	home.packages = with pkgs; [
		spotify
		neofetch
	];

	programs.zsh = {
		enable = true;
		enableCompletion= true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			ll = "ls -la";
			la = "ls -A";
			".." = "cd ..";
		};
		initContent = "
			neofetch
		";
	};

	programs.kitty = {
		enable = true;
		font = {
			size = 10;
			name = "JetBrains Mono";
		};

		settings = {
			background_opacity = "0.9";
		};
	};
	
	programs.git = {
		enable = true;
		userName = "Chillzontoast";
		userEmail = "ibinujaleel6@gmail.com";

		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	home.sessionVariables = {
		TERMINAL = "kitty";
	};

	home.stateVersion = "25.05";
}
