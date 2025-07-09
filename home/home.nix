{ config, pkgs, inputs, ... }:

{
	imports = [
		./hyprland.nix
		./programs.nix
	];

	home.username = "ibilees";
	home.homeDirectory = "/home/ibilees";

	programs.home-manager.enable = true;
	home.stateVersion = "25.05";
}
