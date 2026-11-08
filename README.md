<a href="https://thealejandro.dev"><picture><source media="(prefers-color-scheme: dark)" srcset="docs/marca/logotipo.svg"><img alt="thealejandro" src="docs/marca/logotipo-mono-oscuro.svg" height="32"></picture></a>

# omarchy-themes

[Español](README.es.md)

Eleven minimal themes for [Omarchy](https://omarchy.org), inspired by macOS and
Windows, in dark and light, plus two small hooks that complete them.

Gallery: [thealejandro.dev/omarchy](https://thealejandro.dev/omarchy)

## Quick start

```bash
git clone https://github.com/thealejandro/omarchy-themes
omarchy-themes/install.sh all          # hooks + every theme
omarchy-themes/install.sh tahoe aero   # hooks + only these
omarchy-themes/install.sh              # hooks only
```

Each theme is its own repo, so you can also install one directly with
`omarchy theme install <url>`. Keep them current with `omarchy theme update`.

## Themes

| | |
| --- | --- |
| [![Cupertino](https://raw.githubusercontent.com/thealejandro/omarchy-cupertino-theme/main/preview.png)](https://github.com/thealejandro/omarchy-cupertino-theme)<br>**[Cupertino](https://github.com/thealejandro/omarchy-cupertino-theme)** · macOS · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-cupertino-theme` | [![Cupertino Light](https://raw.githubusercontent.com/thealejandro/omarchy-cupertino-light-theme/main/preview.png)](https://github.com/thealejandro/omarchy-cupertino-light-theme)<br>**[Cupertino Light](https://github.com/thealejandro/omarchy-cupertino-light-theme)** · macOS · light<br>`omarchy theme install https://github.com/thealejandro/omarchy-cupertino-light-theme` |
| [![Graphite](https://raw.githubusercontent.com/thealejandro/omarchy-graphite-theme/main/preview.png)](https://github.com/thealejandro/omarchy-graphite-theme)<br>**[Graphite](https://github.com/thealejandro/omarchy-graphite-theme)** · monochrome · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-graphite-theme` | [![Big Sur](https://raw.githubusercontent.com/thealejandro/omarchy-big-sur-theme/main/preview.png)](https://github.com/thealejandro/omarchy-big-sur-theme)<br>**[Big Sur](https://github.com/thealejandro/omarchy-big-sur-theme)** · macOS Big Sur · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-big-sur-theme` |
| [![Ventura](https://raw.githubusercontent.com/thealejandro/omarchy-ventura-theme/main/preview.png)](https://github.com/thealejandro/omarchy-ventura-theme)<br>**[Ventura](https://github.com/thealejandro/omarchy-ventura-theme)** · macOS Ventura · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-ventura-theme` | [![Tahoe](https://raw.githubusercontent.com/thealejandro/omarchy-tahoe-theme/main/preview.png)](https://github.com/thealejandro/omarchy-tahoe-theme)<br>**[Tahoe](https://github.com/thealejandro/omarchy-tahoe-theme)** · macOS Tahoe · light<br>`omarchy theme install https://github.com/thealejandro/omarchy-tahoe-theme` |
| [![Fluent](https://raw.githubusercontent.com/thealejandro/omarchy-fluent-theme/main/preview.png)](https://github.com/thealejandro/omarchy-fluent-theme)<br>**[Fluent](https://github.com/thealejandro/omarchy-fluent-theme)** · Windows 11 · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-fluent-theme` | [![Fluent Light](https://raw.githubusercontent.com/thealejandro/omarchy-fluent-light-theme/main/preview.png)](https://github.com/thealejandro/omarchy-fluent-light-theme)<br>**[Fluent Light](https://github.com/thealejandro/omarchy-fluent-light-theme)** · Windows 11 · light<br>`omarchy theme install https://github.com/thealejandro/omarchy-fluent-light-theme` |
| [![Obsidiana](https://raw.githubusercontent.com/thealejandro/omarchy-obsidiana-theme/main/preview.png)](https://github.com/thealejandro/omarchy-obsidiana-theme)<br>**[Obsidiana](https://github.com/thealejandro/omarchy-obsidiana-theme)** · original · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-obsidiana-theme` | [![Aero](https://raw.githubusercontent.com/thealejandro/omarchy-aero-theme/main/preview.png)](https://github.com/thealejandro/omarchy-aero-theme)<br>**[Aero](https://github.com/thealejandro/omarchy-aero-theme)** · Windows Vista/7 · light<br>`omarchy theme install https://github.com/thealejandro/omarchy-aero-theme` |
| [![Aero Night](https://raw.githubusercontent.com/thealejandro/omarchy-aero-night-theme/main/preview.png)](https://github.com/thealejandro/omarchy-aero-night-theme)<br>**[Aero Night](https://github.com/thealejandro/omarchy-aero-night-theme)** · Windows Vista/7 · dark<br>`omarchy theme install https://github.com/thealejandro/omarchy-aero-night-theme` |   |

## The hooks

Both are Omarchy `theme-set` hooks: they run every time you change themes, with
any theme, not only these.

- **`40-theme-shape`**: rounded corners. Omarchy drops `.lua` files from themes
  installed from a repo, so the corner radius never arrives. These themes ship
  it in a `shape.toml`, and this hook applies it. Any theme author can use it:

  ```toml
  # shape.toml
  rounding = 12        # px, 0-40
  rounding_power = 4   # 2 = circle, 4 = macOS-like squircle
  ```

- **`30-tide-colors`**: recolors the [Tide](https://github.com/IlanCosman/tide)
  prompt for fish with the theme's palette (path, git, time, status...).
  Language segments keep their brand colors. Your original colors are saved on
  the first run, and a theme can fine-tune them with an optional `tide.fish`.

They only use Omarchy's public commands, never fail a theme change, and do
nothing when fish, Tide or a key is missing.

Remove them (and restore your Tide colors) with `omarchy-themes/install.sh --uninstall`.

## Tips

- Font ligatures (`=>`, `!==`, `>=`): use Ghostty or Kitty with a ligature font
  (`omarchy font set "FiraCode Nerd Font"`). Alacritty has no ligatures.

Not affiliated with Apple or Microsoft. [MIT](LICENSE)

Made by [thealejandro](https://thealejandro.dev)
