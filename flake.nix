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

      apps = forAllSystems supportedSystems (system:
        let
          pkgs = pkgsFor.${system};
        in
        {
          default = {
            type = "app";
            program = pkgs.writeShellApplication {
              name = "run-hugo-server";
              runtimeInputs = [ pkgs.hugo ];
              text = ''
                hugo server
              '';
            } + "/bin/run-hugo-server";
          };
        }
      );

      packages = forAllSystems supportedSystems (system:
        let
          pkgs = pkgsFor.${system};
        in
        {
          default = pkgs.stdenv.mkDerivation {
            name = "hugo-site";
            src = ./.;
            buildInputs = [ pkgs.hugo ];
            buildPhase = ''
              # Ensure the theme is available
              if [ ! -d "themes/DoIt" ]; then
                mkdir -p themes
                git clone https://github.com/HEIGE-PCloud/DoIt.git themes/DoIt
              fi
              
              # Build the site
              hugo --minify
            '';
            installPhase = ''
              cp -r public $out
            '';
          };
        }
      );
    };
}
