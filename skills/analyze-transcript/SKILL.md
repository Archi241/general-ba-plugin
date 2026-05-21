---
name: analyze-transcript
description: Analyze meeting transcripts, user interviews, or call recordings. Extracts pain points, feature requests, requirements, and action items. Recommends user stories based on findings.
user-invocable: true
---

# Transcript Analysis Skill

**What to do:** Extract insights, requirements, and action items from the provided meeting transcript or user interview.

**Usage:** `/analyze-transcript [paste transcript]`

---

## 🔄 WORKFLOW: Read Context Files First

**BEFORE analyzing transcript, optionally load project context:**

```
If transcript mentions project-specific features, entities, or workflows:
  → Read .claude/PROJECT_CONTEXT.md
    • Understand: Domain entities and relationships
    • Understand: User personas and roles
    • Understand: Project terminology
  
  → Read .claude/ARCHITECTURE.md
    • Understand: Tech stack constraints
    • Validate: Technical feasibility of discussed features
```

This helps map user feedback to your project's domain concepts.

---

**Deliverables:**
- Pain points (prioritized by impact and frequency)
- Feature requests (explicit and implied)
- Current workarounds and positive feedback
- Functional and non-functional requirements
- Action items and decisions made
- Identified personas
- Recommended user stories based on findings

**After Completion - Offer Next Steps:**

After analyzing transcript, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Generate User Stories** - Create detailed stories from the insights and feature requests (`/story`)
> 2. **Analyze Requirements** - Assess quality of the extracted requirements (`/analyze-requirements`)
> 3. **Create Diagrams** - Visualize workflows or pain points discussed (`/diagram`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Generate User Stories" → `Skill(skill: "story", args: "Generate user stories for these feature requests: [top pain points and feature requests from transcript]")`
- If user chooses "Analyze Requirements" → `Skill(skill: "analyze-requirements", args: "[extracted functional and non-functional requirements]")`
- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create [workflow/journey] diagram showing: [pain points or current vs. desired state]")`
