---
name: analyze-requirements
description: Analyze requirements for quality, completeness, testability, and conflicts. Provides scored assessment with gaps, issues, and improvement recommendations.
user-invocable: true
---

# Requirements Analysis Skill

**What to do:** Analyze the provided requirements and produce a quality assessment with actionable recommendations.

**Usage:** `/analyze-requirements [paste requirements]`

---

## 🔄 WORKFLOW: Read Context Files First

**BEFORE analyzing requirements, load project context:**

```
1. Read .claude/PROJECT_CONTEXT.md
   → Check requirements use correct project terminology
   → Validate against known entities and relationships
   → Check business rules are properly captured

2. Read .claude/ARCHITECTURE.md
   → Check technical feasibility against tech stack
   → Validate against architectural constraints
   → Identify potential technical gaps
```

---

**Deliverables:**
- Scored assessment (Completeness, Quality, Testability - each scored 0-10)
- List of specific issues with quoted text and recommended fixes
- Prioritized action items

**After Completion - Offer Next Steps:**

After delivering assessment, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Generate User Stories** - Convert these requirements into implementation-ready stories (`/story`)
> 2. **Create Diagrams** - Visualize architecture or workflows from requirements (`/diagram`)
> 3. **Review & Refine** - I can help revise the requirements based on the issues found
>
> Which would be helpful?"

**How to route:**

- If user chooses "Generate User Stories" → `Skill(skill: "story", args: "Generate user stories for: [requirement summary with context]")`
- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create [architecture/sequence/ER] diagram for: [requirement domain]")`
- If user chooses "Review & Refine" → Offer to rewrite requirements addressing identified gaps and issues
