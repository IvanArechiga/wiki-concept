# 📘 Guía de Estandarización para Repositorios de QA Automation

Este documento define la estructura oficial de directorios, patrones de diseño y flujo de trabajo para los proyectos de automatización de pruebas del equipo, siguiendo lineamientos del ISTQB (International Software Testing Qualifications Board) y mejores prácticas de Java en entornos ágiles.

---

## 1. Arquitectura del Proyecto

Utilizamos una arquitectura orientada al dominio separando la infraestructura (Core) de la lógica (Domain) y las ejecuciones (Tests). Esta estructura se alinea con los principios de ISTQB para testing sistemático y las prácticas ágiles de desarrollo iterativo y colaborativo.

### Principios Fundamentales (ISTQB)
- **Separación de responsabilidades**: Infraestructura vs. lógica de negocio vs. pruebas.
- **Mantenibilidad**: Estructura modular facilita actualizaciones y debugging.
- **Reutilización**: Componentes compartidos reducen duplicación de código.
- **Escalabilidad**: Soporta crecimiento del proyecto en equipos ágiles.

### 📂 Estructura de Directorios

```
src/test/java
├── Tecnología (Playwright, Selenium, etc)  # Framework base (Selenium, Playwright, Appium)
├── setup (Configuración para levantar el framework de automatización)
│   ├── RequestInitializer.java (Clase servicios Backend)  # Inicialización de APIs REST
│   └── driver (Folder de configuración de driver)
│       ├── DriverFactory.java / UISetup.java → Inicializa el drive, Define la configuración de Playwright.
│       ├── Driver Manager → Se encarga de manejar la única instancia del driver y eliminarla al final. (Patrón Singleton)
│       └── Config Manager → Cargar capabilities desde Config.properties (Centralización de configuración)
├── pages (Page Object Model - POM)
│   ├── PageFactory.java (Lazy Initializer) → Clase que inicializa las Pages. (Optimización de memoria)
│   ├── BasePage.java → Interacciones generales (Clic, Scroll, etc). (Base para herencia)
│   ├── salesPages  # Páginas específicas por módulo
│   ├── quotationPages
│   ├── ecommercePages
│   ├── ... (Entre otros)
│   ├── commons → Elementos Genéricos. (Carpeta; es una colección de pages)
│   └── components  # Componentes reutilizables (headers, footers, etc.)
├── utils (Utilidades y helpers)
│   ├── DefaultTemplates.java → Templates para creación de datos (Data-Driven Testing)
│   └── annotationsTags → Carpeta para definición de Tags de ejecución
│       ├── Happy Path  # Casos positivos
│       ├── Components  # Testing de componentes
│       ├── Defect      # Regression testing
│       └── ... (Entre otros)
├── helpers (Clases de soporte)
│   └── enums (Folder para definir Enums generales)
│       ├── PlatformType.java → Enum para definición de Platform (Android, iOS, Web)
│       └── SessionEnum.java → Enum para definición de Session (Shared, Isolated)
├── locators (Folder de retrocompatibilidad para Android y iOS, única fuente de verdad para identificar elementos)
│       ├── salesLocators
│       ├── quotationLocators
│       ├── ecommerceLocators
│       └── ... (Entre otros)
├── flows (Flujos de negocio)  # Secuencia de pasos prerrequisitos (Setup flows)
└── tests (Folder principal para definición de pruebas automatizadas)
    ├── baseTest.java → Singleton, una única instancia si así se requiere. (Base class para tests)
    ├── salesTests     # Tests por módulo
    ├── quotationTests
    ├── ecommerceTests
    └── ... (Entre otros)

src/test/resources
├── artefacts (carpeta de ejecutables y paquetes de instaladores)
│   ├── sicarx.apk    # APK para Android
│   ├── sicarx.exe    # Ejecutable Windows
│   └── sicarx.app    # App macOS
├── config.properties  # Configuraciones (URLs, timeouts, etc.)

/
├── environment.json   # Configuración de entornos (dev, qa, prod)
└── readme.md          # Documentación específica del proyecto
```

### Beneficios en Equipos Ágiles
- **Colaboración**: Estructura clara facilita pair programming y code reviews.
- **CI/CD**: Integración fácil con pipelines de Jenkins/GitHub Actions.
- **TDD/BDD**: Soporta desarrollo guiado por pruebas.
- **Sprint Planning**: Facilita estimación y planificación de testing tasks.

---

## 2. Definición de la Estructura para las Clases de PRUEBAS

Siguiendo estándares ISTQB y mejores prácticas Java, las pruebas se organizan por módulos y siguen convenciones de nomenclatura claras.

### Tests Module Folder (e.g Sales Tests, Ecommerce Tests, Etc).
- **Requerimiento Nomenclatura** (Req001, Req002, Etc). - Vinculación con requisitos funcionales.
- **Prueba Nomenclatura** (TC01ThisIsAnExample, TC02ThisIsAnExampleToo). - Identificación única.

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

## 3. Definición de Capas

### 🧪 Tests (Ejecución)

Donde viven los `@Test`.

- Deben ser legibles y seguir el patrón AAA (Arrange, Act, Assert).
- No deben contener lógica compleja de programación (bucles complejos, conexiones HTTP directas), deben delegar eso a la capa `Domain`.

---

## 4. Buenas Prácticas y Convenciones de Código (Java 21, ISTQB & Agile)

Para asegurar la calidad del código de automatización, adoptamos un enfoque basado en los fundamentos de ISTQB y los principios de código limpio en Java 21.

### Convenciones de Nomenclatura

