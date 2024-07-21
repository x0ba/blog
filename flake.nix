{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      forAllSystems = systems: f:
        nixpkgs.lib.genAttrs systems (system: f system);

      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      pkgsFor = forAllSystems supportedSystems (system:
        import nixpkgs { inherit system; }
      );
    in
    {
      devShells = forAllSystems supportedSystems (system:
        let
          pkgs = pkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              hugo
              git
            ];

            shellHook = ''
              echo "Welcome to the Hugo project environment!"
              echo "Run 'hugo' to start your development server."
            '';
          };
        }
      );
    };
}
