# nix-utils -> version: 1.0.1 | nixpkgs(20.09)
Flake-based library with Nix utilities.

## Usage

### `mkNixBackground -> { description = string; name = string; src = fetcherResult; } -> wallpaperDerivation`
Builds a derivation describing a wallpaper that can be installed in the Nix Store for reproducible configurations. It is lifted from [nixpkgs](https://github.com/NixOS/nixpkgs/blob/d600f006643e074c2ef1d72e462e218b647a096c/pkgs/data/misc/nixos-artwork/wallpapers.nix#L7) and was authored by [romildo](https://github.com/romildo/), [worldofpeace](https://github.com/worldofpeace/), [qknight](https://github.com/qknight/), [zimbatm](https://github.com/zimbatm), [peterhoeg](https://github.com/peterhoeg/), & [Profpatsch](https://github.com/Profpatsch/).

