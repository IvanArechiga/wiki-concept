# Guía de Contribución a la Wiki

## Introducción

¡Gracias por querer contribuir a la Wiki de SICAR X! Este documento te guía en cómo agregar, editar o mejorar la documentación.

## 1. Antes de Empezar

### Requisitos Previos

- Git instalado
- Acceso al repositorio
- Python 3.8+ (para ver cambios localmente)
- Editor de texto (VS Code recomendado)

### Obtener el Repositorio

```bash
# Clonar
git clone https://github.com/IvanArechiga/wiki-concept.git
cd wiki-concept

# Crear rama
git checkout -b docs/nombre-del-cambio
```

## 2. Estructura de la Wiki

```
docs/
├── index.md                          # Home
├── about.md                          # About
├── setup-guia.md                    # Setup
├── politicas-empresa.md             # Políticas
├── seguridad-compliance.md          # Seguridad
├── procesos-desarrollo.md           # Procesos técnicos
├── arquitectura-sistemas.md         # Arquitectura
├── estandares-codigo.md             # Estándares
├── despliegue.md                    # Despliegue
├── recursos-humanos.md              # RRHH
├── onboarding.md                    # Onboarding
├── procedimientos-operacionales.md  # Procedimientos
├── css/
│   └── custom.css                   # Estilos personalizados
└── testing/
    └── automation.md                # Testing
```

## 3. Tipos de Contribuciones

### Tipo 1: Agregar Nuevo Documento

**Cuándo**:
- Nuevo proceso importante
- Nuevo producto/servicio
- Nuevo departamento

**Pasos**:

1. **Crear archivo**
   ```bash
   # Crear documento
   vim docs/nuevo-documento.md
   ```

2. **Estructura básica**
   ```markdown
   # Título del Documento
   
   ## Introducción
   Breve descripción.
   
   ## Secciones Principales
   - Sección 1
   - Sección 2
   - Sección 3
   
   ## Contactos
   Info de contacto.
   
   ---
   **Última Actualización**: [Fecha]
   **Responsable**: [Nombre]
   ```

3. **Actualizar mkdocs.yml**
   ```yaml
   nav:
     - Categoría:
       - Mi Documento: nuevo-documento.md
   ```

4. **Commit**
   ```bash
   git add docs/nuevo-documento.md mkdocs.yml
   git commit -m "docs: agregar nuevo-documento.md"
   git push origin docs/nuevo-documento
   ```

5. **Pull Request**
   - Ir a GitHub
   - Crear PR con descripción
   - Esperar aprobación

### Tipo 2: Editar Documento Existente

**Cuándo**:
- Información desactualizada
- Errores tipográficos
- Mejorar claridad
- Agregar ejemplos

**Pasos**:

1. **Editar archivo**
   ```bash
   vim docs/documento-existente.md
   ```

2. **Actualizar fecha**
   ```markdown
   **Última Actualización**: Enero 28, 2024
   ```

3. **Test local** (opcional)
   ```bash
   mkdocs serve
   # Verificar en http://localhost:8000
   ```

4. **Commit**
   ```bash
   git add docs/documento-existente.md
   git commit -m "docs: actualizar documento-existente"
   git push origin docs/documento-existente
   ```

5. **Pull Request**

### Tipo 3: Correcciones Menores

**Cuándo**:
- Typos
- Links rotos
- Formateo

**Pasos**:

1. **Editar directamente en GitHub** (para cambios muy pequeños)
   - O seguir Tipo 2

2. **Commit conciso**
   ```bash
   git commit -m "docs: fix typo en documento-x"
   ```

---

## 4. Estándares de Escritura

### Formato Markdown

```markdown
# Título H1 (Una por documento)

## Título H2 (Inicio de sección)

### Título H3 (Subsección)

Párrafo normal.

**Negrita** para énfasis.
*Itálica* para énfasis suave.
`código` para mencionar código.

### Listas

- Elemento 1
- Elemento 2
  - Subelemento 2.1
  - Subelemento 2.2

1. Primer paso
2. Segundo paso
3. Tercer paso

### Tablas

| Columna 1 | Columna 2 | Columna 3 |
|-----------|-----------|-----------|
| Dato 1    | Dato 2    | Dato 3    |

### Bloques de Código

\`\`\`javascript
function hello() {
  console.log("Hello");
}
\`\`\`

### Blockquotes

> Esta es una cita
> En varias líneas

### Links

[Texto del link](url)
[Link interno](../documento.md)
```

### Convenciones

1. **Una línea en blanco** entre secciones
2. **Dos espacios** antes de salto de línea (Markdown)
3. **Comillas dobles** en ejemplos de código
4. **URLs relativas** para links internos

