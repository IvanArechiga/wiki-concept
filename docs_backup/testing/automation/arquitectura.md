# Arquitectura del Proyecto

Estructura oficial de directorios y patrones de diseño para proyectos de automatización de pruebas.

## Principios Fundamentales (ISTQB)
- **Separación de responsabilidades**: Infraestructura vs. lógica de negocio vs. pruebas.
- **Mantenibilidad**: Estructura modular facilita actualizaciones y debugging.
- **Reutilización**: Componentes compartidos reducen duplicación de código.
- **Escalabilidad**: Soporta crecimiento del proyecto en equipos ágiles.

## Descripción General

Utilizamos una arquitectura orientada al dominio separando la infraestructura (Core) de la lógica (Domain) y las ejecuciones (Tests). Esta estructura se alinea con los principios de ISTQB para testing sistemático y las prácticas ágiles de desarrollo iterativo y colaborativo.

## 📂 Estructura de Directorios

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

## Beneficios en Equipos Ágiles
- **Colaboración**: Estructura clara facilita pair programming y code reviews.
- **CI/CD**: Integración fácil con pipelines de Jenkins/GitHub Actions.
- **TDD/BDD**: Soporta desarrollo guiado por pruebas.
- **Sprint Planning**: Facilita estimación y planificación de testing tasks.

---

**Siguiente:** Lee [Estructura de pruebas](estructura-pruebas.md) para ver cómo escribir tus pruebas.
