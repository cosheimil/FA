{ pkgs, lib, config, inputs, ... }:

{
  packages = (with pkgs; [ jupyter-all ]) ++(
    with pkgs.python311Packages; [
      pandas
      faker
    ]
  );

  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ''
      pandas
      faker
    '';
  };

  services.postgres = {
    enable = true;
    listen_addresses = "127.0.0.1";
    port = 5432;
  };
}
