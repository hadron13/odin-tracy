let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell.override { stdenv = pkgs.clangStdenv; }
{  
  packages = with pkgs; [
    gnumake 
    pkg-config 
    freetype 
    capstone 
    glfw 
    dbus
    libGL
    libcxx
  ];  
  shellHook = ''
        export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
          pkgs.libGL
        ]}
  '';
}
