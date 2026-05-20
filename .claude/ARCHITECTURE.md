# Architecture Template

## 📋 How to Use This File

This file helps Claude understand your tech stack, constraints, and patterns.
**Fill in the sections below** to ensure generated stories are technically feasible.

**💡 Tip:** Focus on constraints and patterns that affect user story implementation!

---

## Tech Stack

Document your key technologies so Claude understands technical constraints.

### Backend

**Languages & Frameworks:**
- _e.g., Node.js, Python Django, .NET Core, Java Spring Boot_

**Database & ORM:**
- _e.g., PostgreSQL, MongoDB, Entity Framework, Sequelize_

**Key Libraries:**
- _e.g., Authentication, Messaging, Caching_

**Example:**
- **Node.js 20** - Backend runtime
- **Express.js** - Web framework
- **PostgreSQL** - Primary database
- **Prisma ORM** - Database access layer
- **Redis** - Caching and sessions

**Add your backend stack below:**
- _Technology 1..._
- _Technology 2..._
- _Technology 3..._

---

### Frontend

**Languages & Frameworks:**
- _e.g., React, Angular, Vue, Svelte_

**UI Libraries:**
- _e.g., Material UI, Tailwind, Bootstrap_

**State Management:**
- _e.g., Redux, MobX, Context API_

**Example:**
- **React 18** - UI framework
- **TypeScript** - Type-safe JavaScript
- **Material-UI** - Component library
- **Redux Toolkit** - State management
- **React Query** - Data fetching

**Add your frontend stack below:**
- _Technology 1..._
- _Technology 2..._
- _Technology 3..._

---

### Infrastructure

**Deployment:**
- _e.g., AWS, Azure, GCP, Docker, Kubernetes_

**CI/CD:**
- _e.g., GitHub Actions, Jenkins, CircleCI_

**Monitoring:**
- _e.g., DataDog, New Relic, Sentry_

**Add your infrastructure details below:**
- _Tool 1..._
- _Tool 2..._
- _Tool 3..._

---

## API Style

What API patterns does your project use?

**Options:**
- REST (HTTP/JSON)
- GraphQL
- gRPC
- WebSockets
- Server-Sent Events

**Your API Style:**
- _e.g., REST with OpenAPI spec_
- _Authentication: JWT tokens_
- _Versioning: URL-based (/v1/, /v2/)_

---

## Critical Constraints

Document technical constraints that affect implementation decisions.

### ❌ NEVER Do These:

**Example constraints:**
- **NO direct database access** - Use repository pattern only
- **NO synchronous blocking calls** - Use async/await
- **NO plain text passwords** - Use bcrypt hashing
- **NO client-side secrets** - Use environment variables

**Add your constraints below:**
- _Constraint 1..._
- _Constraint 2..._
- _Constraint 3..._

---

### ✅ ALWAYS Do These:

**Example patterns:**
- **Use DTOs** - Separate API models from domain models
- **Validate input** - Use validation middleware
- **Log errors** - Use structured logging
- **Write tests** - Unit + integration tests required

**Add your required patterns below:**
- _Pattern 1..._
- _Pattern 2..._
- _Pattern 3..._

---

## Data Access Patterns

How does your application read and write data?

### Example: Repository Pattern
```typescript
// Read
const user = await userRepository.findById(userId);
const users = await userRepository.findByRole('admin');

// Write
await userRepository.save(user);
await userRepository.delete(userId);
```

**Add your data access patterns below:**

### [Your Pattern Name]
```
// Code example...
```

---

## Authentication & Authorization

How does your app handle auth?

### Example: JWT + Role-Based Access Control
- **Authentication:** JWT tokens issued on login
- **Authorization:** Role-based permissions (admin, user, guest)
- **Token Storage:** HTTP-only cookies
- **Token Refresh:** Sliding expiration (15min access, 7day refresh)

**Add your auth approach below:**
- _Authentication method..._
- _Authorization strategy..._
- _Token/session management..._

---

## Configuration

How are application settings managed?

### Example: Environment Variables
- `.env.local` - Local development overrides
- `.env.production` - Production settings (deployed via CI/CD)
- Never commit `.env` files to git

**Add your configuration approach below:**
- _Config file/method 1..._
- _Config file/method 2..._
- _Security notes..._

---

## Testing Strategy

What types of tests are required?

### Example: Pyramid Testing
- **Unit Tests:** 70% - Test business logic in isolation
- **Integration Tests:** 20% - Test API endpoints + database
- **E2E Tests:** 10% - Test critical user flows via Cypress

**Add your testing requirements below:**
- _Test type 1..._
- _Test type 2..._
- _Tools used..._

---

## Code Organization

How is the codebase structured?

### Example: Feature-Based Structure
```
src/
├── features/
│   ├── users/
│   │   ├── user.model.ts
│   │   ├── user.service.ts
│   │   ├── user.controller.ts
│   │   └── user.test.ts
│   └── orders/
│       ├── order.model.ts
│       ├── order.service.ts
│       └── order.controller.ts
├── shared/
│   ├── middleware/
│   ├── utils/
│   └── types/
└── config/
```

**Add your code structure below:**
```
your-structure/
├── folder1/
├── folder2/
└── folder3/
```

---

## Performance Considerations

Are there performance constraints or patterns to follow?

### Example: Caching Strategy
- **Redis caching** for frequently accessed data (>100 req/sec)
- **Cache TTL:** User profiles (5min), Product catalog (1hr)
- **Invalidation:** On data updates via pub/sub

**Add your performance patterns below:**
- _Pattern 1..._
- _Pattern 2..._

---

## Security Requirements

What security practices must be followed?

### Example: OWASP Top 10 Compliance
- **Input validation** - All user input sanitized
- **SQL injection prevention** - Parameterized queries only
- **XSS prevention** - Content Security Policy headers
- **CSRF protection** - CSRF tokens on state-changing requests

**Add your security requirements below:**
- _Requirement 1..._
- _Requirement 2..._
- _Requirement 3..._

---

## 🎯 Quick Start

1. **Fill in Tech Stack** - Document key technologies
2. **Add Constraints** - Note what NOT to do
3. **Document Patterns** - Show how to do common tasks
4. **Start using `/ba`** - Stories will follow your architecture!

---

## 💡 Tips

- **Focus on constraints:** What CAN'T be done is most important
- **Show examples:** Code snippets help clarify patterns
- **Keep it current:** Update when architecture changes
- **Link to docs:** Reference external architecture docs if available
- **Think about BAs:** What would a BA need to write feasible stories?

---

## Example: Node.js/React SaaS App

Here's a filled example for reference:

### Tech Stack
**Backend:** Node.js 20, Express.js, PostgreSQL, Prisma ORM
**Frontend:** React 18, TypeScript, Material-UI, Redux Toolkit
**Infrastructure:** AWS (EC2, RDS, S3), Docker, GitHub Actions

### Critical Constraints
❌ **NEVER** use `any` type in TypeScript
❌ **NEVER** store passwords in plain text
✅ **ALWAYS** use async/await (no callbacks)
✅ **ALWAYS** validate input with Zod schemas

### Data Access
```typescript
// Use Prisma ORM
const user = await prisma.user.findUnique({ where: { id } });
await prisma.user.update({ where: { id }, data: { name } });
```

### Authentication
- JWT tokens (15min expiration)
- HTTP-only cookies
- Role-based access control (RBAC)
