{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [ jupyter-all python311Packages.tkinter ];

  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ''
      pandas
      numpy
      # tkinter
      tk
      taichi
      scipy
    '';
  };
}
