{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      max-visible = 3;
      anchor = "bottom-right";
      font = "Inconsolata";
      actions = 1;
      icons = 1;
      markup = 1;
      padding = 5;
      background-color = "#3c3836";
      progress-color = "#2e3440";
      text-color = "#fbf1c7";
      border-color = "#fbf1c7";
      border-size = 2;
      border-radius = 2;
      default-timeout = 6000;
    };
  };
}
