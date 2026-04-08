# Estructura de Pruebas

## 1. Definición de la Estructura para las Clases de PRUEBAS

Siguiendo estándares ISTQB y mejores prácticas Java, las pruebas se organizan por módulos y siguen convenciones de nomenclatura claras.

### Tests Module Folder 
(ej: Sales Tests, Ecommerce Tests, Etc)

- **Requerimiento Nomenclatura** (Req001, Req002, Etc) - Vinculación con requisitos funcionales.
- **Prueba Nomenclatura** (TC01ThisIsAnExample, TC02ThisIsAnExampleToo) - Identificación única.

### Estructura de Clase de Prueba

```java
@Test
@DisplayName("ID caso de prueba - Nombre caso de prueba")
@HappyPaths  // Definidos en enums para categorización
void testNameHere() { 
    // Given: Preparación del escenario
    // When: Ejecución de la acción
    // Then: Verificación del resultado
    
    // Ejemplo:
    loginPage.navigateToLogin();
    loginPage.enterCredentials(username, password);
    dashboardPage.verifyUserLoggedIn();
}
```

### Buenas Prácticas Java en Ágil
- **Herencia**: Extender `baseTest.java` para setup/teardown común.
- **Anotaciones**: Usar JUnit 5 (@Test, @BeforeEach, @AfterEach).
- **Assertions**: Emplear AssertJ o Hamcrest para verificaciones legibles.
- **Data Providers**: Para testing parametrizado.
- **Reporting**: Integrar con Allure o ExtentReports para dashboards.(No necesario)

### Flujo de Trabajo en Equipos Ágiles
1. **Planning**: Definir casos de prueba en backlog.
2. **Development**: Escribir tests en paralelo con código (TDD).
3. **Execution**: Ejecutar en CI/CD pipelines.
4. **Reporting**: Generar reportes para retrospectives.
5. **Maintenance**: Actualizar tests según cambios en requisitos.

Esta estructura asegura un flujo correcto de testing automatizado, alineado con ISTQB y optimizado para equipos ágiles.

---

## 2. Definición de Capas

### 🧪 Tests (Ejecución)

Donde viven los `@Test`.

- Deben ser legibles y seguir el patrón AAA (Arrange, Act, Assert).
- No deben contener lógica compleja de programación (bucles complejos, conexiones HTTP directas), deben delegar eso a la capa `Domain`.

---

**Siguiente:** Lee [Mejores prácticas](mejores-practicas.md) para convenciones de código.
