# NixOs
My NixOs Config (No longer developed)

## Add a new host

1. Create folder in `hosts/<hostname>`
2. Add `configuration.nix`, `hardware-configuration.nix`, `home.nix`
3. Rebuild:

```bash
sudo nixos-rebuild switch --flake .#<hostname>

