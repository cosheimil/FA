{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [
    jupyter-all
  ];

  languages.python = {
    enable = true;
    venv.enable = true;
  };
}
