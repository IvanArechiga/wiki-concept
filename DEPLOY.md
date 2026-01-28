# Guía de Despliegue Automático

Script bash para automatizar el despliegue de tu Wiki SICAR X a GitHub Pages. Basado en la [documentación oficial de MkDocs](https://www.mkdocs.org/user-guide/deploying-your-docs/).

## Script de Despliegue

### **deploy.sh** 🔧
Script Bash automatizado para despliegue continuo.

**Características:**
- ✅ Sin dependencias externas (solo bash)
- ✅ Ligero y rápido
- ✅ Colores en terminal
- ✅ Automatiza todo el flujo

**Uso:**
```bash
./deploy.sh
```

O:
```bash
bash deploy.sh
```

**Flujo automático:**
1. Verifica que estés en el directorio correcto
2. Muestra cambios pendientes
3. `git add .` - Agrega todos los cambios
4. Solicita mensaje de commit (interactivo)
5. `git commit -m "tu mensaje"` - Realiza commit
6. `git push origin {rama}` - Envía cambios al repositorio
7. `mkdocs build --clean` - Compila la documentación
8. `mkdocs gh-deploy --clean` - Publica en GitHub Pages

**Nota:** Requiere `git` y `mkdocs` instalados.

---

## Requisitos Previos

Antes de usar estos scripts, asegúrate de:

### 1. Git Configurado
```bash
git config --list | grep user
```

Si no aparecen, configura:
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

### 2. MkDocs Instalado
```bash
pip install -r requirements.txt
```

El comando `mkdocs gh-deploy` viene incluido en `mkdocs-material` (ya está en requirements.txt).

### 3. GitHub Pages Configurado
En tu repositorio de GitHub:
- Ve a **Settings** → **Pages**
- En "Source", selecciona `Deploy from a branch`
- Rama: `gh-pages`
- Carpeta: `/ (root)`

### 4. Token de GitHub (Recomendado)
Para evitar ingresar contraseña cada vez:
```bash
gh auth login
```

Selecciona:
- Protocol: HTTPS
- Authentication method: Token
- Pega tu [GitHub Personal Access Token](https://github.com/settings/tokens)

---

## Ejemplos de Mensajes de Commit

Sigue [Conventional Commits](https://www.conventionalcommits.org/es/) para consistencia:

```
# Documentación
docs: actualizar guía de despliegue
docs: agregar nuevas secciones en seguridad
docs: corregir ortografía en procesos

# Características
feat: agregar documento de arquitectura
feat: nueva sección en onboarding

# Correcciones
fix: corregir links rotos en index
fix: ajustar estilos CSS

# Mantenimiento
chore: actualizar dependencias
style: reformatear código
refactor: reorganizar documentación

# Configuración
config: actualizar mkdocs.yml
config: cambiar tema de colores
```

---

## Flujo Completo Paso a Paso

### Primera vez (Setup inicial)

```bash
# 1. Clona el repositorio
git clone https://github.com/tu-usuario/wiki-concept.git
cd wiki-concept

# 2. Instala dependencias
pip install -r requirements.txt

# 3. Configura GitHub (si no lo has hecho)
git config user.name "Tu Nombre"
git config user.email "tu@email.com"

# 4. Configura GitHub Pages en GitHub.com
# Ve a Settings → Pages → Habilita GitHub Pages

# 5. Haz primer despliegue
python3 deploy.py
```

### Despliegues siguientes

Simplemente edita los archivos `.md` y ejecuta:

```bash
python3 deploy.py
```

El script se encargará del resto.

---

## Qué Hace Cada Paso

### 1️⃣ Git Add
```bash
git add .
```
Prepara todos los cambios modificados/nuevos para el commit.

### 2️⃣ Git Commit
```bash
git commit -m "tu mensaje descriptivo"
```
Crea un snapshot con tus cambios y un mensaje descriptivo.

**Buena práctica:** Usa mensajes concretos:
- ✅ "docs: agregar sección de API"
- ❌ "cambios"
- ❌ "actualización"

### 3️⃣ Git Push
```bash
git push origin master
```
Sube tus cambios a GitHub (rama main/master).

### 4️⃣ MkDocs Build
```bash
mkdocs build --clean
```
Compila los archivos Markdown a HTML estático en `/site`.

**Opciones:**
- `--clean`: Limpia directorio anterior
- `--config-file`: Usar archivo config diferente
- `--site-dir`: Directorio de salida (default: site/)

### 5️⃣ MkDocs GH Deploy
```bash
mkdocs gh-deploy --clean
```
Publica el contenido de `/site` a la rama `gh-pages` automáticamente.

**Basado en:** [MkDocs - Deploying your docs](https://www.mkdocs.org/user-guide/deploying-your-docs/)

---

## URL Final

Después de desplegar, tu wiki estará disponible en:

```
https://{GITHUB_USERNAME}.github.io/{REPO_NAME}/
```

**Ejemplo:**
Si tu usuario es `IvanArechiga` y repo es `wiki-concept`:
```
https://IvanArechiga.github.io/wiki-concept/
```

El script te mostrará automáticamente la URL correcta al final.

---

## Solución de Problemas

### Error: "mkdocs command not found"
```bash
pip install mkdocs mkdocs-material
```

### Error: "Permission denied" (script bash)
```bash
chmod +x deploy.sh
./deploy.sh
```

### Error: "fatal: not a git repository"
Asegúrate de estar en el directorio raíz del proyecto:
```bash
cd /path/to/wiki-concept
```

### Error: "nothing to commit, working tree clean"
No hay cambios. Edita algún archivo `.md` primero.

### GitHub Pages no actualiza
1. Ve a repositorio → **Settings** → **Pages**
2. Verifica que esté en rama `gh-pages`
3. Espera 1-2 minutos
4. Actualiza el navegador (Ctrl+Shift+R)

### "Please make sure you have the correct access rights"
Problema con GitHub SSH/HTTPS. Intenta:
```bash
gh auth login
```

O usa HTTPS en lugar de SSH:
```bash
git remote set-url origin https://github.com/usuario/repo.git
```

---

## Automatización Avanzada

### GitHub Actions (CI/CD automático)

Crear `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - master
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      
      - name: Install dependencies
        run: pip install -r requirements.txt
      
      - name: Build and deploy
        run: mkdocs gh-deploy --force
```

Ahora cada push a `master` desplegará automáticamente. ✨

---

## Referencias Oficiales

- 📚 [MkDocs Documentation](https://www.mkdocs.org/)
- 📦 [MkDocs Material Theme](https://squidfunk.github.io/mkdocs-material/)
- 🚀 [Deploying MkDocs](https://www.mkdocs.org/user-guide/deploying-your-docs/)
- 🐙 [GitHub Pages Docs](https://docs.github.com/en/pages)
- 📝 [Conventional Commits](https://www.conventionalcommits.org/es/)

---

## Recordatorio de Configuración

Tu `mkdocs.yml` ya incluye:

```yaml
site_name: Wiki SICAR X
theme:
  name: material
  palette:
    scheme: slate
    primary: blue
    accent: blue
extra_css:
  - css/custom.css
plugins:
  - search
markdown_extensions:
  - pymdownx.highlight
  - pymdownx.superfences
  - pymdownx.tabbed
  - tables
  - emoji
```

Todo está listo para desplegar. ¡Adelante! 🚀

---

**Última actualización:** Enero 2026
**Versión:** 1.0
**Estado:** ✅ Producción
