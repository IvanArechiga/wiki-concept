# Procedimientos Operacionales Diarios

## Introducción

Este documento describe los procedimientos y rutinas diarias, semanales y mensuales que mantienen la operación fluida de SICAR X.

## 1. Rutinas Diarias

### Morning Standup (9:30 AM)

**Participantes**: Equipo de desarrollo (15 min)

**Formato**: Semanal rotativo entre equipos

```
1. Ayer: ¿Qué completé?
2. Hoy: ¿Qué planeo hacer?
3. Bloqueadores: ¿Necesito ayuda?
```

**Ubicación**: Sala de reuniones o Zoom  
**Documento**: Slack #standup

### Health Check (10:00 AM)

**Participantes**: DevOps team (5 min)

```bash
# Checks
✓ API health endpoint
✓ Database response time
✓ Disk usage
✓ Memory usage
✓ CPU usage
✓ Error rate

# Si alguno falla:
1. Investigar logs
2. Alertar si > threshold
3. Crear incident ticket
```

### Email y Comunicaciones (10:30 AM)

**Tiempo máximo**: 30 minutos

- Revisar emails urgentes
- Responder Slack pings
- Actualizar equipo en reuniones relevantes

### Desarrollo/Trabajo Profundo (11:00 AM - 12:00 PM)

**Focus time**: Sin meetings (1 hora)

- Codificación
- Code reviews
- Diseño de soluciones

### Reuniones de Equipo (Según calendario)

Varía por departamento.

### Almuerzo (12:00 PM - 1:00 PM)

**Política**: Flexible, al menos 1 hora

- Descanso mental
- Actividad física (opcional: gym)
- Networking con colegas

### Trabajo Profundo (1:00 PM - 3:00 PM)

**Focus time**: 2 horas

- Tareas importantes
- Pair programming
- Documentación

### Reuniones Opcionales (3:00 PM - 4:00 PM)

- One-on-ones
- Planning
- Revisión de arquitectura

### Cierre de Día (4:00 PM - 5:00 PM)

**Actividades**:
1. Commit y push de cambios
2. Actualizar Jira tickets
3. Responder commentarios de code review
4. Documentar blockers
5. Desconectar (no trabajar después de 5 PM)

---

## 2. Rutinas Semanales

### Lunes - Planning Sprint

**Hora**: 9:00 AM (90 minutos)  
**Participantes**: Squad + Product Owner

**Agenda**:
```
1. Retrospectiva sprint anterior (20 min)
   - ¿Qué salió bien?
   - ¿Qué mejorar?
   - Acciones para próximo sprint

2. Planning nuevo sprint (70 min)
   - Priorización de backlog
   - Estimación de tareas
   - Asignación de tasks
   - Definir sprint goal

3. Confirmación (?) 
   - Equipo confirma que es realizable
```

**Output**: Sprint plan documentado en Jira

### Martes - Technical Review

**Hora**: 2:00 PM (60 minutos)  
**Participantes**: Tech leads

**Agenda**:
```
1. Arquitectura technical debts
2. Security findings
3. Performance improvements
4. Refactoring backlog
5. Technology updates
```

### Miércoles - All Hands

**Hora**: 3:00 PM (60 minutos)  
**Participantes**: Toda la empresa

**Agenda**:
```
1. CEO updates (15 min)
   - Noticias corporativas
   - Resultados del mes

2. Departament updates (20 min)
   - Cada departamento
   - Highlights

3. Producto updates (15 min)
   - Features nuevas
   - Roadmap

4. Q&A (10 min)
```

**Nota**: Grabado para quienes no puedan asistir

### Jueves - Social Event

**Hora**: 5:00 PM  
**Participantes**: Voluntarios

**Actividades**:
- Juegos
- Happy hour virtual
- Team dinner

### Viernes - Retro Operacional

**Hora**: 4:00 PM (30 minutos)  
**Participantes**: Ops team

**Agenda**:
```
1. Incidents de la semana
2. Mejoras implementadas
3. Capacitación necesaria
4. Pausa semanal
```

---

## 3. Rutinas Mensuales

### 1st Day - All Hands Meeting

**Lunes de la semana 1** (Primera del mes)

Presentación general del mes:
- Objetivos empresariales
- Proyectos prioritarios
- Celebración de logros

### Week 1 - Planning Mensual

**Miércoles semana 1**

```
Departamentos planifican:
- Objetivos del mes
- Deliverables principales
- Riesgos identificados
```

### Week 2 - Engineering Review

**Martes semana 2**

```
Revisión técnica completa:
- Deuda técnica acumulada
- Security audit
- Performance metrics
- Code quality scores
```

### Week 3 - Business Review

**Jueves semana 3**

```
Revisión de negocio:
- Ingresos
- Customer satisfaction
- Churn rate
- NPS (Net Promoter Score)
```

### Week 4 - Executive Sync

**Jueves semana 4**

C-Level meeting:
- Strategic decisions
- Budget allocation
- HR updates
- Financial review

### Last Friday - Social Activity

**Último viernes del mes**

Actividad social mayor:
- Team lunch
- Off-site event
- Awards ceremony

---

## 4. Checklist de Cierre de Día

Al finalizar cada jornada:

