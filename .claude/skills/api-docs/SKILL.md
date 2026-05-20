---
name: api-docs
description: Generate API documentation and OpenAPI specifications. Creates structured endpoint docs with request/response examples, validation rules, and error handling. Can document existing APIs or design new API specs.
user-invocable: true
---

# API Documentation Generation Skill

**What to do:** Generate comprehensive API documentation with OpenAPI specification for the requested endpoints.

**Usage:** `/api-docs [API description or endpoint to document]`

---

## 🔄 WORKFLOW: Read Context Files First

**BEFORE generating API documentation, load project context:**

```
1. Read .claude/PROJECT_CONTEXT.md
   → Understand: Domain entities that APIs will expose
   → Understand: Business terminology for API naming
   → Understand: Business rules for validation and authorization

2. Read .claude/ARCHITECTURE.md
   → Understand: API conventions (REST, GraphQL, etc.)
   → Understand: Authentication method
   → Understand: Response formats and error handling patterns
   → Understand: Technology constraints and patterns

3. Determine API architecture:
   - Check ARCHITECTURE.md for API patterns and conventions
   - Understand data access patterns
   - Review authentication/authorization approach

4. Generate API docs using project conventions:
   - Use correct entity names in DTOs
   - Apply project-specific patterns from ARCHITECTURE.md
   - Include validation rules and business constraints
   - Document multi-tenancy or isolation if applicable
```

---

**Deliverables:**
- Endpoint documentation (description, HTTP method, URL, auth requirements)
- Request/response schemas with field descriptions
- Success and error response examples with status codes
- Business rules and validation logic
- cURL examples for testing
- OpenAPI 3.0 specification (YAML/JSON)

**After Completion - Offer Next Steps:**

After documenting API, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Create Diagrams** - Visualize API flows with sequence diagrams (`/diagram`)
> 2. **Generate User Stories** - Create backend implementation stories for these endpoints (`/story`)
> 3. **Build Prototype** - Create working prototype that calls these APIs (`/prototype`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create sequence diagram showing: [API call flows and interactions]")`
- If user chooses "Generate User Stories" → `Skill(skill: "story", args: "Generate backend user stories for implementing: [API endpoints with business rules]")`
- If user chooses "Build Prototype" → `Skill(skill: "prototype", args: "Build prototype that demonstrates: [API usage and integration]")`
