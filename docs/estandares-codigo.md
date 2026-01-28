# Estándares de Código

## Introducción

Este documento define los estándares de código que todos los desarrolladores deben seguir para mantener consistencia, legibilidad y mantenibilidad del codebase.

## 1. Principios Generales

### DRY (Don't Repeat Yourself)
Evita duplicar código. Si encuentras código repetido, refactoriza en una función reutilizable.

**❌ Mal**:
```javascript
function getUserEmail(userId) {
  const user = db.query('SELECT * FROM users WHERE id = ?', userId);
  if (!user) throw new Error('User not found');
  return user.email;
}

function getUserPhone(userId) {
  const user = db.query('SELECT * FROM users WHERE id = ?', userId);
  if (!user) throw new Error('User not found');
  return user.phone;
}
```

**✅ Bien**:
```javascript
function getUser(userId) {
  const user = db.query('SELECT * FROM users WHERE id = ?', userId);
  if (!user) throw new Error('User not found');
  return user;
}

function getUserEmail(userId) {
  return getUser(userId).email;
}

function getUserPhone(userId) {
  return getUser(userId).phone;
}
```

### SOLID

#### S - Single Responsibility Principle
Cada clase/función debe tener una única responsabilidad.

**❌ Mal**:
```javascript
class User {
  // Responsabilidad 1: Datos de usuario
  // Responsabilidad 2: Validación
  // Responsabilidad 3: Persistencia
  validateEmail() { ... }
  saveToDatabase() { ... }
  sendEmail() { ... }
}
```

**✅ Bien**:
```javascript
class User {
  // Solo datos de usuario
  constructor(email, name) {
    this.email = email;
    this.name = name;
  }
}

class UserValidator {
  validateEmail(email) { ... }
}

class UserRepository {
  save(user) { ... }
}

class EmailService {
  send(to, subject, body) { ... }
}
```

#### O - Open/Closed Principle
Abierto para extensión, cerrado para modificación.

#### L - Liskov Substitution Principle
Las subclases deben ser sustituibles por sus clases base.

#### I - Interface Segregation Principle
Interfaz pequeñas y específicas en lugar de grandes y generales.

#### D - Dependency Inversion Principle
Depender de abstracciones, no de implementaciones concretas.

### KISS (Keep It Simple, Stupid)
Simplifica al máximo. Si un código es difícil de entender, refactoriza.

## 2. Convenciones de Nombres

### Variables y Funciones (camelCase)

```javascript
// Variables
let userCount = 0;
let isActive = true;
let firstName = "John";

// Funciones
function calculateTotal() { }
function formatDate(date) { }
function getUserById(id) { }

// Métodos
user.getEmail();
user.setEmail(email);
user.isActive();
```

### Clases y Interfaces (PascalCase)

```typescript
class UserService { }
class ProductRepository { }
interface IUserService { }
```

### Constantes (UPPER_SNAKE_CASE)

```javascript
const MAX_RETRIES = 3;
const API_TIMEOUT = 5000;
const DB_HOST = 'localhost';
```

### Archivos (kebab-case o snake_case)

```
user-service.ts
product-controller.ts
auth-middleware.js
database_config.js
```

### Booleanos

```javascript
// Usar prefijos is, has, can, should
let isActive = true;
let hasPermission = false;
let canDelete = true;
let shouldRetry = false;
```

## 3. Formato de Código

### Indentación

Usar **2 espacios** (no tabs):

```javascript
if (condition) {
  for (let i = 0; i < 10; i++) {
    console.log(i);
  }
}
```

### Longitud de Línea

Máximo **100 caracteres**. Si supera, dividir:

```javascript
// ❌ Muy largo
const message = `El usuario ${user.name} con email ${user.email} fue creado el ${user.createdAt}`;

// ✅ Correcto
const message = 
  `El usuario ${user.name} con email ${user.email} ` +
  `fue creado el ${user.createdAt}`;
```

### Espacios en Blanco

```javascript
// Alrededor de operadores
let result = a + b;
let isTrue = x === y;

// Después de palabras clave
if (condition) { }
for (let i = 0; i < 10; i++) { }
while (true) { }

// NO espacios en llamadas de función
console.log('hello');
user.getName();
```

### Comillas

- JavaScript: Usar **comillas dobles** o backticks
- SQL: Usar **comillas simples** para strings

```javascript
// ✅
const name = "John";
const message = `Hello ${name}`;

// SQL
SELECT * FROM users WHERE name = 'John';
```

## 4. Comentarios

### Documentación JSDoc

```typescript
/**
 * Calcula el total de una factura
 * @param {Array<number>} items - Array de precios
 * @param {number} taxRate - Tasa de impuesto (0-1)
 * @returns {number} Total con impuestos incluidos
 * @throws {Error} Si items está vacío
 * 
 * @example
 * const total = calculateInvoiceTotal([100, 200], 0.21);
 * // returns 330
 */
function calculateInvoiceTotal(items, taxRate) {
  if (items.length === 0) throw new Error('Items cannot be empty');
  const subtotal = items.reduce((a, b) => a + b, 0);
  return subtotal * (1 + taxRate);
}
```

### Comentarios en Línea

Usar solo cuando sea **realmente necesario**:

```javascript
// ✅ Buen comentario (explica "por qué")
// Necesitamos esperar 100ms para que el DOM se actualice
setTimeout(() => {
  updateUI();
}, 100);

// ❌ Malo (repite el código)
// Incrementar contador
counter++;

// ❌ Malo (obvio)
// Validar email
if (!email.includes('@')) { }
```

