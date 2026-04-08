# 📋 Casos de Prueba

Definición y documentación de casos de prueba para web y móvil.

## Documentos

- **[Casos Web](web.md)** — Casos específicos para aplicaciones web
- **[Casos Móvil](movil.md)** — Casos específicos para apps móviles

## Estructura de un Caso de Prueba

| Campo | Descripción |
|-------|-------------|
| ID | Identificador único (TC01, TC02, etc) |
| Requerimiento | Ligado al requerimiento (Req001) |
| Descripción | Qué se va a probar |
| Pre-requisitos | Setup necesario |
| Pasos | Acciones paso a paso |
| Resultado Esperado | Qué debe suceder |

## Ejemplo

```
ID: TC01
Requerimiento: Req001 - Login
Descripción: Verificar que un usuario puede iniciar sesión con credenciales válidas

Pre-requisitos:
- Usuario registrado en la aplicación
- Navegador web abierto en la página de login

Pasos:
1. Ingresar usuario "juan@ejemplo.com" en campo txt_usuario
2. Ingresar contraseña "password123" en campo txt_password
3. Hacer clic en btn_iniciarSesion

Resultado Esperado:
- Usuario es redirigido al dashboard
- Se muestra el nombre del usuario en la interfaz
```

---

**Siguiente**: [Casos Web](web.md) o [Casos Móvil](movil.md)
