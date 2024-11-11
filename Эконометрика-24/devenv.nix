{ pkgs, lib, config, inputs, ... }:

{
  packages = (with pkgs; [
    jupyter-all
  ]) ++ (with pkgs.python311Packages; [
    pandas
    scikit-learn
    scipy
    matplotlib
    seaborn
  ]);

  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ''
      matplotlib
      scikit-learn
      pandas
      scipy
      seaborn
      statsmodels
    '';
    uv.enable = true;
    uv.sync.enable = true;
  };
}
