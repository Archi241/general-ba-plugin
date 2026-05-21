---
name: prototype
description: Generate working prototypes to validate concepts. Creates runnable code in isolated folder with tests, documentation, and startup scripts. Uses lo-fi HTML approach for rapid validation.
user-invocable: true
---

# Prototype Generation Skill

**What to do:** Build a working lo-fi HTML prototype in `prototypes/[feature-slug]/` to validate the feature concept.

**Usage:** `/prototype [feature description]`

**Deliverables:**
- `index.html` - Single-file prototype with inline CSS/JS (no frameworks, no build tools)
- `README.md` - How to run (just open in browser)
- `RESEARCH.md` - Market research findings (2-3 comparable implementations)
- Next steps documentation (top 3 TODOs, technology recommendations, integration points)

**Key principle:** Speed over polish - focus on concept validation, not production-ready code.

**After Completion - Offer Next Steps:**

After building prototype, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Generate User Stories** - Create implementation stories for production version (`/story`)
> 2. **Create API Docs** - Document backend APIs needed for this feature (`/api-docs`)
> 3. **UX Assessment** - Review the prototype UI for design improvements (`/ux-assessment`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Generate User Stories" → `Skill(skill: "story", args: "Generate production implementation stories for: [prototype feature with tech stack from RESEARCH.md]")`
- If user chooses "Create API Docs" → `Skill(skill: "api-docs", args: "Document API endpoints needed for: [prototype features and integration points]")`
- If user chooses "UX Assessment" → `Skill(skill: "ux-assessment", args: "Review prototype UI at: prototypes/[feature-slug]/index.html")`