## 5. Estructura de Código

### Orden en Clases

```typescript
class User {
  // 1. Propiedades static
  static ROLE_ADMIN = 'admin';
  
  // 2. Propiedades de instancia
  private id: string;
  private email: string;
  
  // 3. Constructor
  constructor(id: string, email: string) {
    this.id = id;
    this.email = email;
  }
  
  // 4. Métodos public
  public getEmail(): string {
    return this.email;
  }
  
  // 5. Métodos private
  private validateEmail(): boolean {
    return this.email.includes('@');
  }
}
```

### Orden en Archivos

```typescript
// 1. Imports
import { UserService } from './services';

// 2. Interfaces/Types
interface IUser {
  id: string;
  email: string;
}

// 3. Constantes
const DEFAULT_ROLE = 'user';

// 4. Implementación
class User { }

// 5. Exports
export { User };
```

## 6. Control de Errores

### Siempre Manejar Errores

```javascript
// ❌ Mal
const data = JSON.parse(userInput);

// ✅ Bien
let data;
try {
  data = JSON.parse(userInput);
} catch (error) {
  console.error('Invalid JSON:', error);
  data = null;
}
```

### Mensajes de Error Descriptivos

```javascript
// ❌ Malo
throw new Error('Error');

// ✅ Bien
throw new Error('Failed to fetch user data: User with id 123 not found in database');
```

### Validación de Entrada

```javascript
function processUser(user) {
  // Validar entrada
  if (!user) throw new Error('User is required');
  if (!user.email) throw new Error('User email is required');
  if (!user.email.includes('@')) throw new Error('Invalid email format');
  
  // Procesar
  return saveUser(user);
}
```

## 7. Testing

### Cobertura Mínima

- **80%** de cobertura general
- **100%** para código crítico (auth, payments)

### Estructura de Tests

```javascript
describe('UserService', () => {
  describe('getUser', () => {
    it('should return user when exists', () => {
      // Arrange
      const userId = '123';
      
      // Act
      const user = userService.getUser(userId);
      
      // Assert
      expect(user).toBeDefined();
      expect(user.id).toBe(userId);
    });
    
    it('should throw error when user not found', () => {
      // Arrange
      const userId = 'non-existent';
      
      // Assert
      expect(() => userService.getUser(userId))
        .toThrow('User not found');
    });
  });
});
```

## 8. Performance

### Evitar N+1 Queries

```javascript
// ❌ Malo (N+1 queries)
const users = await db.query('SELECT * FROM users');
for (const user of users) {
  const posts = await db.query('SELECT * FROM posts WHERE user_id = ?', user.id);
  user.posts = posts;
}

// ✅ Bien (1 query)
const users = await db.query(`
  SELECT u.*, json_agg(p.*) as posts
  FROM users u
  LEFT JOIN posts p ON u.id = p.user_id
  GROUP BY u.id
`);
```

### Usar Índices en Base de Datos

```sql
-- Para búsquedas frecuentes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_posts_user_id ON posts(user_id);
```

### Lazy Loading vs Eager Loading

```typescript
// Lazy loading (cargar bajo demanda)
const user = await User.findById(id);
const posts = await user.getPosts(); // Query separada

// Eager loading (cargar junto)
const user = await User.findById(id, {
  include: [Post]
});
```

## 9. Seguridad

### Validación Siempre

```javascript
// ❌ Malo
app.post('/users', (req, res) => {
  const user = new User(req.body);
  user.save();
});

// ✅ Bien
app.post('/users', (req, res) => {
  const { email, name } = req.body;
  
  if (!email || !name) {
    return res.status(400).json({ error: 'Missing fields' });
  }
  
  if (!isValidEmail(email)) {
    return res.status(400).json({ error: 'Invalid email' });
  }
  
  const user = new User(email, name);
  user.save();
});
```

### Nunca Hardcodear Secretos

```javascript
// ❌ Malo
const API_KEY = 'sk_live_abc123xyz';

// ✅ Bien
const API_KEY = process.env.STRIPE_API_KEY;
```

### SQL Prepared Statements

```javascript
// ❌ Malo (SQL injection vulnerable)
const query = `SELECT * FROM users WHERE email = '${email}'`;

// ✅ Bien
const query = 'SELECT * FROM users WHERE email = ?';
db.query(query, [email]);
```

## 10. Tools y Automatización

### ESLint

```json
{
  "extends": "eslint:recommended",
  "rules": {
    "indent": ["error", 2],
    "quotes": ["error", "double"],
    "semi": ["error", "always"],
    "no-unused-vars": "error"
  }
}
```

### Prettier

Usar para formateo automático:

```bash
npm run format  # Formatter código
```

### Git Hooks (husky)

```bash
# Pre-commit: Lint y format
npm run lint --fix
npm run format

# Pre-push: Tests
npm test
```

## Checklist de Code Review

- [ ] Código sigue estándares de nombre
- [ ] Sin código duplicado (DRY)
- [ ] Funciones tienen una responsabilidad (SRP)
- [ ] Documentación/JSDoc presente
- [ ] Tests presentes y pasando
- [ ] Manejo de errores adecuado
- [ ] Sin hardcoded secrets
- [ ] Performance aceptable
- [ ] Seguridad considerada

---

**Última Actualización**: Enero 2024  
**Responsable**: Equipo de Arquitectura

Para violaciones graves de estándares, abrir issue en repositorio.
