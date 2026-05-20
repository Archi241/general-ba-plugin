---
name: diagram
description: Quick diagram generation. Creates Mermaid diagrams - sequence, ER, flowchart, architecture, or state diagrams. Automatically chooses the right diagram type based on context.
user-invocable: true
---

# Diagram Generation Skill

**What to do:** Create a Mermaid diagram that visualizes the requested workflows, data models, or architecture.

**Usage:** `/diagram [description of what to visualize]`

---

## 🔄 WORKFLOW: Read Context Files First (Legal Tracker Optimization)

**BEFORE creating diagrams, load Legal Tracker context:**

```
1. Read .claude/PROJECT_CONTEXT.md
   → Use correct entity names in diagrams (TMatter, TAction, TInvoice)
   → Use correct personas in sequence diagrams
   → Include proper workflows from context

2. Read .claude/ARCHITECTURE.md
   → Show correct architecture (Monolith + Microservices)
   → Show correct technology layers (Angular → API → TOF → SQL Server)
   → Include authentication flows (JWT for microservices, session for monolith)
```

---

**Deliverables:**
- Mermaid diagram code block (sequence, ER, flowchart, architecture, or state diagram)
- Brief explanation of what the diagram shows

**After Completion - Offer Next Steps:**

After creating diagram, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Build Prototype** - Create working prototype based on this flow/architecture (`/prototype`)
> 2. **Generate User Stories** - Create implementation stories for this workflow (`/story`)
> 3. **Create API Docs** - Document the endpoints/APIs shown in this diagram (`/api-docs`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Build Prototype" → `Skill(skill: "prototype", args: "Build prototype implementing: [workflow/architecture from diagram]")`
- If user chooses "Generate User Stories" → `Skill(skill: "story", args: "Generate user stories for implementing: [workflow from diagram]")`
- If user chooses "Create API Docs" → `Skill(skill: "api-docs", args: "Document API endpoints for: [system/workflow from diagram]")`
