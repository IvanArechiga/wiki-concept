# Arquitectura de Sistemas

## Introducción

Este documento describe la arquitectura de nuestros sistemas, componentes principales, patrones de diseño y decisiones arquitectónicas clave.

## 1. Visión General de Arquitectura

### 1.1 Diagrama General

```
┌─────────────────────────────────────────────┐
│             Cliente Frontend                │
│         (React/Angular/Vue)                 │
└────────────────┬────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────┐
│          API Gateway / Load Balancer        │
│            (Nginx/Kong/AWS ALB)             │
└────────────────┬────────────────────────────┘
                 │
          ┌──────┴──────┐
          ▼             ▼
    ┌──────────┐   ┌──────────┐
    │ Backend  │   │ Backend  │
    │  Server  │   │  Server  │
    │  (Node)  │   │  (Node)  │
    └──────┬───┘   └──────┬───┘
           │              │
           └──────┬───────┘
                  ▼
       ┌────────────────────┐
       │  Cache Layer       │
       │   (Redis)          │
       └────────┬───────────┘
                │
         ┌──────┴──────┐
         ▼             ▼
    ┌─────────┐  ┌─────────────┐
    │Database │  │Message Queue│
    │(PostgreSQL)(RabbitMQ/Kafka)
    └─────────┘  └─────────────┘
         ▲
         │
    ┌────────────────┐
    │Search Engine   │
    │ (Elasticsearch)│
    └────────────────┘
```

### 1.2 Componentes Principales

| Componente | Tecnología | Propósito |
|-----------|-----------|----------|
| **Frontend** | React 18 | Interfaz de usuario |
| **Backend** | Node.js + Express | API REST |
| **Base de Datos** | PostgreSQL | Almacenamiento persistente |
| **Cache** | Redis | Cache en memoria |
| **Queue** | RabbitMQ | Procesamiento asíncrono |
| **Search** | Elasticsearch | Búsqueda y indexación |
| **DevOps** | Docker + Kubernetes | Containerización y orquestación |

## 2. Arquitectura por Capas

### 2.1 Estructura Layered

```
┌─────────────────────────────────────┐
│      Presentation Layer             │
│      (Controllers, Routes)          │
└────────────────┬────────────────────┘
                 │
┌─────────────────────────────────────┐
│      Business Logic Layer           │
│      (Services, Rules)              │
└────────────────┬────────────────────┘
                 │
┌─────────────────────────────────────┐
│      Data Access Layer              │
│      (Repositories, ORM)            │
└────────────────┬────────────────────┘
                 │
┌─────────────────────────────────────┐
│      Database Layer                 │
│      (PostgreSQL)                   │
└─────────────────────────────────────┘
```

### 2.2 Descripción de Capas

#### Presentation Layer
- Controladores de rutas
- Validación de entrada
- Formato de respuestas HTTP
- Manejo de errores

#### Business Logic Layer
- Lógica de negocio
- Reglas de aplicación
- Cálculos y transformaciones
- Orquestación de procesos

#### Data Access Layer
- ORM (Sequelize/TypeORM)
- Queries a base de datos
- Caché de datos
- Repositorios

#### Database Layer
- PostgreSQL
- Tablas y relaciones
- Índices y optimización

## 3. Patrones de Diseño

### 3.1 Patrones Utilizados

#### Repository Pattern
```typescript
interface IUserRepository {
  findById(id: string): Promise<User>;
  findAll(): Promise<User[]>;
  create(user: User): Promise<User>;
  update(id: string, user: User): Promise<User>;
  delete(id: string): Promise<void>;
}
```

#### Service Pattern
```typescript
class UserService {
  constructor(private userRepository: IUserRepository) {}
  
  async getUser(id: string): Promise<User> {
    return this.userRepository.findById(id);
  }
}
```

#### Dependency Injection
```typescript
// Constructor Injection
class UserController {
  constructor(private userService: UserService) {}
}
```

#### Factory Pattern
```typescript
class ServiceFactory {
  static createUserService(): UserService {
    const repository = new UserRepository();
    return new UserService(repository);
  }
}
```

### 3.2 Otros Patrones

- **Singleton**: Base de datos, logger
- **Strategy**: Múltiples implementaciones
- **Observer**: Eventos y notificaciones
- **Decorator**: Middlewares de autenticación
- **Chain of Responsibility**: Middlewares

## 4. Microservicios

### 4.1 Estructura de Microservicios

```
┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐
│   User Service   │    │ Product Service  │    │ Order Service    │
│  (Puerto 3001)   │    │  (Puerto 3002)   │    │  (Puerto 3003)   │
└────────┬─────────┘    └────────┬─────────┘    └────────┬─────────┘
         │                       │                       │
         └───────────────┬───────┴───────────────────────┘
                         │
                    ┌────▼────┐
                    │ API GW  │
                    └─────────┘
```

### 4.2 Comunicación Entre Servicios

- **REST API**: Llamadas HTTP síncronas
- **Message Queue**: Eventos asíncronos
- **Service Discovery**: Registro dinámico

### 4.3 Beneficios y Desafíos

**Beneficios**:
- Escalabilidad independiente
- Equipos autónomos
- Despliegue independiente
- Tecnologías heterogéneas

**Desafíos**:
- Complejidad operacional
- Consistencia de datos
- Network latency
- Testing distribuido

## 5. Base de Datos

### 5.1 Esquema Principal

```sql
-- Usuarios
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR(255) UNIQUE,
  password_hash VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- Productos
CREATE TABLE products (
  id UUID PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(10, 2),
  created_at TIMESTAMP
);

-- Órdenes
CREATE TABLE orders (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  total DECIMAL(10, 2),
  created_at TIMESTAMP
);
```

