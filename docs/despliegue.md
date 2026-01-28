# Guía de Despliegue a Producción

## Introducción

Este documento describe el proceso paso a paso para desplegar código a producción de manera segura y confiable.

## Pre-requisitos

Antes de desplegar, asegúrate de:

- [ ] Código aprobado en code review (mínimo 2 aprobaciones)
- [ ] Todos los tests pasando
- [ ] Documentación actualizada
- [ ] No hay conflictos con main branch
- [ ] Changelog actualizado
- [ ] Plan de rollback preparado

## Fases del Despliegue

### Fase 1: Preparación (T-24 horas)

#### Crear Release Branch
```bash
git checkout -b release/v1.2.0
```

#### Actualizar Versión
```bash
# package.json
{
  "version": "1.2.0"
}
```

#### Crear CHANGELOG
```markdown
## [1.2.0] - 2024-01-28

### Added
- Nueva funcionalidad X
- Nueva funcionalidad Y

### Fixed
- Bug en módulo Z
- Mejora de performance en API

### Changed
- Refactorización de código
```

#### Commit y Push
```bash
git add package.json CHANGELOG.md
git commit -m "chore: bump version to 1.2.0"
git push origin release/v1.2.0
```

### Fase 2: Testing (T-12 horas)

#### Despliegue a Staging
```bash
# En CI/CD pipeline, esto ocurre automáticamente
# O manual:
npm run build
npm run test:e2e
npm run deploy:staging
```

#### Verificaciones en Staging

**Smoke Tests**:
```bash
curl -X GET https://staging-api.sicarx.com/health
# Debe retornar: { "status": "ok" }
```

**Pruebas Funcionales**:
- [ ] Login funciona
- [ ] Crear usuario funciona
- [ ] APIs responden correctamente
- [ ] Base de datos migraciones ejecutadas
- [ ] Logs se generan correctamente

**Pruebas de Performance**:
```bash
# Usar Apache Bench
ab -n 1000 -c 100 https://staging-api.sicarx.com/api/users
```

**Validación de Datos**:
- [ ] Integridad de base de datos
- [ ] Índices están optimizados
- [ ] No hay queries lentas

### Fase 3: Aprobación (T-4 horas)

#### Obtener Aprobaciones Requeridas

Necesitas aprobación de:
- ✅ Tech Lead / Arquitecto
- ✅ DevOps Lead
- ✅ Product Owner (si hay cambios de negocio)

```
# En PR
@tech-lead @devops-lead @product-owner ¿Aprobado para despliegue?
```

#### Review Checklist

- [ ] Cambios son lo esperado
- [ ] No hay regresiones evidentes
- [ ] Performance es aceptable
- [ ] Logs y monitoreo están configurados
- [ ] Plan de rollback es viable

### Fase 4: Despliegue (T-2 horas)

#### Ventanas de Despliegue Permitidas

| Día | Rango | Notas |
|-----|-------|-------|
| Lunes | 10 AM - 2 PM | Permitido |
| Martes | 10 AM - 2 PM | Permitido |
| Miércoles | 10 AM - 2 PM | Permitido |
| Jueves | 10 AM - 2 PM | Permitido |
| Viernes | NO | Excepto emergencias |
| Sábado-Domingo | NO | Excepto emergencias |
| Festivos | NO | Excepto emergencias |

#### Notificar al Equipo

```
📢 Anuncio de Despliegue
Versión: 1.2.0
Fecha: 28 Enero 2024 - 11:00 AM
Duración estimada: 15 minutos
Cambios: https://github.com/sicarx/app/releases/v1.2.0
Plan de rollback: https://wiki.sicarx.com/...
```

#### Backup de Base de Datos

```bash
# Crear backup antes del despliegue
pg_dump -h prod-db.sicarx.com -U postgres app_db > backup_20240128_110000.sql

# Verificar backup
file backup_20240128_110000.sql
ls -lh backup_20240128_110000.sql
```

#### Ejecutar Despliegue

```bash
# Opción 1: Automático (recomendado)
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin v1.2.0
# CI/CD despliega automáticamente

# Opción 2: Manual
./scripts/deploy-production.sh v1.2.0
```

#### Monitoreo en Vivo

Durante los 15 minutos siguientes:

```bash
# Terminal 1: Ver logs
tail -f /var/log/app/production.log

# Terminal 2: Monitorear métricas
watch -n 1 'curl -s http://localhost:8000/metrics | grep -E "http_request"'

# Terminal 3: Health check
watch -n 2 'curl -s http://localhost:8000/health'
```

