(import (let lock = builtins.fromJSON (builtins.readFile ./flake.lock);
in fetchTarball {
  sha256 = lock.nodes.flake-compat.locked.narHash;
  url =
    "https://github.com/edolstra/flake-compat/archive/${lock.nodes.flake-compat.locked.rev}.tar.gz";
}) { src = ./.; }).defaultNix

