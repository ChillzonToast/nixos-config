{ config, pkgs, ... }:

{	
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			general = {
				border_size = 2;
				"col.active_border" = "rgb(235,219,178)";
			};
			monitor = "eDP-1,preferred,auto,1.2";
			bind = [
				# --- Window Management ---
				"SUPER, Q, killactive"
				"SUPER SHIFT, F, fullscreen"
				"SUPER, SPACE, togglefloating"

				# --- Launch Applications ---
				"SUPER, Return, exec, kitty"
				"SUPER, B, exec, zen"

				# --- Focus Windows ---
				"SUPER, h, movefocus, l"
				"SUPER, l, movefocus, r"
				"SUPER, k, movefocus, u"
				"SUPER, j, movefocus, d"
				"SUPER, left, movefocus, l"
				"SUPER, right, movefocus, r"
				"SUPER, up, movefocus, u"
				"SUPER, down, movefocus, d"

				# --- Move Windows ---
				"SUPER SHIFT, h, movewindow, l"
				"SUPER SHIFT, l, movewindow, r"
				"SUPER SHIFT, k, movewindow, u"
				"SUPER SHIFT, j, movewindow, d"
				"SUPER SHIFT, left, movewindow, l"
				"SUPER SHIFT, right, movewindow, r"
				"SUPER SHIFT, up, movewindow, u"
				"SUPER SHIFT, down, movewindow, d"

				# --- Workspaces (1–10) ---
				"SUPER, 1, workspace, 1"
				"SUPER, 2, workspace, 2"
				"SUPER, 3, workspace, 3"
				"SUPER, 4, workspace, 4"
				"SUPER, 5, workspace, 5"
				"SUPER, 6, workspace, 6"
				"SUPER, 7, workspace, 7"
				"SUPER, 8, workspace, 8"
				"SUPER, 9, workspace, 9"
				"SUPER, 0, workspace, 10"

				# --- Move to Workspace ---
				"SUPER SHIFT, 1, movetoworkspace, 1"
				"SUPER SHIFT, 2, movetoworkspace, 2"
				"SUPER SHIFT, 3, movetoworkspace, 3"
				"SUPER SHIFT, 4, movetoworkspace, 4"
				"SUPER SHIFT, 5, movetoworkspace, 5"
				"SUPER SHIFT, 6, movetoworkspace, 6"
				"SUPER SHIFT, 7, movetoworkspace, 7"
				"SUPER SHIFT, 8, movetoworkspace, 8"
				"SUPER SHIFT, 9, movetoworkspace, 9"
				"SUPER SHIFT, 0, movetoworkspace, 10"

				# --- Scroll Workspaces ---
				"SUPER, mouse_down, workspace, e+1"
				"SUPER, mouse_up, workspace, e-1"

				# --- App launcher ---
				"SUPER, D, exec, tofi-drun | xargs hyprctl dispatch exec --"

				# --- Clipboard Clipse ---
				"SUPER, V, exec, kitty --class clipse -e clipse"

				# --- Screenshot hyprshot ---
				"SUPER, PRINT, exec, hyprshot -m output"
				"SUPER SHIFT, PRINT, exec, hyprshot -m region"
			];
			
			# Mouse binding
			bindm = [
				# --- Resize with Mouse ---
				"SUPER, mouse:272, movewindow"
				"SUPER, mouse:273, resizewindow"
			];
			
			# Trigger on press and repeat
			bindel = [
				# --- Volume Control ---
				", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

				# --- Brightness Control (via brightnessctl) ---
				", XF86MonBrightnessUp, exec, brightnessctl set +5%"
				", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

			];
			# Optional: set workspace names (Hyprland 0.34+)
			workspace = [
				"1, name:1"
				"2, name:2"
				"3, name:3"
				"4, name:4"
				"5, name:5"
				"6, name:6"
				"7, name:7"
				"8, name:8"
				"9, name:9"
				"10, name:10"
			];
		};
		extraConfig = ''
			windowrule = float, class:^(clipse)$
			windowrule = size 622 652, class:^(clipse)$
			windowrule = stayfocused, class:^(clipse)$
		'';
	};
	home.pointerCursor = {
		enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
		size = 24;

		hyprcursor = {
			enable = true;
			size = config.home.pointerCursor.size;
		};

		x11.enable = true;
	};

	xdg.enable = true;
}
