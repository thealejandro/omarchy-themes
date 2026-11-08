<a href="https://thealejandro.dev"><picture><source media="(prefers-color-scheme: dark)" srcset="docs/marca/logotipo.svg"><img alt="thealejandro" src="docs/marca/logotipo-mono-oscuro.svg" height="32"></picture></a>

# omarchy-themes

[English](README.md)

Once temas minimalistas para [Omarchy](https://omarchy.org), inspirados en macOS y
Windows, en oscuro y claro, más dos hooks pequeños que los completan.

Galería: [thealejandro.dev/omarchy](https://thealejandro.dev/omarchy)

## Empezar

```bash
git clone https://github.com/thealejandro/omarchy-themes
omarchy-themes/install.sh all          # hooks + todos los temas
omarchy-themes/install.sh tahoe aero   # hooks + solo estos
omarchy-themes/install.sh              # solo los hooks
```

Cada tema es su propio repo, así que también puedes instalar uno directamente con
`omarchy theme install <url>`. Mantenlos al día con `omarchy theme update`.

## Temas

| | |
| --- | --- |
| [![Cupertino](https://raw.githubusercontent.com/thealejandro/omarchy-cupertino-theme/main/preview.png)](https://github.com/thealejandro/omarchy-cupertino-theme)<br>**[Cupertino](https://github.com/thealejandro/omarchy-cupertino-theme)** · macOS · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-cupertino-theme` | [![Cupertino Light](https://raw.githubusercontent.com/thealejandro/omarchy-cupertino-light-theme/main/preview.png)](https://github.com/thealejandro/omarchy-cupertino-light-theme)<br>**[Cupertino Light](https://github.com/thealejandro/omarchy-cupertino-light-theme)** · macOS · claro<br>`omarchy theme install https://github.com/thealejandro/omarchy-cupertino-light-theme` |
| [![Graphite](https://raw.githubusercontent.com/thealejandro/omarchy-graphite-theme/main/preview.png)](https://github.com/thealejandro/omarchy-graphite-theme)<br>**[Graphite](https://github.com/thealejandro/omarchy-graphite-theme)** · monocromo · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-graphite-theme` | [![Big Sur](https://raw.githubusercontent.com/thealejandro/omarchy-big-sur-theme/main/preview.png)](https://github.com/thealejandro/omarchy-big-sur-theme)<br>**[Big Sur](https://github.com/thealejandro/omarchy-big-sur-theme)** · macOS Big Sur · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-big-sur-theme` |
| [![Ventura](https://raw.githubusercontent.com/thealejandro/omarchy-ventura-theme/main/preview.png)](https://github.com/thealejandro/omarchy-ventura-theme)<br>**[Ventura](https://github.com/thealejandro/omarchy-ventura-theme)** · macOS Ventura · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-ventura-theme` | [![Tahoe](https://raw.githubusercontent.com/thealejandro/omarchy-tahoe-theme/main/preview.png)](https://github.com/thealejandro/omarchy-tahoe-theme)<br>**[Tahoe](https://github.com/thealejandro/omarchy-tahoe-theme)** · macOS Tahoe · claro<br>`omarchy theme install https://github.com/thealejandro/omarchy-tahoe-theme` |
| [![Fluent](https://raw.githubusercontent.com/thealejandro/omarchy-fluent-theme/main/preview.png)](https://github.com/thealejandro/omarchy-fluent-theme)<br>**[Fluent](https://github.com/thealejandro/omarchy-fluent-theme)** · Windows 11 · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-fluent-theme` | [![Fluent Light](https://raw.githubusercontent.com/thealejandro/omarchy-fluent-light-theme/main/preview.png)](https://github.com/thealejandro/omarchy-fluent-light-theme)<br>**[Fluent Light](https://github.com/thealejandro/omarchy-fluent-light-theme)** · Windows 11 · claro<br>`omarchy theme install https://github.com/thealejandro/omarchy-fluent-light-theme` |
| [![Obsidiana](https://raw.githubusercontent.com/thealejandro/omarchy-obsidiana-theme/main/preview.png)](https://github.com/thealejandro/omarchy-obsidiana-theme)<br>**[Obsidiana](https://github.com/thealejandro/omarchy-obsidiana-theme)** · original · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-obsidiana-theme` | [![Aero](https://raw.githubusercontent.com/thealejandro/omarchy-aero-theme/main/preview.png)](https://github.com/thealejandro/omarchy-aero-theme)<br>**[Aero](https://github.com/thealejandro/omarchy-aero-theme)** · Windows Vista/7 · claro<br>`omarchy theme install https://github.com/thealejandro/omarchy-aero-theme` |
| [![Aero Night](https://raw.githubusercontent.com/thealejandro/omarchy-aero-night-theme/main/preview.png)](https://github.com/thealejandro/omarchy-aero-night-theme)<br>**[Aero Night](https://github.com/thealejandro/omarchy-aero-night-theme)** · Windows Vista/7 · oscuro<br>`omarchy theme install https://github.com/thealejandro/omarchy-aero-night-theme` |   |

## Los hooks

Los dos son hooks `theme-set` de Omarchy: corren cada vez que cambias de tema, con
cualquier tema, no solo con estos.

- **`40-theme-shape`**: esquinas redondeadas. Omarchy descarta los `.lua` de los
  temas instalados desde un repo, así que el radio de las esquinas nunca llega.
  Estos temas lo traen en un `shape.toml` y este hook lo aplica. Cualquier autor
  de temas puede usarlo:

  ```toml
  # shape.toml
  rounding = 12        # px, 0-40
  rounding_power = 4   # 2 = círculo, 4 = squircle estilo macOS
  ```

- **`30-tide-colors`**: recolorea el prompt [Tide](https://github.com/IlanCosman/tide)
  de fish con la paleta del tema (ruta, git, hora, estado...). Los segmentos de
  lenguajes conservan sus colores de marca. La primera vez guarda tus colores
  originales, y un tema puede ajustarlos con un `tide.fish` opcional.

Solo usan comandos públicos de Omarchy, nunca hacen fallar un cambio de tema y no
hacen nada si falta fish, Tide o una clave.

Quítalos (y recupera tus colores de Tide) con `omarchy-themes/install.sh --uninstall`.

## Consejos

- Ligaduras (`=>`, `!==`, `>=`): usa Ghostty o Kitty con una fuente con ligaduras
  (`omarchy font set "FiraCode Nerd Font"`). Alacritty no tiene ligaduras.

Sin relación con Apple ni Microsoft. [MIT](LICENSE)

Hecho por [thealejandro](https://thealejandro.dev)
