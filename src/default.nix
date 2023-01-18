{ writeShellApplication
, openssh
, gitMinimal
, rsync
, nix
, coreutils
, curl
, gnugrep
, findutils
, gnused
}:
let
  runtimeInputs = [
    openssh
    gitMinimal # for git flakes
    rsync
    nix
    coreutils
    curl # when uploading tarballs
    gnugrep
    findutils
    gnused # needed by ssh-copy-id
  ];
in
(writeShellApplication {
  name = "nixos-remote";
  text = builtins.readFile ./nixos-remote.sh;
  inherit runtimeInputs;
}) // {
  # also expose this attribute to other derivations
  inherit runtimeInputs;
}
