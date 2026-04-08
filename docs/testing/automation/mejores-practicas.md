# Mejores Prácticas y Convenciones de Código

## 1. Buenas Prácticas y Convenciones de Código (Java 21, ISTQB & Agile)

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

## 2. Flujo de Trabajo con Git (Branching Strategy)

Nuestro flujo de control de versiones está diseñado para proteger el código de producción y permitir la integración continua en entornos de prueba, asegurando que `master` siempre refleje lo que está vivo en el entorno real.

### Reglas del Flujo

1. **Origen Único:** **TODA** nueva rama (feature, bugfix, hotfix) debe ser creada obligatoriamente a partir de la rama `master`.
2. **Entorno de Integración (`development`):** La rama `development` es un entorno efímero y de pruebas donde conviven todas las features actuales del equipo.
3. **Integración a Producción (`master`):** Una rama solo se integra a `master` cuando el feature o fix **ya está desplegado y validado en Producción**.

### Ciclo de Vida de una Rama

**Creación de rama**: El QA la crea desde `master`:

- `git checkout master`
- `git pull`
- `git checkout -b feature/QA-123-automatizar-login`

**Desarrollo → Integración temprana**:

- Commits con **trazabilidad** incluyendo el ID de la task (ej. `QA-123: automatizar login`).
- Para probar con el equipo → **Pull Request hacia `development`**.

**Pase a producción** (si aplica):

- Una vez que dev sube el feature a prod y QA valida.
- **Pull Request de la rama original → `master`**.
- *Nota*: Nunca se hace merge directo de `development` a `master` (puede tener features incompletos).
- La rama debe ser eliminada despues de su correcta integracion a master.

**Code Review**: Todo PR (a `development` o `master`) necesita aprobación por al menos un miembro del equipo y pasar los tests en jenkins CI en verde.

---

## 3. Gestión de Dependencias (Gradle)

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

---

**Volver:** [Automatización](index.md)
