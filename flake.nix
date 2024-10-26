{
  description = "";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  inputs.flake-utils.url = "https://flakehub.com/f/numtide/flake-utils/0.1.*.tar.gz";

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        # python-libxdo = nixpkgs.python312.pkgs.buildPythonPackage rec {
        #   pname = "python-libxdo";
        #   version = "0.1.2a1";
        #   pyproject = true;
        #
        #   src = nixpkgs.lib.fetchFromGitHub {
        #     owner = "rshk";
        #     repo = "python-libxdo";
        #     rev = "v${version}";
        #     hash = "sha256-tAlhrQOUA8CvazAV1gVHCmJHM3GbLnfBbuTcHlZmLUs=";
        #   };
        #
        #   build-system = [
        #     pkgs.python312.pkgs.setuptools
        #     pkgs.python312.pkgs.wheel
        #   ];
        #
        #   pythonImportsCheck = [
        #     "python_libxdo"
        #   ];
        #
        #   meta = {
        #     description = "Python bindings for libxdo";
        #     homepage = "https://github.com/rshk/python-libxdo/tree/master";
        #     changelog = "https://github.com/rshk/python-libxdo/blob/${src.rev}/CHANGELOG.rst";
        #     license = nixpkgs.lib.licenses.bsd3;
        #   };
        # };
      in
      {
        devShell.${system}.default = pkgs.mkShell {
          packages = [
            pkgs.xdotool
            pkgs.python312
            pkgs.uv
          ];
        };

        packages.${system}.default = pkgs.python312.pkgs.buildPythonApplication {
          pname = "keypilot";
          version = "0.0.1";
          pyproject = true;

          src = ./.;

          build-system = [
            pkgs.python312.pkgs.setuptools
          ];

          dependencies = [
            pkgs.python312.pkgs.readchar
            pkgs.xdotool
          ];

          meta = { };
        };
      }
    );
}
