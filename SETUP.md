# Cómo Compilar y Ejecutar el Wiki

Este repositorio contiene la documentación organizacional compilada con **MkDocs** y el tema **Material for MkDocs**.

## Inicio Rápido

### 1. Requisitos Previos

```bash
# Verificar Python 3.8+
python --version

# Verificar pip
pip --version
```

### 2. Instalación

```bash
# Clonar repositorio (si no lo tienes)
git clone <URL-del-repositorio>
cd wiki-concept

# Crear entorno virtual (opcional pero recomendado)
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate

# Instalar dependencias
pip install mkdocs mkdocs-material
```

### 3. Ejecutar en Desarrollo

```bash
# Inicia el servidor local
mkdocs serve

# Abre tu navegador en http://localhost:8000
```

El sitio se recarga automáticamente cuando editas archivos.

### 4. Compilar para Producción

```bash
# Genera los archivos estáticos en la carpeta 'site/'
mkdocs build

# Opcional: Limpiar archivos antiguos
mkdocs build --clean
```

## Estructura del Proyecto

```
wiki-concept/
├── mkdocs.yml              # Configuración
├── docs/                   # Documentos en Markdown
│   ├── index.md           # Página principal
│   ├── setup-guia.md      # Guía de configuración de MkDocs
│   ├── politicas-empresa.md      # Políticas y normas
│   ├── procesos-desarrollo.md    # Procesos técnicos
│   ├── recursos-humanos.md       # Información de RRHH
│   ├── onboarding.md            # Guía de integración
│   ├── arquitectura-sistemas.md  # Arquitectura técnica
│   ├── about.md
│   └── testing/
│       └── automation.md
└── site/                   # Generado automáticamente (NO comitear)
```

## Comandos Útiles

| Comando | Descripción |
|---------|------------|
| `mkdocs serve` | Inicia servidor de desarrollo (http://localhost:8000) |
| `mkdocs build` | Compila el sitio |
| `mkdocs build --clean` | Limpia y recompila |
| `mkdocs --version` | Muestra versión |
| `mkdocs --help` | Ayuda |

## Editar Documentación

1. Edita archivos `.md` en la carpeta `docs/`
2. El navegador se recarga automáticamente en `mkdocs serve`
3. Haz commit de tus cambios:

```bash
git add docs/
git commit -m "docs: actualizar sección X"
git push
```

## Agregar Nuevas Páginas

1. Crea archivo Markdown en `docs/` (ej: `docs/nueva-pagina.md`)
2. Añade entrada en `mkdocs.yml` bajo `nav:`

```yaml
nav:
  - Home: index.md
  - Nueva Página: nueva-pagina.md
```

3. Guarda y recarga

## Despliegue (GitHub Pages)

```bash
# Instalar plugin
pip install mkdocs-ghpages

# Desplegar
mkdocs gh-deploy
```

El sitio estará en `https://usuario.github.io/wiki-concept/`

## Personalización del Tema

### Colores Actuales

El sitio utiliza un tema personalizado **Dracula** con los colores:
- **Azul Rey**: #4169E1 (primario)
- **Blanco**: #FFFFFF (texto claro)
- **Negro**: #000000 (fondo oscuro)

### Cambiar Colores

Edita `mkdocs.yml` en la sección `theme.palette`:

```yaml
theme:
  palette:
    - scheme: slate
      primary: blue        # Color primario
      accent: light-blue   # Color de acento
```

O personaliza directamente `docs/css/custom.css` para cambiar las variables CSS:

```css
:root {
  --color-azul-rey: #4169E1;      /* Cambiar color primario */
  --color-blanco: #FFFFFF;        /* Cambiar blanco */
  --color-negro: #000000;         /* Cambiar negro */
}
```

### Opciones de Color Disponibles

- `red`, `pink`, `purple`, `deep-purple`
- `indigo`, `blue`, `light-blue`, `cyan`
- `teal`, `green`, `light-green`, `lime`
- `yellow`, `amber`, `orange`, `deep-orange`
- `brown`, `grey`, `blue-grey`, `black`

## Para Más Detalles

Ver la documentación completa en [Guía de Setup de MkDocs](docs/setup-guia.md)

---

**Última Actualización**: Enero 2024
