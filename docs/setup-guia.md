# Guía de Configuración y Compilación de MkDocs

## Descripción General

Esta guía proporciona los pasos necesarios para compilar y ejecutar la documentación del sitio wiki utilizando **MkDocs** con el tema **Material for MkDocs**.

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- **Python 3.8 o superior**
- **pip** (gestor de paquetes de Python)
- **git** (para control de versiones)

### Verificar Instalación

```bash
python --version
pip --version
```

## Instalación

### 1. Clonar el Repositorio

```bash
git clone <URL-del-repositorio>
cd wiki-concept
```

### 2. Crear un Entorno Virtual (Recomendado)

```bash
# En Linux/Mac
python -m venv venv
source venv/bin/activate

# En Windows
python -m venv venv
venv\Scripts\activate
```

### 3. Instalar Dependencias

```bash
pip install mkdocs mkdocs-material
```

O si existe un archivo `requirements.txt`:

```bash
pip install -r requirements.txt
```

## Estructura del Proyecto

```
wiki-concept/
├── mkdocs.yml          # Configuración principal de MkDocs
├── docs/               # Carpeta con archivos Markdown
│   ├── index.md       # Página principal
│   ├── about.md       # Página sobre
│   ├── setup-guia.md  # Esta guía
│   └── testing/
│       └── automation.md
├── site/               # Carpeta generada con el sitio compilado
└── README.md           # Archivo de inicio del repositorio
```

## Compilación y Ejecución

### Opción 1: Servidor de Desarrollo (Recomendado)

Para compilar y servir la documentación en tiempo real con recarga automática:

```bash
mkdocs serve
```

Por defecto, el sitio estará disponible en: **http://localhost:8000**

Ventajas:
- Recarga automática al editar archivos
- Útil para desarrollo y pruebas
- Detecta errores en tiempo real

### Opción 2: Compilar para Producción

Para generar los archivos estáticos en la carpeta `site/`:

```bash
mkdocs build
```

Esto creará una carpeta `site/` con todos los archivos HTML, CSS y JavaScript necesarios para desplegar el sitio.

### Opciones Útiles de mkdocs build

```bash
# Generar sitio limpio (elimina archivos anteriores)
mkdocs build --clean

# Generar sitio sin enviar a remoto
mkdocs build

# Especificar un directorio de salida diferente
mkdocs build -d mi-directorio-de-salida/
```

## Archivo de Configuración (mkdocs.yml)

La configuración principal se encuentra en `mkdocs.yml`:

```yaml
site_name: SICAR X Organizational Wiki    # Nombre del sitio
theme: material                            # Tema utilizado

nav:                                       # Estructura de navegación
  - Home: index.md
  - About: about.md
  - Testing: testing/automation.md
```

### Configuraciones Recomendadas Adicionales

Para potenciar tu documentación, considera añadir:

```yaml
site_name: SICAR X Organizational Wiki
theme: material

# Información del sitio
site_url: https://ejemplo.com/
site_description: Documentación organizacional

# Metadatos
copyright: Copyright &copy; 2024 Tu Empresa

# Extensiones
markdown_extensions:
  - pymdownx.highlight
  - pymdownx.superfences
  - toc
  - tables

# Configuración del tema
theme:
  name: material
  language: es
  features:
    - navigation.tabs
    - navigation.instant
    - toc.integrate
```

## Creación y Edición de Páginas

### Crear una Nueva Página

1. Crea un archivo Markdown en la carpeta `docs/`
2. Añade la ruta al archivo en `mkdocs.yml` bajo la sección `nav:`

Ejemplo:

```bash
# Crear archivo
touch docs/guias/usuarios.md

# Actualizar mkdocs.yml
```

```yaml
nav:
  - Home: index.md
  - Guías:
    - Usuarios: guias/usuarios.md
```

### Estructura de un Archivo Markdown

```markdown
# Título Principal

## Sección 1

Contenido con **texto en negrita** e *itálica*.

### Subsección

- Elemento 1
- Elemento 2

## Sección 2

```

## Despliegue

### Opción 1: GitHub Pages

```bash
pip install mkdocs-ghpages
mkdocs gh-deploy
```

### Opción 2: Servidor Web Estático

1. Ejecuta `mkdocs build`
2. Sube la carpeta `site/` a tu servidor web
3. Configura el servidor para servir `index.html` como archivo por defecto

## Solución de Problemas

### "command not found: mkdocs"

Asegúrate de que:
- Está instalado: `pip install mkdocs mkdocs-material`
- El entorno virtual está activado

### Los cambios no se reflejan

- En modo serve: Recarga la página (Ctrl+F5)
- En modo build: Ejecuta `mkdocs build --clean`

### Error de extensiones faltantes

```bash
pip install mkdocs-material pymdown-extensions
```

## Comandos Útiles

| Comando | Descripción |
|---------|------------|
| `mkdocs serve` | Inicia el servidor de desarrollo |
| `mkdocs build` | Compila el sitio para producción |
| `mkdocs build --clean` | Limpia y recompila |
| `mkdocs --version` | Muestra la versión instalada |
| `mkdocs --help` | Muestra todos los comandos disponibles |

## Mejores Prácticas

1. **Mantén los archivos organizados**: Crea carpetas temáticas
2. **Usa nombres descriptivos**: `guia-instalacion.md` en lugar de `doc1.md`
3. **Actualiza mkdocs.yml**: Sincroniza con la estructura de carpetas
4. **Revisa en local**: Siempre prueba con `mkdocs serve` antes de publicar
5. **Versionado**: Usa git para controlar cambios
6. **Usa el formato Markdown**: Mantén consistencia en el formato
7. **Links internos**: Utiliza rutas relativas: `[Link](../otras/pagina.md)`

## Documentación Oficial

- [Sitio Oficial de MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)

## Contacto y Soporte

Para dudas sobre la compilación o configuración, contacta al equipo de documentación.
