# Identificadores para Aplicaciones Móviles

Especificaciones para UI test automation en Android e iOS.

## Regla Principal

Usa el atributo **`id`** en tus elementos.

## Android (XML)

```xml
<!-- Campo de texto -->
<EditText
    android:id="@+id/txt_usuario"
    android:hint="Usuario"
/>

<!-- Botón -->
<Button
    android:id="@+id/btn_iniciarSesion"
    android:text="Iniciar Sesión"
/>

<!-- Spinner (Combo Box) -->
<Spinner
    android:id="@+id/cmb_pais"
/>
```

## iOS (Swift)

```swift
// Campo de texto
TextField("Usuario", text: $usuario)
    .accessibilityIdentifier("txt_usuario")

// Botón
Button("Iniciar Sesión") { }
    .accessibilityIdentifier("btn_iniciarSesion")
```

## En tu Prueba

### Android (Appium)

```java
@Test
void testLoginAndroid() {
    // Campo de usuario
    MobileElement campoUsuario = (MobileElement) driver.findElement(
        MobileBy.id("txt_usuario")
    );
    campoUsuario.sendKeys("juan@ejemplo.com");
    
    // Botón
    MobileElement btnLogin = (MobileElement) driver.findElement(
        MobileBy.id("btn_iniciarSesion")
    );
    btnLogin.click();
}
```

### iOS (Appium)

```java
@Test
void testLoginiOS() {
    // Campo de usuario
    MobileElement campoUsuario = (MobileElement) driver.findElement(
        MobileBy.AccessibilityId("txt_usuario")
    );
    campoUsuario.sendKeys("juan@ejemplo.com");
    
    // Botón
    MobileElement btnLogin = (MobileElement) driver.findElement(
        MobileBy.AccessibilityId("btn_iniciarSesion")
    );
    btnLogin.click();
}
```

## Solicitar a Desarrolladores

Todos los elementos interactuables deben tener `id` (Android) o `accessibilityIdentifier` (iOS), siguiendo los [estándares de nombres](estandares-nombres.md).

---

**Volver**: [Identificadores](index.md)
