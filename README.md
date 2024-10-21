# ✨ SpireNIX Neovim ✨

<a href="https://nixos.wiki/wiki/Flakes" target="_blank">
	<img alt="Nix Flakes Ready" src="https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Nix%20Flakes&labelColor=5e81ac&message=Ready&color=d8dee9&style=for-the-badge">
</a>
<a href="https://github.com/snowfallorg/lib" target="_blank">
	<img alt="Built With Snowfall" src="https://img.shields.io/static/v1?logoColor=d8dee9&label=Built%20With&labelColor=5e81ac&message=Snowfall&color=d8dee9&style=for-the-badge">
</a>

<p>
<!--
	This paragraph is not empty, it contains an em space (UTF-8 8195) on the next line in order
	to create a gap in the page.
-->
  
</p>

> Customized Neovim, ready for development out of the box.

## Screenshots

![Busy](https://github.com/dtgagnon/nixvim/assets/7005773/cc318a24-51aa-4412-9cfa-610ab9cc8991)
![Dashboard](https://github.com/dtgagnon/nixvim/assets/7005773/27c3a3c4-acf0-4a89-be1e-4f642144348a)

## Try Without Installing

You can try this configuration out without committing to installing it on your system by running
the following command.

```nix
nix run github:dtgagnon/nixvim
```

## Install

### Nix Profile

You can install this package imperatively with the following command.

```nix
nix profile install github:dtgagnon/nixvim
```

### Nix Configuration

You can install this package by adding it as an input to your Nix flake.

```nix
{
	description = "My system flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		stable.url = "github:nixos/nixpkgs/nixos-24.05";

		# Snowfall is not required, but will make configuration easier for you.
		snowfall-lib.url = "github:snowfallorg/lib";
		snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim.url = "github:dtgagnon/nixvim";
		# This flake currently requires changes that are only on the Unstable channel.
		nixvim.inputs.nixpkgs.follows = "unstable";
	};

	outputs = inputs:
		inputs.snowfall-lib.mkFlake {
			inherit inputs;
			src = ./.;

			overlays = with inputs; [
				# Use the overlay provided by this flake.
				neovim.overlays.default

				# There is also a named overlay, though the output is the same.
				neovim.overlays."package/neovim"
			];
		};
}
```

If you've added the overlay from this flake, then in your system configuration
you can add the `spirenix.nixvim` package.

```nix
{ pkgs }:

{
	environment.systemPackages = with pkgs; [
		spirenix.nixvim
	];
}
```
