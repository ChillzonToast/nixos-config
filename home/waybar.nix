{ config, pkgs, ... }:

{	
	programs.waybar = {
		enable = true;
		systemd.enable = true;
	};
	programs.waybar.style = ''
		* {
		  border: none;
		  border-radius: 8;
		  font-family: "JetBrainsMono Nerd Font";
		  font-size: 16px;
		  min-height: 20px;
		}

		window#waybar {
		  background: transparent;
		}

		window#waybar.hidden {
		  opacity: 0.2;
		}

		#window {
		  margin-top: 6px;
		  padding-left: 10px;
		  padding-right: 10px;
		  border-radius: 10px;
		  transition: none;
		  color: transparent;
		  background: transparent;
		}

		#workspaces {
		  margin-top: 6px;
		  margin-left: 12px;
		  font-size: 20px;
		  font-weight: 500;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  background: #282828;
		  /* default: background: #161320; */
		  transition: none;
		}

		#workspaces button {
		  transition: none;
		  color: #fbf1c7;
		  /* default: color: #b5e8e0; */
		  background: transparent;
		  border-radius: 2px;
		}

		#workspaces button.active {
		  color: #fe8019;
		}

		#workspaces button:hover {
		  transition: none;
		  box-shadow: inherit;
		  text-shadow: inherit;
		  color: #d65d0e;
		  border-color: #d65d0e;
		  /* border-color: #e8a2af; */
		  /* color: #e8a2af; */
		}

		#network {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  padding-right: 10px;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #fb4934;
		  /*default: background: #bd93f9;*/
		}

		#wireplumber {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  padding-right: 10px;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  transition: none;
		  color: #1a1826;
		  background: #fae3b0;
		}

		#battery {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  padding-right: 10px;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #b5e8e0;
		}

		#battery.critical:not(.charging) {
		  background-color: #b5e8e0;
		  color: #161320;
		  animation-name: blink;
		  animation-duration: 1s;
		  animation-timing-function: linear;
		  animation-iteration-count: infinite;
		  animation-direction: alternate;
		}

		@keyframes blink {
		  to {
		    background-color: #bf616a;
		    color: #b5e8e0;
		  }
		}

		#backlight {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  padding-right: 10px;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #f8bd96;
		}

		#clock {
		  margin-top: 6px;
		  margin-left: 8px;
		  margin-right: 8px;
		  padding-left: 10px;
		  padding-right: 10px;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #8ec07c;
		  /*default: background: #abe9b3; */
		}

		#memory {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  margin-bottom: 0px;
		  padding-right: 10px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #fabd2f;
		  /*default: background: #ddb6f2; */
		}

		#cpu {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  margin-bottom: 0px;
		  padding-right: 10px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #b8bb26;
		  /*default: background: #96cdfb; */
		}

		#custom-launcher {
		  font-size: 24px;
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  padding-right: 5px;
		  border-radius: 10px;
		  transition: none;
		  color: #fe8019;
		  /*default: color: #89dceb; */
		  background: #161320;
		}

		#custom-media {
		  margin-top: 6px;
		  margin-left: 8px;
		  padding-left: 10px;
		  padding-right: 10px;
		  margin-bottom: 0px;
		  border-radius: 10px;
		  transition: none;
		  color: #161320;
		  background: #f2cdcd;
	}
	'';
	programs.waybar.settings = {
        	mainBar = {
			layer = "top";
			position = "top";
			height = 30;
			output = [ "eDP-1" "HDMI-A-1" ];

			modules-left = [ "custom/launcher" "backlight" "wireplumber" ];
			modules-center = [ "hyprland/workspaces" ];
			modules-right = [ "network" "cpu" "memory" "battery" "clock" ];

			wireplumber = {
				tooltip = false;
				scroll-step = 5;
				format = "{icon} {volume}%";
				format-muted = "󰝟 {volume}%";
				on-click = "kitty -- alsamixer -V all";
				format-icons.default = [ "" "" "" ];
			};

			network = {
				tooltip = false;
				format-wifi = "  {essid}";
				format-ethernet = "";
				on-click = "kitty -- nmtui";
			};

			backlight = {
				tooltip = false;
				format = " {}%";
				interval = 1;
				on-scroll-up = "light -A 5";
				on-scroll-down = "light -U 5";
			};

			battery = {
				states = {
				  full = 100;
				  good = 95;
				  decent = 50;
				  warning = 30;
				  critical = 20;
				};
				format = "{icon}  {capacity}%";
				format-time = "{H} h {M} min";
				format-alt = "{icon} {time}";
				format-icons = [ "" "" "" "" "" ];
			};

			clock = {
				format = "{:%H:%M}";
				format-alt = "{:%m-%d-%Y}";
			};

			cpu = {
				interval = 15;
				format = "  {}%";
				max-length = 10;
				on-click = "kitty -- btop";
			};

			memory = {
				interval = 30;
				format = "  {}%";
				max-length = 10;
			};

			"custom/media" = {
				interval = 30;
				format = "{icon} {}";
				return-type = "json";
				max-length = 20;
				format-icons = {
				  spotify = " ";
				  default = " ";
				};
				escape = true;
				exec = "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null";
				on-click = "playerctl play-pause";
			};

			"custom/launcher" = {
				format = " ";
				on-click = "sh ~/.config/rofi/launchers/type-2/launcher.sh";
				on-click-right = "killall rofi";
			};

			"hyprland/workspaces" = {
				format = "{icon}";
				on-click = "activate";
				format-icons = {
				  "1" = "壹";
				  "2" = "貳";
				  "3" = "參";
				  "4" = "肆";
				  "5" = "伍";
				  "6" = "陸";
				  "7" = "柒";
				  "8" = "捌";
				  "9" = "玖";
				  "10" = "拾";
				};
				active = "";
				sort-by-number = true;
			};
		};
	};
}