### 5.2 Índices Recomendados

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_created_at ON orders(created_at);
```

### 5.3 Particionamiento

- Por rango de fecha (órdenes históricas)
- Por usuario (datos sensibles)
- Por región (datos distribuidos)

## 6. Caché

### 6.1 Estrategia de Caché

```
Request
   │
   ▼
Cache (Redis)
   │ HIT   │ MISS
   ▼       ▼
Return  Database
```

### 6.2 Patrones de Caché

#### Cache-Aside
```typescript
async function getUser(id: string) {
  // Buscar en caché
  let user = await redis.get(`user:${id}`);
  
  if (!user) {
    // Si no está en caché, ir a BD
    user = await userRepository.findById(id);
    // Guardar en caché
    await redis.set(`user:${id}`, user, 'EX', 3600);
  }
  
  return user;
}
```

#### Write-Through
```typescript
async function updateUser(id: string, data: User) {
  // Actualizar BD y caché simultáneamente
  const user = await userRepository.update(id, data);
  await redis.set(`user:${id}`, user);
  return user;
}
```

### 6.3 Expiración

- **TTL corto** (5-15 min): Datos que cambian frecuentemente
- **TTL medio** (1-2 horas): Datos relativamente estables
- **TTL largo** (24 horas): Datos muy estables

## 7. Seguridad

### 7.1 Niveles de Seguridad

```
┌─────────────────────────────────────┐
│    TLS/HTTPS                        │
│    (Cifrado en tránsito)            │
└────────────────┬────────────────────┘
                 │
┌─────────────────────────────────────┐
│    Autenticación (JWT/OAuth2)       │
│    (Verificar identidad)            │
└────────────────┬────────────────────┘
                 │
┌─────────────────────────────────────┐
│    Autorización (RBAC)              │
│    (Verificar permisos)             │
└────────────────┬────────────────────┘
                 │
┌─────────────────────────────────────┐
│    Validación de Entrada            │
│    (Prevenir inyecciones)           │
└─────────────────────────────────────┘
```

### 7.2 Controles de Seguridad

- **HTTPS**: Todo en tránsito encriptado
- **JWT**: Tokens para autenticación stateless
- **RBAC**: Control de acceso basado en roles
- **Rate Limiting**: Protección contra abuso
- **SQL Parameterizado**: Prevención de SQL injection
- **CORS**: Control de origen cruzado
- **CSRF**: Tokens anti-forgery
- **Secrets Management**: Bóveda para credenciales

## 8. Escalabilidad

### 8.1 Escalabilidad Horizontal

```
Usuários múltiples
        │
    ┌───┴────┐
    ▼        ▼
 Server1  Server2
    │        │
    └───┬────┘
        ▼
    Database (Master-Slave)
        ▼
    Cache (Clustered)
```

### 8.2 Técnicas de Escalabilidad

- **Load Balancing**: Distribución de carga
- **Database Replication**: Múltiples réplicas
- **Sharding**: Particionamiento de datos
- **Caché distribuido**: Redis Cluster
- **Async Processing**: Queues para tareas pesadas
- **CDN**: Para contenido estático

## 9. Monitoreo y Observabilidad

### 9.1 Las 3 Pilares

#### Metrics
- CPU, Memoria, Disco
- Request rate, latency, errors
- Business metrics

#### Logs
- Application logs
- Access logs
- Error logs

#### Traces
- Distributed tracing
- Request flow
- Performance bottlenecks

### 9.2 Herramientas

| Métrica | Herramienta |
|--------|------------|
| **Metrics** | Prometheus |
| **Visualization** | Grafana |
| **Logs** | ELK Stack |
| **APM** | New Relic / DataDog |
| **Tracing** | Jaeger |

## 10. Disaster Recovery

### 10.1 RPO y RTO

- **RPO** (Recovery Point Objective): 1 hora
- **RTO** (Recovery Time Objective): 4 horas

### 10.2 Estrategia de Backup

```
Daily Backups (Full)
    ↓
Weekly Backups (Incremental)
    ↓
Monthly Backups (Archival)
    ↓
Off-site Storage (AWS S3)
```

### 10.3 Plan de Recuperación

1. **Detección** (0-5 min)
2. **Análisis** (5-15 min)
3. **Recuperación** (15-240 min)
4. **Validación** (5-15 min)
5. **Comunicación** (Continuo)

## 11. Decisiones Arquitectónicas (ADR)

### ADR-001: Usar Node.js para Backend
- **Decisión**: Backend en Node.js + Express
- **Razones**: Performance, ecosystem, developer productivity
- **Alternativas Consideradas**: Python, Go, Java
- **Consecuencias**: Monothreaded, necesita clustering

### ADR-002: PostgreSQL como BD Principal
- **Decisión**: PostgreSQL para datos relacionales
- **Razones**: ACID, relaciones complejas, maduro
- **Alternativas**: MySQL, MongoDB
- **Consecuencias**: Escalabilidad horizontal compleja

### ADR-003: Microservicios vs Monolito
- **Decisión**: Comenzar con monolito, eventualmente microservicios
- **Razones**: Complejidad operacional, DevOps madurez
- **Consecuencias**: Menos independencia, integración más fácil

## 12. Roadmap Técnico

### Q1 2024
- [ ] Migración a TypeScript
- [ ] Implementar testing E2E
- [ ] Optimizar base de datos

### Q2 2024
- [ ] Separar microservicio de usuarios
- [ ] Implementar Kubernetes
- [ ] Mejorar observabilidad

### Q3 2024
- [ ] Multi-región deployment
- [ ] GraphQL API
- [ ] Machine Learning pipeline

---

**Última Actualización**: Enero 2024  
**Responsable**: Equipo de Arquitectura

Para cambios arquitectónicos significativos, crear un ADR.