* **Clases:** `PascalCase` (ej. `UserProfileTest`, `DriverFactory`).
* **Métodos:** `camelCase`, deben ser verbos de acción (ej. `validateUserCreation`, `clickLoginButton`).
* **Variables:** `camelCase` (ej. `userToken`, `fiscalFolio`).
* **Constantes:** `UPPER_SNAKE_CASE` (ej. `MAX_WAIT_TIME_SECONDS`).
* **Trazabilidad (ISTQB):** Los métodos de prueba deben incluir el ID del requerimiento o caso de prueba en el `@DisplayName` o nombre del método (ej. `TC01_ValidarLoginExitoso`).

### Estándares de Java 21

1. **Uso de Records:** Utilizar `record` en lugar de clases tradicionales o Lombok para los DTOs (Data Transfer Objects) y proveedores de datos. Son inmutables y reducen el boilerplate nativamente.
2. **Text Blocks:** Usar bloques de texto (`"""..."""`) para payloads JSON, consultas SQL o mensajes largos, mejorando la legibilidad.
3. **Pattern Matching y Switch Expressions:** Usar el nuevo `switch` que retorna valores directamente y el pattern matching para simplificar la lógica condicional en la capa de `utils`.
4. **Inferencia de Tipos (`var`):** Usar `var` solo cuando el tipo de dato devuelto sea obvio por el contexto (ej. `var user = new UserRecord();`), evitando oscurecer la legibilidad.

### Principios Ágiles e ISTQB aplicados al Código

1. **Paradoja del Pesticida (ISTQB):** Los datos estáticos hacen que las pruebas pierdan efectividad. Usar librerías como *Faker* en la capa `utils` para generar datos dinámicos en cada ejecución.
2. **Independencia de Pruebas:** Cada prueba debe ser 100% independiente. No depender del estado dejado por una prueba anterior. Usar `@BeforeEach` y `@AfterEach` (o las funcionalidades de `baseTest`) para preparar y limpiar los datos (Data Teardown).
3. **Principio KISS y DRY (Agile):** Evitar la duplicación de código. Si una secuencia de pasos se repite en 3 tests, debe convertirse en un método.
4. **Esperas (Waits):** **Cero tolerancia a `Thread.sleep()`**. Utilizar siempre esperas explícitas (Explicit Waits), fluidas (Fluent Waits) gestionadas en la capa `setup` o reintentos.
5. **Asserts Descriptivos:** Todas las aserciones deben tener un mensaje de error claro que explique qué falló desde la perspectiva del negocio.
   * ❌ `assertTrue(total > 0);`
   * ✅ `assertTrue(total > 0, "El total de la cotización debe ser mayor a 0 al agregar un producto.");`

---

## 5. Flujo de Trabajo con Git (Branching Strategy)

Nuestro flujo de control de versiones está diseñado para proteger el código de producción y permitir la integración continua en entornos de prueba, asegurando que `master` siempre refleje lo que está vivo en el entorno real.

### Reglas del Flujo

1. **Origen Único:** **TODA** nueva rama (feature, bugfix, hotfix) debe ser creada obligatoriamente a partir de la rama `master`.
2. **Entorno de Integración (`development`):** La rama `development` es un entorno efímero y de pruebas donde conviven todas las features actuales del equipo.
3. **Integración a Producción (`master`):** Una rama solo se integra a `master` cuando el feature o fix **ya está desplegado y validado en Producción**.

### Ciclo de Vida de una Rama

1. **Creación:** El QA crea su rama desde `master`:
   * `git checkout master`
   * `git pull`
   * `git checkout -b feature/QA-123-automatizar-login`
2. **Desarrollo e Integración Temprana:**
   * Se realizan commits atómicos usando *Conventional Commits* (`feat: ...`, `fix: ...`, `test: ...`).
   * Para probar el código junto con el resto del equipo, se crea un **Pull Request hacia `development`**.
3. **Pase a Producción:**
   * Una vez que el equipo de desarrollo sube el requerimiento a Producción y QA valida que todo está correcto.
   * Se crea un **Pull Request de la rama original (`feature/QA-123...`) hacia `master`**.
   * *Nota:* Nunca se hace merge de `development` hacia `master`, ya que `development` podría contener código de otros features incompletos.
4. **Code Review:** Todo PR hacia `development` o `master` debe ser revisado y aprobado por al menos un miembro del equipo y pasar los pipelines de CI en verde.

---

## 6. Gestión de Dependencias (Gradle)

Utilizamos **Gradle (versión 8.11 o superior)** para la gestión de dependencias y tareas de construcción (`build.gradle`).

### Buenas Prácticas en Gradle

* **Version Catalog / Variables:** Centralizar las versiones de las librerías en variables dentro del `build.gradle` para facilitar las actualizaciones.
* **Evitar versiones dinámicas:** Nunca usar `+` o `LATEST` en las versiones de las dependencias en produccion. Esto rompe la reproducibilidad de las pruebas.
* **Agrupación lógica:** Mantener el bloque `dependencies` ordenado por propósito:

  ```gradle
  dependencies {
      // Framework Core
      testImplementation 'org.seleniumhq.selenium:selenium-java:4.x.x'
  
      // Testing Engine & Assertions
      testImplementation 'org.junit.jupiter:junit-jupiter-api:5.x.x'
      testRuntimeOnly 'org.junit.jupiter:junit-jupiter-engine'
      testImplementation 'org.assertj:assertj-core:3.x.x'
  
      // Utilities
      testImplementation 'com.github.javafaker:javafaker:1.x.x'
      testImplementation 'com.fasterxml.jackson.core:jackson-databind:2.x.x'
  }
  ```

* **Tareas Personalizadas:** Configurar tareas en Gradle para ejecutar suites específicas basándose en los Tags (ej. `./gradlew test -Dgroups=HappyPaths`).