**Métricas a Vigilar**:
- CPU usage
- Memory usage
- Disk usage
- Request latency
- Error rate
- Database connections

#### Validar Despliegue

```bash
# Health check
curl -X GET https://api.sicarx.com/health
# Esperado: { "status": "ok", "version": "1.2.0" }

# API versión
curl -X GET https://api.sicarx.com/api/version
# Esperado: { "version": "1.2.0" }

# Test funcional básico
curl -X POST https://api.sicarx.com/api/users \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com"}'
```

### Fase 5: Post-Despliegue (T+2 horas)

#### Monitoreo Extendido

Continúa monitoreando durante 2 horas después:

```bash
# Dashboard de Grafana
https://grafana.sicarx.com/d/production-overview

# Alertas
# Configurar alertas para:
# - Error rate > 1%
# - Latencia p95 > 2s
# - CPU > 80%
```

#### Logs y Análisis

```bash
# Buscar errores
grep -i "error" /var/log/app/production.log

# Análisis de acceso
tail -100 /var/log/app/access.log | tail -10
```

#### Actualizar Status

```
✅ Despliegue Completado
Versión: 1.2.0
Tiempo: 14 minutos
Cambios: [link a changelog]
Próxima acción: Monitoreo continuo

cc: @team #despliegues
```

## Plan de Rollback

En caso de problemas, seguir estos pasos:

### Fase 1: Decisión de Rollback

**Condiciones que gatillan rollback**:
- Error rate > 5%
- API no responde (502 > 10% de requests)
- Base de datos corrupted
- Perdida de datos
- Seguridad comprometida

**Quien puede decidir**:
- CTO
- Devops Lead
- Tech Lead (con notificación a CTO)

### Fase 2: Ejecución de Rollback

```bash
# Opción 1: Versión anterior (recomendado)
git checkout v1.1.0
./scripts/deploy-production.sh v1.1.0

# Opción 2: Desde último backup
pg_restore -h prod-db.sicarx.com -U postgres \
  -d app_db backup_20240128_110000.sql
```

### Fase 3: Validación

```bash
# Verificar versión
curl https://api.sicarx.com/api/version
# Esperado: { "version": "1.1.0" }

# Healthcheck
curl https://api.sicarx.com/health
```

### Fase 4: Comunicación

```
🔄 Rollback Ejecutado
Versión anterior: 1.1.0
Razón: [Descripción concisa]
Hora: 11:15 AM
Investigación: [link a issue]

Disculpas por los inconvenientes.
cc: @team #despliegues
```

## Caso de Estudio: Despliegue Fallido

### Situación
Era viernes a las 4 PM cuando se detectó un error en v1.2.0 que causaba pérdida de datos.

### Acción Inmediata
1. Detectado error rate de 15%
2. CTO aprobó rollback a las 4:05 PM
3. v1.1.0 desplegado a las 4:12 PM
4. Confirmado funcionamiento a las 4:18 PM

### Lecciones Aprendidas
- Hubo un test que falló pero no bloqueó deploy
- Faltaba test para caso edge específico
- Debería haberse testeado más en staging

### Acciones Correctivas
- Agregado test para caso edge
- Reforzado proceso de testing en staging
- Añadido check adicional pre-despliegue

## Checklist de Despliegue

### Pre-Despliegue
- [ ] Tests pasando
- [ ] Code review aprobado
- [ ] Changelog actualizado
- [ ] Backup de BD realizado
- [ ] Plan de rollback documentado
- [ ] Aprobaciones obtenidas

### During Despliegue
- [ ] Notificación enviada
- [ ] Monitoreo iniciado
- [ ] Health checks ejecutados
- [ ] No errores evidentes

### Post-Despliegue
- [ ] Validación completada
- [ ] Logs revisados
- [ ] Equipo notificado
- [ ] Documentación actualizada
- [ ] Post-mortem si hay issues

## Herramientas de Apoyo

```bash
# Deploy script
./scripts/deploy-production.sh [version]

# Rollback script
./scripts/rollback-production.sh [version]

# Health check
./scripts/health-check.sh

# Backup script
./scripts/backup-database.sh
```

## Soporte y Emergencias

### Durante un Despliegue
- **Slack**: #despliegues (monitoreo en vivo)
- **Página de Status**: status.sicarx.com
- **Oncall DevOps**: Pagerduty

### Después del Despliegue
- Post-mortem si hay issues
- Documentación de lecciones aprendidas
- Mejoras al proceso

---

**Última Actualización**: Enero 2024  
**Responsable**: DevOps Team

Para preguntas, contactar a DevOps Lead.
