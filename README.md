# SICAR X - Wiki Organizacional

Documentación centralizada y profesional para SICAR X.

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

- **15+ documentos** organizacionales
- **6 categorías** temáticas
- **Tema personalizado** (Azul Rey, Blanco, Negro)
- **Searchable** y con navegación intuitiva

### Documentación Incluida

**Setup & Configuración**
- Guía de MkDocs (cómo compilar)

**Políticas y Estándares**
- Políticas de la empresa
- Seguridad y compliance (ISO 27001, GDPR, CCPA)

**Desarrollo**
- Procesos de desarrollo (SDLC, Agile, Git)
- Arquitectura de sistemas
- Estándares de código
- Guía de despliegue

**Personas**
- Recursos humanos
- Guía de onboarding (90 días)

**Operaciones**
- Procedimientos operacionales diarios

**Otros**
- Home personalizado
- About SICAR X

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
