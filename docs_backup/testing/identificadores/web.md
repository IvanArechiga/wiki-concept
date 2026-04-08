# Identificadores para Aplicaciones Web

Especificaciones para UI test automation en web.

## Regla Principal

Usa el atributo **`data-testid`** en tus elementos HTML.

## Ejemplo

```html
<!-- Campo de texto -->
<input 
    type="text" 
    data-testid="txt_usuario" 
    placeholder="Usuario"
/>

<!-- Botón -->
<button data-testid="btn_iniciarSesion">
    Iniciar Sesión
</button>

<!-- Desplegable -->
<select data-testid="cmb_pais">
    <option>Seleccionar país...</option>
    <option>Colombia</option>
    <option>México</option>
</select>
```

## En tu Prueba

```java
@Test
void testLoginWeb() {
    // Acceder al campo de usuario
    WebElement campoUsuario = driver.findElement(
        By.cssSelector("[data-testid='txt_usuario']")
    );
    campoUsuario.sendKeys("juan@ejemplo.com");
    
    // Clic en botón
    WebElement btnLogin = driver.findElement(
        By.cssSelector("[data-testid='btn_iniciarSesion']")
    );
    btnLogin.click();
}
```

## Solicitar a Desarrolladores

Asegúrate que todos los elementos interactuables tengan `data-testid` siguiendo los [estándares de nombres](estandares-nombres.md).

---

**Volver**: [Identificadores](index.md)
