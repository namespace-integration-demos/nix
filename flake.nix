{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          gopls
          go-outline
          go-tools
          upx
          yarn
          pre-commit

          goreleaser
          gh

          eksctl
          postgresql

          git
          nodejs
          crane
          kubectl
          awscli2
          jq
          aws-iam-authenticator
          google-cloud-sdk
          
          clang-tools
          brotli
          sqlite
          unzip
          cargo
          jdk8
        ];
      };
    });
}
