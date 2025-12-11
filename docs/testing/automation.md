`# 📘 Guía de Estandarización para Repositorios de QA Automation

Este documento define la estructura oficial de directorios, patrones de diseño y flujo de trabajo para los proyectos de automatización de pruebas del equipo.

---

## 1. Arquitectura del Proyecto

Utilizamos una arquitectura ****orientada al dominio**** separando la infraestructura (Core) de la lógica (Domain) y las ejecuciones (Tests).

### 📂 Estructura de Directorios

```
sxt-cash-register/
├── .github/                 # Configuración de CI/CD (Actions, Workflows)
├── src/
│   ├── main/
│   │   ├── java/com/sicarx/automation/
│   │   │   ├── core/           # ⚙️ MOTOR DEL FRAMEWORK
│   │   │   │   ├── client/     # Clientes HTTP base (RestTemplates, WebClients)
│   │   │   │   ├── config/     # Configuración de entornos (Dev, QA, Prod)
│   │   │   │   ├── drivers/    # Drivers (Selenium, Appium, Playwright - si aplica)
│   │   │   │   └── utils/      # Utilidades (Fechas, Randoms, ExcelParsers)
│   │   │   │
│   │   │   └── domain/         # 🏢 LÓGICA (Por Módulo)
│   │   │       ├── users/
│   │   │       │   ├── model/    # POJOs/DTOs (Request/Response objects)
│   │   │       │   └── service/  # Lógica de llamadas a API o interacciones UI
│   │   │       ├── reports/
│   │   │       │   ├── model/
│   │   │       │   └── service/
│   │   │       └── ...
│   │   │
│   │   └── resources/          # Archivos de configuración (application.properties, log4j)
│   │
│   └── test/
│       ├── java/com/sicarx/automation/tests/
│       │   ├── users/          # Tests específicos de Usuarios
│       │   ├── reports/        # Tests específicos de Reportes
│       │   └── e2e/            # Flujos completos (End-to-End)
│       │
│       └── resources/
│           └── test-data/      # Archivos estáticos para pruebas (JSONs, .xlsx, .csv)
│
├── .gitignore               # Archivos ignorados por Git
├── README.md                # Documentación del proyecto específico
└── pom.xml / build.gradle   # Gestión de dependencias`

*https://github.com/Tahanima/selenium-java-test-automation-architecture/tree/main

*https://github.com/willysalazar/selenium-webdriver-java-example/tree/master/src

*https://github.com/serenity-bdd/serenity-rest-starter

*https://github.com/selenide-examples/google

//Documentations

*https://github.com/xashathebest/closevia/blob/main/Documentations/ADMIN_DASHBOARD_COMPLETE_GUIDE.md

*https://github.com/processing/processing-library-template

---

## 2. Definición de Capas

### ⚙️ Core (Infraestructura)

Código que **NO** tiene lógica de negocio.

- **Client:** Configuración de `RestTemplate`, inyección de Headers, Auth Tokens.
- **Utils:** Lectores de Excel (`Poiji`), conversores de JSON, generadores de datos falsos (`Faker`, `Templates`).
- **Config:** Variables de ambiente (URL base, credenciales).

### 🏢 Domain (Negocio)

Representación de la aplicación bajo prueba.

- **Model:** Clases POJO simples. Se recomienda usar Lombok (`@Data`, `@Builder`) para reducir el boilerplate.
- **Service/Actions:** Métodos que ejecutan la acción. Ejemplo: `UserService.createUser(UserDto user)`. **Aquí no se hacen aserciones (asserts), solo se retorna data.**

### 🧪 Tests (Ejecución)

Donde viven los `@Test`.

- Deben ser legibles y seguir el patrón AAA (Arrange, Act, Assert).
- No deben contener lógica compleja de programación (bucles complejos, conexiones HTTP directas), deben delegar eso a la capa `Domain`.

---

## 3. Convenciones de Código

### Naming Conventions (Java)

- **Clases:** `PascalCase` (ej. `UserProfileTest`, `ExcelReader`).
- **Métodos:** `camelCase` (ej. `validateUserCreation`, `getReportBytes`).
- **Variables:** `camelCase` (ej. `userToken`, `fiscalFolio`).
- **Constantes:** `UPPER_SNAKE_CASE` (ej. `MAX_RETRY_COUNT`, `BASE_URL`).

### Buenas Prácticas

1. **No Hardcoding:** Nunca escribir URLs, contraseñas o rutas absolutas en el código. Usar archivos de propiedades o variables de entorno.
2. **Asserts Claros:** Usar mensajes de error en las aserciones.
    - ❌ `assertTrue(total > 0);`
    - ✅ `assertTrue(total > 0, "El total del reporte debe ser mayor a 0");`
3. **Independencia:** Cada test debe ser independiente. Si un test falla, no debe afectar a los siguientes (evitar estados compartidos estáticos mutables).
4. **Limpieza:** Utilizar bloques `@AfterEach` para limpiar datos generados si es necesario.

---

## 4. Flujo de trabajo con Git

Para mantener el repositorio sano, seguimos el flujo de **Feature Branching**:

1. **Rama `main` / `master`:** Contiene solo código estable y funcional.
2. **Ramas de Feature:** Se crean a partir de `master` para cada tarea.
    - Formato: `feature/JIRA-123-descripcion-corta` o `fix/JIRA-456-bug-reportes`.
3. **Commits:** Deben ser atómicos y descriptivos (Se recomienda *Conventional Commits*).
    - `feat: agrega soporte para lectura de xlsx`
    - `fix: corrige error de timeout en login`
    - `test: añade validación de totales en nota de crédito`
4. **Pull Requests (PR):**
    - Nadie hace push directo a `main`.
    - Todo código debe pasar por un PR y ser revisado por al menos un compañero.
    - El pipeline de pruebas debe estar en verde antes de aprobar.

---

## 5. Gestión de Dependencias

Mantener el `pom.xml` o `build.gradle` limpio.

- Agrupar dependencias por tipo (Testing, Utilities, Reporting).
- Usar versiones estables, evitar `LATEST` o `SNAPSHOT` en producción.
- Bibliotecas estándar recomendadas:
    - *Test Runner:* JUnit 5 / TestNG
    - *Asserts:* AssertJ (Fluent Assertions)
    - *HTTP:* RestTemplate / RestAssured
    - *Utils:* Lombok, Jackson, Poiji (Excel)