{ config, pkgs, inputs, ... }:

{
	#User packages
	home.packages = with pkgs; [
		spotify
		neofetch
		brightnessctl
		inputs.zen-browser.packages."${system}".twilight
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
			size = 12;
			name = "JetBrains Mono";
		};
		themeFile = "gruvbox-dark";
		settings = {
			background_opacity = "1";
		};
	};

	home.sessionVariables = {
		TERMINAL = "kitty";
	};
	
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
}
