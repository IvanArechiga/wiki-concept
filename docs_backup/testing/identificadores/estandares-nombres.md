# Estándares de Nombres para Identificadores

Define cómo nombrar los identificadores en tus pruebas automatizadas.

## Regla General

- **Móvil**: Usar atributo `id`
- **Web**: Usar atributo `data-testid`

Los testers solicitarán estos identificadores a los desarrolladores siguiendo los formatos establecidos en este documento.

**Referencia**: [Google Sheet de ejemplos](https://docs.google.com/spreadsheets/d/1f0Mo_bEZ4Y9pPuRveUCs6kuSmSOOjXYElXx-0hcowW0/edit?gid=0#gid=0)

---

## 1. Campo de Texto

**Descripción**: Espacios donde usuarios escriben texto

**Formato**: `txt_[descripcion]`

**Ejemplos**:
- `txt_usuario`
- `txt_email`
- `txt_busqueda`

**Propiedades**:
- Placeholder (texto de ayuda)
- Longitud máxima
- Validaciones (email, números, etc)

---

## 2. Botón

**Descripción**: Elementos clicables que ejecutan acciones

**Formato**: `btn_[descripcion]`

**Ejemplos**:
- `btn_iniciarSesion`
- `btn_cancelar`
- `btn_guardar`

**Propiedades**:
- Texto mostrado
- Estados (habilitado, deshabilitado, cargando)

---

## 3. Combo Box (Desplegable)

**Descripción**: Listas donde se selecciona una opción

**Formato**: `cmb_[descripcion]`

**Ejemplos**:
- `cmb_pais`
- `cmb_idioma`
- `cmb_tipoCuenta`

**Propiedades**:
- Opciones disponibles
- Valor por defecto

---

## 4. Checkbox

**Descripción**: Cuadros que pueden marcarse o desmarcarse

**Formato**: `chk_[descripcion]`

**Ejemplos**:
- `chk_recordarme`
- `chk_aceptarTerminos`
- `chk_notificaciones`

**Propiedades**:
- Etiqueta asociada
- Estado (marcado/desmarcado)

---

## 5. Lista

**Descripción**: Contenedor con múltiples elementos

**Formato**: `lst_[descripcion]`

**Ejemplos**:
- `lst_contactos`
- `lst_mensajes`
- `lst_productos`

**Propiedades**:
- Elementos dentro
- Scroll disponible

---

## 6. Drawer (Panel deslizable)

**Descripción**: Panel que se abre desde los lados de la pantalla

**Formato**: `drw_[descripcion]`

**Ejemplos**:
- `drw_navegacion`
- `drw_configuracion`
- `drw_menu`

**Propiedades**:
- Posición (izquierda, derecha)
- Contenido

---

## 7. Icono

**Descripción**: Gráfico pequeño que representa una acción

**Formato**: `icon_[descripcion]`

**Ejemplos**:
- `icon_busqueda`
- `icon_actualizar`
- `icon_cerrar`

**Propiedades**:
- Fuente de imagen
- Interactuable (clickeable o no)

---

## 8. Etiqueta

**Descripción**: Texto fijo que muestra información

**Formato**: `lbl_[descripcion]`

**Ejemplos**:
- `lbl_error`
- `lbl_titulo`
- `lbl_bienvenida`

**Propiedades**:
- Contenido
- Estilo (fuente, tamaño, color)

---

## 9. Texto Genérico

**Descripción**: Contenido de texto que no es interactivo

**Formato**: `txt_[descripcion]`

**Ejemplos**:
- `txt_mensajeBienvenida`
- `txt_aviso`

**Propiedades**:
- Contenido
- Estilo

---

## 10. Elemento Genérico

**Descripción**: Componentes que no encajan en otras categorías

**Formato**: `itm_[descripcion]`

**Ejemplos**:
- `itm_cajaSelector`
- `itm_cerrar`

**Propiedades**:
- Contenido variable
- Estilo variable

---

## Resumen Rápido

| Elemento | Prefijo | Ejemplo |
|----------|---------|---------|
| Campo de texto | `txt_` | `txt_usuario` |
| Botón | `btn_` | `btn_guardar` |
| Desplegable | `cmb_` | `cmb_pais` |
| Checkbox | `chk_` | `chk_recordar` |
| Lista | `lst_` | `lst_contactos` |
| Panel deslizable | `drw_` | `drw_menu` |
| Icono | `icon_` | `icon_buscar` |
| Etiqueta | `lbl_` | `lbl_error` |
| Texto | `txt_` | `txt_descripcion` |
| Genérico | `itm_` | `itm_elemento` |

---

**Siguiente**: [Identificadores Web](web.md) o [Identificadores Móvil](movil.md)
