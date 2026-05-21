---
name: ba
description: Smart BA orchestrator that analyzes scope and routes to specialized skills. Feature-first approach - analyzes then delegates to /slice or /story.
user-invocable: true
---

# BA Orchestrator Skill

**Smart router for Business Analysis workflows.**

**Core principle:** Analyze scope → Route to specialist → Don't duplicate their work

**Usage:**
- `/ba` - Interactive capabilities menu
- `/ba [request]` - Analyze scope and route automatically

---

## What `/ba` Does

`/ba` is a **ROUTER**, not an implementer:

1. **Analyzes scope** - Feature vs Story vs Other BA task
2. **Routes to specialist** - Delegates to `/slice`, `/story`, or other skills
3. **Gets out of the way** - Lets specialists do their job

**`/ba` does NOT:**
- ❌ Implement feature slicing (that's `/slice`)
- ❌ Generate stories (that's `/story`)
- ❌ Analyze requirements (that's `/analyze-requirements`)
- ❌ Create diagrams (that's `/diagram`)

---

## Scope Detection Logic

**When user provides a request, determine:**

### FEATURE (most common)
**Indicators:**
- Multiple workflows or personas
- End-to-end capability
- Words: "system", "workflow", "feature", "functionality"
- Would take >8 story points
- Examples: "payment approval workflow", "user onboarding system"

**Action:** Route to `/slice`

### STORY (less common)
**Indicators:**
- Single specific action
- Already scoped
- Would take ≤8 story points
- Examples: "add retry button", "email validation rule"

**Action:** Route to `/story`

### OTHER BA TASK
**Indicators:**
- Meeting analysis, requirements check, story review, etc.

**Action:** Route to appropriate specialist skill

---

## Routing Implementation

### If FEATURE:

```markdown
"This looks like a feature that needs breakdown. Let me analyze and slice it into user stories."

Skill(skill: "slice", args: "[user's original request]")
```

**What happens next:**
1. `/slice` reads project context files
2. `/slice` analyzes feature scope
3. `/slice` slices into vertical stories
4. `/slice` presents story list for approval
5. `/slice` invokes `/story` for each approved story

**DO NOT duplicate any of this in `/ba`!**

### If STORY:

```markdown
"This looks like a single user story. Let me generate it for you."

Skill(skill: "story", args: "[user's original request]")
```

**What happens next:**
1. `/story` reads project context files
2. `/story` generates PBI with acceptance criteria
3. `/story` offers next steps (review, diagram, ADO)

**DO NOT duplicate any of this in `/ba`!**

### If OTHER BA TASK:

Use keyword detection to route:

| Keywords | Route to | Purpose |
|----------|----------|---------|
| "meeting", "transcript", "interview" | `/analyze-transcript` | Extract insights from meetings |
| "requirements", "quality", "gaps" | `/analyze-requirements` | Check requirements quality |
| "review story", "validate" | `/review-story` | Review existing story |
| "diagram", "visualize", "flow" | `/diagram` | Create workflow diagrams |
| "document API", "OpenAPI" | `/api-docs` | Generate API documentation |
| "prototype", "POC", "demo" | `/prototype` | Build working prototype |
| "UX", "UI design", "mockup", "accessibility" | `/ux-assessment` | Evaluate UI/UX design quality |
| "codebase", "implementation", "how does" | `/code-qa` | Answer questions about code |

---

## Interactive Menu Mode

When user types `/ba` with no args:

```
Use AskUserQuestion:

Question: "What BA task would you like help with?"
Header: "BA Workflow"

Options:

1. "Break down a feature into stories" ⭐ RECOMMENDED
   Description: "Analyze feature and slice into vertical, implementable user stories"
   → Skill(skill: "slice")
   
2. "Create a single user story"
   Description: "Generate one story with Gherkin acceptance criteria"
   → Skill(skill: "story")
   
3. "Analyze meeting transcript"
   Description: "Extract requirements, pain points, and feature requests"
   → Skill(skill: "analyze-transcript")
   
4. "Check requirements quality"
   Description: "Evaluate for completeness, testability, and conflicts"
   → Skill(skill: "analyze-requirements")
   
5. "Review existing story"
   Description: "Validate technical feasibility and completeness"
   → Skill(skill: "review-story")
   
6. "Create workflow diagram"
   Description: "Generate sequence, flowchart, ER, or architecture diagrams"
   → Skill(skill: "diagram")
   
7. "Document API endpoints"
   Description: "Generate OpenAPI specs and endpoint documentation"
   → Skill(skill: "api-docs")
   
8. "Build working prototype"
   Description: "Create runnable lo-fi HTML POC with tests"
   → Skill(skill: "prototype")
   
9. "Evaluate UI/UX design"
   Description: "Assess mockups for usability, accessibility, and design system compliance"
   → Skill(skill: "ux-assessment")
   
10. "Answer codebase questions"
    Description: "Get factual answers about implementation, architecture, and patterns"
    → Skill(skill: "code-qa")
```

---

## Routing Examples

### Example 1: Feature Request
```
User: "I need invoice approval workflow for Legal Tracker"

/ba analysis:
✓ Multiple workflows (view, approve, reject, notify)
✓ Multiple personas (Billing Admin, Attorney)
✓ End-to-end capability
→ Scope: FEATURE

/ba action:
Skill(skill: "slice", args: "Invoice approval workflow for Legal Tracker")

Result:
→ /slice breaks into 6 vertical stories
→ /slice invokes /story for each approved story
→ User gets complete set of PBIs
```

### Example 2: Story Request
```
User: "Add retry button to failed invoice uploads"

/ba analysis:
✓ Single action (add button)
✓ Clear scope (retry failed uploads)
✓ ~3 story points
→ Scope: STORY

/ba action:
Skill(skill: "story", args: "Add retry button to failed invoice uploads")

Result:
→ /story generates single PBI with acceptance criteria
→ /story offers next steps
```

### Example 3: Meeting Analysis
```
User: "Analyze this meeting transcript for requirements"

/ba analysis:
✓ Keywords: "transcript", "requirements"
→ Task: Meeting analysis

/ba action:
Skill(skill: "analyze-transcript", args: "[transcript content]")

Result:
→ /analyze-transcript extracts insights
→ /analyze-transcript recommends feature requests
→ /analyze-transcript suggests next steps
```

---

## Decision Tree

```
User input received
  ↓
Detect keywords
  ↓
┌─────────────────────────────────────┐
│ Is it a feature breakdown request?  │
│ ("feature", "workflow", "system")   │
└─────────────────────────────────────┘
  │ YES                    │ NO
  ↓                        ↓
Route to /slice      ┌─────────────────────────────────────┐
                     │ Is it a single story request?       │
                     │ ("add", "create story", small scope)│
                     └─────────────────────────────────────┘
                       │ YES                  │ NO
                       ↓                      ↓
                     Route to /story    ┌─────────────────────────────────────┐
                                        │ What other BA task?                 │
                                        │ (transcript, requirements, review)  │
                                        └─────────────────────────────────────┘
                                          │
                                          ↓
                                        Route to specialist skill
```

---

## Keyword Detection

**Feature breakdown keywords:**
```
"break down", "slice", "feature", "epic", "workflow"
"multiple stories", "large scope", "end-to-end"
"system", "functionality", "capability"
```

**Story creation keywords:**
```
"create story", "generate PBI", "user story for"
"add [small thing]", "build [small feature]"
"implement [single action]"
```

**Meeting analysis keywords:**
```
"meeting notes", "transcript", "interview"
"call recording", "extract from meeting"
```

**Requirements keywords:**
```
"analyze requirements", "check requirements"
"requirements quality", "gaps", "completeness"
```

**Review keywords:**
```
"review story", "check PBI", "validate story"
"is this story good", "story quality"
```

**Diagram keywords:**
```
"diagram", "visualize", "show flow"
"sequence", "architecture", "data model"
```

**API docs keywords:**
```
"document API", "OpenAPI", "API spec"
"endpoint docs", "REST API docs"
```

**Prototype keywords:**
```
"build prototype", "POC", "demo"
"working example", "proof of concept"
```

---

## Why This Architecture?

### ✅ Benefits of Pure Router:

1. **No duplication** - Each workflow lives in ONE place
2. **Clear ownership** - `/slice` owns feature breakdown, `/story` owns story generation
3. **Easy maintenance** - Update logic in ONE skill, not multiple
4. **Fast routing** - `/ba` is <500 tokens, delegates heavy work
5. **Composable** - Skills can call each other without circular dependencies

### ❌ Problems with Duplicate Logic:

1. **Two versions of feature breakdown** - `/ba` and `/slice` both implement it
2. **Drift** - Updates to `/slice` don't propagate to `/ba`
3. **Confusion** - Which skill should user call directly?
4. **Token waste** - Loading duplicate instructions into context
5. **Maintenance burden** - Must update logic in two places

---

## Performance

**Fast routing:**
- Keyword detection: <1 second
- Scope analysis: <2 seconds
- Delegation: Immediate

**No context loading:**
- `/ba` doesn't need PROJECT_CONTEXT.md
- Specialist skills load their own context
- Saves 2-3 seconds per invocation

**Minimal token usage:**
- `/ba` skill: ~300 tokens
- Routing decision: ~100 tokens
- Total: <500 tokens per invocation

---

## Integration Points

**User invokes:**
- `/ba` → Shows menu
- `/ba [request]` → Analyzes and routes

**`/ba` invokes:**
- `/slice` - For feature breakdown
- `/story` - For single story generation
- `/analyze-transcript` - For meeting analysis
- `/analyze-requirements` - For requirements check
- `/review-story` - For story review
- `/diagram` - For diagram creation
- `/api-docs` - For API documentation
- `/prototype` - For prototype generation

**`/ba` never invoked by:**
- Other skills should call specialists directly
- No circular dependencies

---

## Success Criteria

**Good routing:**
- ✅ Correctly identifies scope (feature vs story vs other)
- ✅ Routes to appropriate specialist
- ✅ Preserves user's original request
- ✅ Takes <5 seconds to route
- ✅ Never duplicates specialist's work

**Bad routing:**
- ❌ Treats feature as story (missed breakdown opportunity)
- ❌ Treats story as feature (unnecessary overhead)
- ❌ Implements feature slicing logic (duplicates `/slice`)
- ❌ Generates stories directly (duplicates `/story`)
- ❌ Gets stuck in analysis paralysis

---

**User's request:**
{{USER_INPUT}}
