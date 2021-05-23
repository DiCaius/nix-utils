{ nixpkgs }:

let
  mkNixBackground = { description, name, src }:
    let
      pkg = nixpkgs.stdenv.mkDerivation {
        dontUnpack = true;
        inherit name src;
        installPhase = ''
          # GNOME
          mkdir -p $out/share/backgrounds/nixos
          ln -s $src $out/share/backgrounds/nixos/${src.name}
          # TODO: is this path still needed?
          mkdir -p $out/share/artwork/gnome
          ln -s $src $out/share/artwork/gnome/${src.name}
          # KDE
          mkdir -p $out/share/wallpapers/${name}/contents/images
          ln -s $src $out/share/wallpapers/${name}/contents/images/${src.name}
          cat >> $out/share/wallpapers/${name}/metadata.desktop << _EOF
            [Desktop Entry]
            Name=${name}
            X-KDE-PluginInfo-Name=${name}
          _EOF
        '';
        meta = with nixpkgs.lib; {
          inherit description;
          homepage = "https://github.com/NixOS/nixos-artwork";
          license = license.free;
          platforms = platforms.all;
        };
        passthru = {
          gnomeFilePath = "${pkg}/share/backgrounds/nixos/${src.name}";
          kdeFilePath =
            "${pkg}/share/wallpapers/${name}/contents/images/${src.name}";
          name = src.name;
        };
      };
    in pkg;
in { inherit mkNixBackground; }

