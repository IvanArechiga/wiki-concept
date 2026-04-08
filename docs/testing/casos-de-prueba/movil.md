# Casos de Prueba para Móvil

Especificaciones para casos de prueba en aplicaciones móviles (Android e iOS).

## Estructura Base

```
ID: TC[Número]
Plataforma: Android / iOS / Ambas
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

## Ejemplo: Login Móvil

```
ID: TC01
Plataforma: Android e iOS
Requerimiento: Req001 - Autenticación Móvil
Descripción: Usuario inicia sesión en la app móvil

Pre-requisitos:
- App instalada
- Usuario "juan@ejemplo.com" registrado
- Usuario no está logueado

Pasos:
1. Abrir la aplicación
2. Esperar que aparezca la pantalla de login
3. Tocar el campo txt_usuario
4. Escribir "juan@ejemplo.com"
5. Tocar el campo txt_password
6. Escribir "password123"
7. Tocar btn_iniciarSesion

Resultado Esperado:
- Se cierra el teclado
- Se ve indicador de carga brevemente
- Se redirige al home de la aplicación
- Se muestra el nombre del usuario en la esquina superior
```

## Ejemplo: Crear Cotización Móvil

```
ID: TC10
Plataforma: Android e iOS
Requerimiento: Req003 - Cotizaciones
Descripción: Usuario crea una nueva cotización desde la app

Pre-requisitos:
- Usuario logueado
- Estar en la pantalla de inicio

Pasos:
1. Tocar btn_nuevaCotizacion (icono de "más" en la esquina)
2. Esperar que abra el formulario
3. Tocar cmb_cliente y seleccionar "Empresa XYZ"
4. Tocar btn_agregarProducto
5. Seleccionar un producto de la lista lst_productos
6. Ingresar cantidad en txt_cantidad = "5"
7. Tocar btn_agregarProducto nuevamente
8. Repetir pasos 5-7 para un segundo producto
9. Deslizar hacia abajo (scroll)
10. Tocar btn_guardar

Resultado Esperado:
- Se cierra el formulario
- Aparece notificación "Cotización guardada"
- La nueva cotización aparece en lst_cotizaciones
- Se puede compartir la cotización
```

## Diferencias Android vs iOS

| Elemento | Android | iOS |
|----------|---------|-----|
| Selector | ID | accessibilityIdentifier |
| Scroll | Swipe abajo | Swipe abajo |
| Botón atrás | Sistema | Botón en app |
| Teclado | Puede ocultarse | Manual o automático |

## Buenas Prácticas

✅ Especificar plataforma o "Ambas"  
✅ Considerar orientación de pantalla  
✅ Mencionar gestos específicos (tocar, deslizar, etc)  
✅ Indicar tiempos de carga cuando sea relevante  
✅ Usar formato [nombre identificador] para elementos  

---

**Volver**: [Casos de Prueba](index.md)
