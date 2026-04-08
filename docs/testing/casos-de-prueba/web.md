# Casos de Prueba para Web

Especificaciones para casos de prueba en aplicaciones web.

## Estructura Base

```
ID: TC[Número]
Requerimiento: Req[Número]
Descripción: [Breve descripción del caso]

Pre-requisitos:
- Paso 1
- Paso 2

Pasos:
1. Acción 1
2. Acción 2
3. Acción 3

Resultado Esperado:
- Verificación 1
- Verificación 2
```

## Ejemplo: Login Web

```
ID: TC01
Requerimiento: Req001 - Autenticación
Descripción: Usuario inicia sesión con credenciales válidas

Pre-requisitos:
- Usuario "juan@ejemplo.com" registrado
- Contraseña: "password123"
- Navegador abierto en https://ejemplo.com/login

Pasos:
1. Esperar que cargue la página de login
2. Hacer clic en el campo txt_usuario
3. Escribir "juan@ejemplo.com"
4. Hacer clic en el campo txt_password
5. Escribir "password123"
6. Hacer clic en btn_iniciarSesion

Resultado Esperado:
- Se redirige al dashboard
- Se muestra "Bienvenido Juan" en la interfaz
- Se guarda la sesión del usuario
```

## Ejemplo: Crear Producto

```
ID: TC05
Requerimiento: Req002 - Gestión de Productos
Descripción: Admin crea un nuevo producto con datos válidos

Pre-requisitos:
- Usuario administrador logueado
- Estar en la sección de Productos

Pasos:
1. Hacer clic en btn_nuevoProducto
2. Esperar que abra el formulario
3. Llenar txt_nombreProducto con "Laptop Dell XPS"
4. Llenar txt_descripcion con "Laptop de alto rendimiento"
5. Llenar txt_precio con "1500.00"
6. Seleccionar cmb_categoria = "Electrónica"
7. Marcar chk_disponible
8. Hacer clic en btn_guardar

Resultado Esperado:
- Se cierra el formulario
- Aparece mensaje "Producto creado exitosamente"
- El nuevo producto aparece en la lista
```

## Buenas Prácticas

✅ Escribir en lenguaje simple  
✅ Un objetivo por caso  
✅ Pasos específicos y medibles  
✅ Resultados verificables  
✅ Usar formato [nombre identificador] para elementos  

---

**Volver**: [Casos de Prueba](index.md)