```
Personal
─────────────────────────────
☐ Commits pushed a git
☐ Jira tickets actualizados
☐ Code reviews respondidos
☐ Documentación actualizada
☐ Blockers documentados
☐ Mañana preparada (si es viernes)

Team
─────────────────────────────
☐ Slack standup actualizado
☐ Documentación compartida
☐ Cambios comunicados
☐ Issues creadas si necesario

Manager
─────────────────────────────
☐ One-on-one completado (si aplica)
☐ Feedback dado a directs
☐ Team pulse monitoreado
```

---

## 5. Checklist Semanal

Cada viernes:

```
Development
─────────────────────────────
☐ Todos los tests pasando
☐ No hay PRs olvidadas
☐ Documentación up-to-date
☐ Dependencias actualizadas
☐ Performance metrics revisados

Operations
─────────────────────────────
☐ Backups completados
☐ No hay alertas pendientes
☐ Logs revisados
☐ Capacity planning OK
☐ Security scans completados

Communication
─────────────────────────────
☐ Reuniones retro completadas
☐ Acción items asignadas
☐ Updates comunicadas
☐ Documentación accesible
```

---

## 6. Checklist Mensual

Primer día del mes:

```
Administrative
─────────────────────────────
☐ Timesheets aprobados
☐ Expensas procesadas
☐ Contratos actualizados
☐ Licenses renovadas
☐ Seguros al día

Technical
─────────────────────────────
☐ Arquitectura review
☐ Security audit
☐ Performance analysis
☐ Cost optimization
☐ Disaster recovery drill

People
─────────────────────────────
☐ One-on-ones completados
☐ Development plans updated
☐ Feedback recopilado
☐ Engagement survey
☐ Retenciones revisadas

Business
─────────────────────────────
☐ Revenue targets
☐ Customer satisfaction
☐ Pipeline review
☐ Competitive analysis
☐ Roadmap updated
```

---

## 7. Agenda Semanal Estándar

```
LUNES
  9:00 - Planning Sprint (90 min)
 11:00 - Focus time
 12:00 - Almuerzo
  1:00 - Focus time
  3:00 - Meetings (opcional)
  
MARTES
  9:30 - Standup
 10:00 - Health check
 10:30 - Email/Comms
 11:00 - Focus time
 12:00 - Almuerzo
  1:00 - Focus time
  2:00 - Technical Review (si aplica)
  
MIÉRCOLES
  9:30 - Standup
 10:00 - Health check
 10:30 - Email/Comms
 11:00 - Focus time
 12:00 - Almuerzo
  1:00 - Focus time
  3:00 - All Hands
  
JUEVES
  9:30 - Standup
 10:00 - Health check
 10:30 - Email/Comms
 11:00 - Focus time
 12:00 - Almuerzo
  1:00 - Focus time
  3:00 - Meetings
  5:00 - Social event
  
VIERNES
  9:30 - Standup
 10:00 - Health check
 10:30 - Email/Comms
 11:00 - Focus time
 12:00 - Almuerzo
  1:00 - Focus time
  3:00 - Retro/Planning
  4:00 - Cierre de día
```

---

## 8. Gestión de Interrupciones

### Respuesta a Emergencias

**Urgente (Crítico)**:
- API down → Respuesta inmediata
- Data loss → Respuesta inmediata
- Security breach → Respuesta inmediata

**Importante (Alto)**:
- Bug en producción → Dentro de 1 hora
- Cliente complaint → Dentro de 2 horas
- Performance issue → Dentro de 4 horas

**Normal (Medio)**:
- Code review → Dentro de 24 horas
- Pregunta técnica → Dentro de 48 horas
- Feature request → Próximo sprint

### Slack Etiquette

```
🔴 @channel/@here     - Solo para EMERGENCIAS
🟡 @team-name          - Información importante
🟢 Regular mention      - Cuando necesario
⚪ No mention          - FYI/información general
```

---

## 9. Gestión de Conocimiento

### Documentar Diariamente

Después de resolver problema o completar task:

1. **¿Es repetible?** → Documentar procedimiento
2. **¿Es común?** → Agregar a FAQ
3. **¿Es importante?** → Actualizar wiki
4. **¿Es crítico?** → Capacitar al equipo

### Repositorio de Documentación

```
wiki-concept/
├── docs/
│   ├── procesos/          # Procedimientos diarios
│   ├── guias/             # Guías temáticas
│   ├── templates/         # Templates reutilizables
│   └── troubleshooting/   # Solución de problemas
```

---

## 10. Métricas de Salud Operacional

Se revisan semanalmente:

| Métrica | Target | Alerta |
|---------|--------|--------|
| Uptime | 99.9% | < 99% |
| Response time p95 | < 200ms | > 500ms |
| Error rate | < 0.1% | > 1% |
| Deploy frequency | 2+ x semana | < 1 x semana |
| Lead time | < 3 días | > 1 semana |
| MTTR | < 1 hora | > 4 horas |

---

## Contactos de Emergencia

| Rol | Nombre | Teléfono | Slack |
|-----|--------|----------|-------|
| **CTO** | [Nombre] | +1-555-0001 | @cto |
| **DevOps Lead** | [Nombre] | +1-555-0002 | @devops |
| **Security** | [Nombre] | +1-555-0003 | @security |

---

**Última Actualización**: Enero 2024  
**Responsable**: Operaciones

Para cambios en procedimientos, comunicar a toda el equipo.
