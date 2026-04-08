# Guía de Contribución a la Documentación de Testing

## Introducción

¡Gracias por contribuir a la Documentación de Testing! Esta guía explica cómo agregar, modificar o mejorar la documentación de testing y automatización de manera efectiva.

## 1. Antes de Empezar

### Requisitos Previos
- Git instalado y configurado
- Acceso de escritura al repositorio
- Python 3.8+ (para pruebas locales)
- Editor de texto (VS Code recomendado con extensiones de Markdown)

### Clonar el Repositorio
```bash
git clone https://github.com/IvanArechiga/wiki-concept.git
cd wiki-concept
```

## 2. Flujo de Trabajo

### Crear una Rama
Siempre crea una rama específica para tus cambios:
```bash
git checkout -b feature/nombre-del-cambio
# o
git checkout -b fix/correccion-pequena
```

### Hacer Cambios
- Edita los archivos en `docs/`
- Usa Markdown para el contenido
- Sigue los estándares de escritura (ver sección 4)

### Probar Localmente
```bash
# Instalar dependencias si es necesario
pip install -r requirements.txt

# Ejecutar servidor local
mkdocs serve

# Verificar en http://localhost:8000
```

### Commit y Push
```bash
git add .
git commit -m "docs: descripción clara del cambio"
git push origin nombre-de-tu-rama
```

### Crear Pull Request
1. Ve a GitHub y crea un PR desde tu rama
2. Describe los cambios en detalle
3. Solicita revisión
4. Espera aprobación y merge

## 3. Tipos de Contribuciones

### Agregar Nueva Documentación
**Cuándo**: Nuevos procesos de testing, guías técnicas, o expansiones de la documentación existente.

**Pasos**:
1. Crea el archivo en la ubicación apropiada (ej. `docs/testing/nueva-guia.md`)
2. Escribe el contenido siguiendo la estructura estándar
3. Actualiza `mkdocs.yml` para incluir el nuevo documento en la navegación
4. Prueba localmente
5. Commit y PR

### Modificar Documentación Existente
**Cuándo**: Actualizaciones, correcciones, mejoras de claridad.

**Pasos**:
1. Edita el archivo relevante
2. Actualiza la fecha de "Última Actualización" si aplica
3. Verifica enlaces y formato
4. Prueba localmente
5. Commit con mensaje descriptivo (ej. "docs: actualizar guía de automatización con nuevos estándares")

### Correcciones Menores
**Cuándo**: Typos, enlaces rotos, formateo.

**Pasos**:
1. Edita directamente
2. Commit conciso (ej. "docs: fix typo en automation.md")
3. Push y PR (o merge directo si es trivial)

## 4. Estándares de Escritura

### Estructura de Documentos
- **Título**: Claro y descriptivo
- **Introducción**: Resumen breve
- **Secciones**: Organizadas lógicamente
- **Ejemplos**: Código o casos prácticos cuando aplique
- **Conclusión/Contactos**: Si es necesario

### Formato Markdown
- Usa encabezados jerárquicos (# ## ###)
- Listas para pasos o elementos
- Bloques de código con sintaxis correcta
- Enlaces internos relativos

### Convenciones
- Lenguaje claro y conciso
- Evitar jerga técnica sin explicar
- Actualizar fechas de modificación
- Mantener consistencia con documentos existentes

## 5. Soporte

Si tienes dudas:
- Revisa issues existentes en GitHub
- Crea un issue para preguntas
- Contacta al equipo de mantenimiento

¡Gracias por mejorar la documentación de testing!

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

### Actualizar index.md

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

1. Coordinar con Direccion
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

- **Wiki Admin**: ivan@sicar.mx
- **GitHub Issues**: [Repository](https://github.com/IvanArechiga/wiki-concept/issues)

---

## Gracias por Contribuir!

Tu participación hace la documentación mejor para todos.

**Última Actualización**: Marzo 09, 2026
