{ config, pkgs, inputs, ... }:

{
	#User packages
	home.packages = with pkgs; [
		spotify
		fastfetch
		brightnessctl
		inputs.zen-browser.packages."${system}".twilight
		waybar
		wl-clipboard
		hyprshot
		zed-editor
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
			fastfetch
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
			confirm_os_window_close = 0;
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
	# Wallpaper	
	services.hyprpaper.enable = true;
	services.hyprpaper.settings = {
		ipc = "on";
		preload = [ "/home/ibilees/nixos-config/home/wallpaper.png" ];
		wallpaper = [ ",/home/ibilees/nixos-config/home/wallpaper.png" ];
	};
	
	# Clipboard
	services.clipse.enable = true;

	# Application launcher
	programs.tofi = {
		enable = true;
		settings = {
			text-color = "#ebdbb2";
			prompt-color = "#fb4934";
			selection-color = "#b8bb26";
			background-color = "#3c3836";
			border-width = 2;
			outline-width = 0;
			border-color = "#ebdbb2";
			corner-radius = 8;
		};
	};

	# Zeditor
	programs.zed-editor.enable = true;
}
