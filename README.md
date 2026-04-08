# Documentación de Testing

Documentación centralizada para **testers que programan casos automatizados en Java**. Esta wiki incluye guías de testing, automatización, estándares de código, lineamientos generales y procesos para el equipo de QA.

## 🚀 Inicio Rápido

```bash
# Instalar dependencias
pip install -r requirements.txt

# Iniciar servidor local
mkdocs serve

# Abrir en navegador
http://localhost:8000
```

## 📚 Contenido

- **Guía de Estandarización** para repositorios de QA Automation
- **Estructura de Proyectos** detallada
- **Definición de Clases de Pruebas** con nomenclatura y anotaciones
- **Tema Personalizado** para navegación intuitiva

### Documentación Incluida

**Testing y Automatización**
- Guía de Estandarización para Repositorios de QA Automation
- Arquitectura del Proyecto
- Definición de Estructura para Clases de Pruebas

## 🎨 Tema Personalizado

- **Color primario**: Azul Rey (#4169E1)
- **Modo oscuro**: Dracula-like
- **Modo claro**: Profesional
- **CSS personalizado**: [docs/css/custom.css](docs/css/custom.css)

## 🚀 Despliegue Automático

Script bash para desplegar a GitHub Pages automáticamente:

```bash
./deploy.sh
```

Automatiza: `git add` → `commit` → `push` → `mkdocs build` → `gh-deploy`

Ver [DEPLOY.md](DEPLOY.md) para documentación completa.

## 📖 Más Detalles

Ver [SETUP.md](SETUP.md) para instrucciones de instalación y configuración.

Ver [DEPLOY.md](DEPLOY.md) para guía de despliegue a GitHub Pages.

## 📝 Última Actualización

Enero 28, 2025 - Versión 1.1.0

Ver [CHANGELOG.md](CHANGELOG.md) para historial completo.

---

**Desarrollo**: http://localhost:8000 (mkdocs serve)

**Producción**: https://{usuario}.github.io/{repositorio}/ (GitHub Pages)