### Tono

- Profesional pero accesible
- Directo y conciso
- Evitar jerga innecesaria
- Incluir ejemplos cuando sea posible

## 5. Checklist Antes de Commit

```
Content
──────────────────────
☐ Contenido es correcto
☐ Ortografía revisada
☐ Links funcionan
☐ Ejemplos son válidos
☐ Fechas actualizadas

Format
──────────────────────
☐ Markdown es válido
☐ Formato consistente
☐ Indentación correcta
☐ Tablas están alineadas

Structure
──────────────────────
☐ Título claro
☐ Introducción presente
☐ Secciones lógicas
☐ Conclusión/contactos
```

## 6. Procesos Específicos

### Actualizar Setup-guia.md

1. Verificar cambios en mkdocs
2. Probar localmente
3. Actualizar instrucciones
4. Agregar ejemplos si es necesario

### Actualizar Procesos de Desarrollo

1. Coordinar con Tech Lead
2. Obtener feedback del equipo
3. Documentar cambios
4. Comunicar al equipo

### Actualizar Políticas

1. Coordinar con RRHH
2. Obtener aprobación ejecutiva
3. Actualizar fecha
4. Comunicar a la empresa

## 7. Pruebas Locales

### Instalar Dependencias

```bash
pip install -r requirements.txt
```

### Ejecutar Servidor Local

```bash
mkdocs serve
```

### Validar Cambios

```bash
# Abrir en navegador
http://localhost:8000

# Verificar:
# - Formato correcto
# - Links funcionan
# - Búsqueda funciona
# - Tema se ve bien
```

### Build Final

```bash
mkdocs build --clean
# Verifica que no hay errores
```

## 8. Proceso de Review

### Como Autor

1. Crear PR descriptivo
   ```
   # Descripción
   Agregar sección X a documento Y
   
   # Cambios
   - Cambio 1
   - Cambio 2
   
   # Testing
   - Verificado localmente
   - Sin errores de build
   ```

2. Responder comentarios
3. Hacer ajustes sugeridos
4. Esperar aprobación

### Como Reviewer

1. Leer contenido completo
2. Verificar formateo
3. Comprobar links
4. Sugerir mejoras
5. Aprobar o pedir cambios

**Criterios de Aprobación**:
- Contenido es correcto
- Formato es consistente
- Sin errores tipográficos
- Sigue estándares

## 9. Merge y Publicación

### Merge

```bash
# En GitHub UI, click "Merge pull request"
# O en terminal:
git checkout main
git merge docs/mi-rama
git push origin main
```

### Publicación

El sitio se actualiza automáticamente (CI/CD).

### Notificar

```
📢 Wiki Actualizada

Documento: [Nombre]
Cambios: [Descripción corta]
Link: [URL]

cc: @team #documentation
```

## 10. Gestión de Cambios Grandes

### Para Cambios Substanciales

1. **Crear Issue primero**
   - Describir cambio propuesto
   - Pedir feedback
   - Obtener consenso

2. **Draft PR**
   - Marcar como draft
   - Solicitar feedback temprano
   - Iterar

3. **Finalizar PR**
   - Marcar como listo
   - Pedir aprobaciones finales
   - Merge

4. **Comunicar**
   - Anunciar cambio importante
   - Pedir feedback después

## 11. FAQ de Contribución

**P: ¿Puedo editar directamente main?**  
R: No, siempre usar rama y PR.

**P: ¿Quién aprueba los cambios?**  
R: Propietario del documento + Tech Lead.

**P: ¿Qué pasa si mi PR es rechazado?**  
R: Revisor explica por qué. Puedes iterar.

**P: ¿Cuánto tiempo toma un review?**  
R: 24-48 horas típicamente.

**P: ¿Puedo agregar nuevo documento sin permiso?**  
R: Crea issue primero, obtén consenso.

**P: ¿Cómo sugiero cambios grandes?**  
R: Abre issue, discute con stakeholders.

## 12. Recursos

### Herramientas

- **Editor**: VS Code + Markdown Preview
- **Git**: Gitflow o simple branches
- **Servidor Local**: mkdocs serve

### Documentación

- [Markdown Guide](https://www.markdownguide.org/)
- [MkDocs Docs](https://www.mkdocs.org/)
- [Material Theme Docs](https://squidfunk.github.io/mkdocs-material/)

### Contactos

- **Wiki Admin**: wiki@sicarx.com
- **Slack**: #documentation
- **GitHub Issues**: Repository

---

## Gracias por Contribuir!

Tu participación hace la documentación mejor para todos.

**Última Actualización**: Enero 28, 2024
