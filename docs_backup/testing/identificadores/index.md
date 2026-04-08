# 🏷️ Identificadores para Automatización

Estándares de nombres para los identificadores de elementos en pruebas automatizadas.

## Documentos

- **[Estándares de nombres](estandares-nombres.md)** — Convenciones generales
- **[Identificadores Web](web.md)** — Específico para aplicaciones web
- **[Identificadores Móvil](movil.md)** — Específico para apps móviles

## Inicio Rápido

### Regla General

- **Web**: Usa atributo `data-testid`
- **Móvil**: Usa atributo `id`

### Formato de Nombres

```
[PREFIJO]_[descripcion]

Ejemplos:
- btn_iniciarSesion   (botón)
- txt_usuario          (campo de texto)
- cmb_pais             (combo box)
- chk_recordarme       (checkbox)
```

## Solicitar Identificadores

Los testers deben solicitar a los desarrolladores que agreguen los identificadores al código, siguiendo estos estándares.

**Referencia:** [Google Sheet de ejemplos](https://docs.google.com/spreadsheets/d/1f0Mo_bEZ4Y9pPuRveUCs6kuSmSOOjXYElXx-0hcowW0/edit?gid=0#gid=0)

---

**Siguiente:** Lee [Estándares de nombres](estandares-nombres.md) para todos los tipos de elementos.
