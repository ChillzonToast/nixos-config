{ config, pkgs, ... }:

{
  services.network-manager-applet.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ''
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
        color: white;
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

      #custom-launcher {
        font-size: 24px;
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 5px;
        border-radius: 10px;
        transition: none;
        color: #fe8019;
        background: #161320;
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
      }

      #pulseaudio {
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

      #mpris {
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        margin-top: 6px;
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

      #battery#bat2 {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #96cdfb;
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
      }

      #temperature {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #d3869b;
      }

      #keyboard-state {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #83a598;
      }

      #idle_inhibitor {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #d79921;
      }

      #custom-suspend {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #689d6a;
      }

      #custom-poweroff {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #cc241d;
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

      #tray {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #a89984;
      }

      #custom-warp {
        margin-top: 6px;
        margin-left: 8px;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 0px;
        border-radius: 10px;
        transition: none;
        color: #161320;
        background: #458588;
      }

      #custom-warp.connected {
        background: #689d6a;
        color: #161320;
      }

      #custom-warp.connecting {
        background: #d79921;
        color: #161320;
      }

      #custom-warp.disconnected {
        background: #cc241d;
        color: #fbf1c7;
      }

      #custom-warp.error {
        background: #fb4934;
        color: #161320;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 0;

        modules-left = [ "custom/launcher" "pulseaudio" "idle_inhibitor" "custom/suspend" "custom/poweroff" "custom/warp" "mpris" ]; #"hyprland/window"
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "network" "memory" "cpu" "temperature#cpu" "temperature#gpu" "keyboard-state" "battery" "battery#bat2" "clock" ];

        "custom/launcher" = {
          format = " ";
          on-click = "sh ~/.config/rofi/launchers/type-2/launcher.sh";
          on-click-right = "killall rofi";
        };

        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
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

        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "hyprland/window" = {
          format = "{}";                    # Show full window title
          max-length = 20;                  # Limit length
          separate-outputs = true;          # Show different windows per monitor
          rewrite = {                       # Clean up window titles
            "(.*) — Mozilla Firefox" = " $1";
          };
        };

        mpd = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 2;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = " 1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };

        "custom/poweroff" = {
          format = " ";
          on-click = "systemctl poweroff";
        };

        "custom/suspend" = {
          format = "";
          on-click = "systemctl suspend";
        };

        idle_inhibitor = {
          format = "{icon} ";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%H:%M}";
          format-alt = "{:%m-%d-%Y}";
          interval = 60;
        };

        cpu = {
          interval = 5;
          format = "{usage}% ";
          tooltip = false;
          max-length = 10;
          on-click = "kitty -- btop";
        };

        memory = {
          interval = 5;
          format = "{}% ";
          max-length = 10;
        };

        "temperature#cpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 70;
          format = " {temperatureC}°C {icon}";
          format-icons = [""];
        };

        "temperature#gpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
          critical-threshold = 80;
          format = " {temperatureC}°C {icon}";
          format-icons = [""];
        };


        battery = {
          states = {
            full = 100;
            good = 95;
            decent = 50;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{icon} {time}";
          format-time = "{H} h {M} min";
          format-icons = ["" "" "" "" ""];
        };

        "battery#bat2" = {
          bat = "BAT2";
        };

        network = {
          tooltip = false;
          format-wifi = "{essid} ";
          format-ethernet = "󰌗 {ipaddr}/{cidr}";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        pulseaudio = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "custom/warp" = let
          warp-status = pkgs.writeShellScript "warp-status" ''
            #!/bin/bash

            # Get warp status
            status=$(${pkgs.cloudflare-warp}/bin/warp-cli status 2>/dev/null | grep "Status update:" | cut -d: -f2 | xargs)

            case "$status" in
                "Connected")
                    echo '{"text": "󰖂 WARP", "class": "connected", "tooltip": "Warp VPN: Connected"}'
                    ;;
                "Connecting")
                    echo '{"text": "󰇘 WARP", "class": "connecting", "tooltip": "Warp VPN: Connecting..."}'
                    ;;
                "Disconnected")
                    echo '{"text": " WARP", "class": "disconnected", "tooltip": "Warp VPN: Disconnected"}'
                    ;;
                *)
                    echo '{"text": " WARP", "class": "error", "tooltip": "Warp VPN: Status unknown"}'
                    ;;
            esac
          '';
          warp-toggle = pkgs.writeShellScript "warp-toggle" ''
            #!/bin/bash

            # Get current warp status
            status=$(${pkgs.cloudflare-warp}/bin/warp-cli status 2>/dev/null | grep "Status update:" | cut -d: -f2 | xargs)

            case "$status" in
                "Connected")
                    ${pkgs.cloudflare-warp}/bin/warp-cli disconnect
                    ;;
                "Disconnected")
                    ${pkgs.cloudflare-warp}/bin/warp-cli connect
                    ;;
                "Connecting")
                    # If connecting, disconnect to cancel
                    ${pkgs.cloudflare-warp}/bin/warp-cli disconnect
                    ;;
                *)
                    # Try to connect if status is unknown
                    ${pkgs.cloudflare-warp}/bin/warp-cli connect
                    ;;
            esac
          '';
        in {
          return-type = "json";
          exec = "${warp-status}";
          on-click = "${warp-toggle}";
          interval = 5;
          tooltip = true;
        };

        mpris = {
         format = "{player_icon} {dynamic}";
         format-paused = "{status_icon} <i>{dynamic}</i>";
         player-icons = {
           default = "";
           spotify = "";
           firefox = "";
         };
         status-icons = {
           paused = "";
           playing = "";
         };
         max-length = 30;
         on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
        };

      };
    };
  };
}
