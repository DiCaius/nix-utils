{
  description = "Flake-based library with Nix utilities.";
  inputs = {
    flake-compat = {
      flake = false;
      url = "github:edolstra/flake-compat";
    };
  };
  outputs = { flake-compat, self }: {
    dump = { inherit flake-compat self; };
    lib = import ./lib;
  };
}

