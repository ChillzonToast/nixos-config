{ config, pkgs, inputs, ... }:

{
	#User packages
	home.packages = with pkgs; [
		spotify
		neofetch
		brightnessctl
		inputs.zen-browser.packages."${system}".twilight
		hyprpaper
		waybar
		wl-clipboard
		clipse
		hyprshot
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
			bindkey "\e[1;5C" forward-word
			bindkey "\e[1;5D" backward-word
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
			background_opacity = "0.9";
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
	
	services.hyprpaper.enable = true;
	services.hyprpaper.settings = {
		ipc = "on";
		preload = [ "/home/ibilees/nixos-config/home/wallpaper.png" ];
		wallpaper = [ ",/home/ibilees/nixos-config/home/wallpaper.png" ];
	};
	
	services.clipse.enable = true;

}
