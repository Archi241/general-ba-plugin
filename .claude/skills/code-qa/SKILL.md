---
name: code-qa
description: Analyze the codebase and answer questions based only on actual code. Provides factual answers about implementation, architecture, patterns, and functionality - no speculation or invention.
user-invocable: true
---

# Codebase Q&A Skill

**What to do:** Answer the question about the codebase using only actual implementation code - no speculation or invention.

**Usage:** `/code-qa [your question about the codebase]`

**Deliverables:**
- Factual answer based on actual code implementation
- File references with clickable links and line numbers
- Code snippets if needed for clarity
- Related components or dependencies
- If answer is not found in code, state that clearly

**Key principle:** Evidence-based answers only.

**After Completion - Offer Next Steps (Optional):**

If the answer reveals complexity or unclear architecture, offer:

> "Based on this implementation, would documentation help?
>
> 1. **Create Diagrams** - Visualize this architecture or workflow (`/diagram`)
> 2. **Review Requirements** - Analyze if current implementation meets requirements (`/analyze-requirements`)
>
> Would either be helpful?"

**How to route:**

- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create [architecture/sequence] diagram for: [component/workflow discussed]")`
- If user chooses "Review Requirements" → `Skill(skill: "analyze-requirements", args: "Analyze requirements for: [component/feature discussed]")`
