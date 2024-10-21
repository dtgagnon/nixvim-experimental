{
  description = "A custom neovim configuration using nixvim.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-24.05";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    snowfall-lib.url = "github:snowfallorg/lib";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  # TODO: a todo
  # NOTE: a note
  # WARN: a warning
  # HACK: a hack
  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;
      snowfall.namespace = "spirenix";

      channels-config.allowUnfree = true;

      alias.packages.default = "neovim";

      overlays = with inputs; [ nixvim.overlays.default ];

      outputs-builder = channels: {
        formatter = channels.nixpkgs.nixfmt-rfc-style;
        checks.pre-commit-check =
          inputs.pre-commit-hooks.lib.${channels.nixpkgs.system}.run {
            src = ./.;
            hooks = {
              nixfmt-rfc-style = {
                enable = true;
                entry = "${channels.nixpkgs.nixfmt-rfc-style}/bin/nixfmt";
                extraPackages = [ channels.nixpkgs.hooks.nixfmt-rfc-style ];
              };
            };
          };
      };
    };
}
