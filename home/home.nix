{ config, pkgs, inputs, ... }:

{
	imports = [
		./hyprland.nix
		./programs.nix
		./waybar.nix
		./fonts.nix
		./mako.nix
	];

	home.username = "ibilees";
	home.homeDirectory = "/home/ibilees";

	programs.home-manager.enable = true;
	home.stateVersion = "25.05";
}
