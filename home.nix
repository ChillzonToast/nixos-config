{ config, pkgs, ... }:

{
	home.username = "ibilees";
	home.homeDirectory = "/home/ibilees";

	#User packages
	home.packages = with pkgs; [
		spotify
		neofetch
		firefox
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
		initContent = ''
			RED='%F{167}'      # Gruvbox red
    			YELLOW='%F{214}'   # Gruvbox yellow
			GREEN='%F{142}'    # Gruvbox green
			BLUE='%F{109}'     # Gruvbox blue
			PURPLE='%F{175}'   # Gruvbox purple
		        RESET='%f'
			
			PROMPT="''${RED}[''${YELLOW}%n''${GREEN}@''${BLUE}%m''${RED}:''${PURPLE}%~''${RED}]''${RESET}$ "
			neofetch
		'';
	};

	programs.kitty = {
		enable = true;
		font = {
			size = 10;
			name = "JetBrains Mono";
		};
		themeFile = "gruvbox-dark";
		settings = {
			background_opacity = "1";
		};
	};
	
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			general = {
				border_size = 2;
				"col.active_border" = "rgb(235,219,178)";
			};
			bind = [
				"SUPER, Q, killactive"
				"SUPER, Return, exec, kitty"
				"SUPER SHIFT, F, fullscreen"
				"SUPER, B, exec, firefox"
			];
		};
	};
	xdg.enable = true;	

	programs.git = {
		enable = true;
		userName = "Chillzontoast";
		userEmail = "ibinujaleel6@gmail.com";

		extraConfig = {
			init.defaultBranch = "main";
		};
	};
	
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
		flake = "/home/ibilees/nixos-config";
	};

	home.sessionVariables = {
		TERMINAL = "kitty";
	};
	
	programs.home-manager.enable = true;

	home.stateVersion = "25.05";
}
