# BA Skills Architecture

## Overview

The BA skills follow a **router → specialist** pattern where `/ba` acts as a smart orchestrator that delegates to specialized skills.

```
┌─────────────────────────────────────────────────────────────┐
│                          /ba                                 │
│                    (Smart Router)                           │
│                                                             │
│  • Analyzes scope (Feature vs Story vs Other)               │
│  • Detects keywords                                         │
│  • Routes to specialist                                     │
│  • Does NOT implement workflows                             │
└─────────────────────────────────────────────────────────────┘
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
        ▼                    ▼                    ▼
┌──────────────┐    ┌──────────────┐    ┌──────────────────┐
│   /slice     │    │   /story     │    │ Other BA Skills  │
│  (Feature    │    │  (Single     │    │                  │
│  Breakdown)  │    │   Story)     │    │ • analyze-*      │
│              │    │              │    │ • review-*       │
│ • Vertical   │    │ • Reads      │    │ • diagram        │
│   slicing    │    │   context    │    │ • api-docs       │
│ • Reads      │    │ • Generates  │    │ • prototype      │
│   context    │    │   PBI with   │    │                  │
│ • Presents   │    │   ACs        │    │                  │
│   story list │    │ • Offers     │    │                  │
│ • Invokes    │    │   next steps │    │                  │
│   /story for │    │              │    │                  │
│   each       │    │              │    │                  │
└──────────────┘    └──────────────┘    └──────────────────┘
```

---

## Skill Responsibilities

### `/ba` - Smart Router
**Purpose:** Analyze scope and route to specialist skills

**Responsibilities:**
- Detect if request is Feature, Story, or Other BA task
- Use keyword detection for fast routing
- Delegate to appropriate specialist
- Show interactive menu when called with no args

**Does NOT:**
- ❌ Implement feature breakdown (that's `/slice`)
- ❌ Generate stories (that's `/story`)
- ❌ Read project context files (specialists do this)
- ❌ Duplicate any specialist workflow

**Token usage:** ~300-500 tokens

---

### `/slice` - Feature Breakdown Specialist
**Purpose:** Break features into vertical user stories

**Responsibilities:**
1. Read project context files (PROJECT_CONTEXT.md, ARCHITECTURE.md, etc.)
2. Gather feature context from user (requirements, Figma, transcripts)
3. Analyze feature scope (personas, workflows, dependencies)
4. Slice vertically into stories (NOT horizontally by layer)
5. Present story list grouped by phase (MVP, Enhanced, Edge Cases)
6. Get user approval for which stories to generate
7. Invoke `/story` for each approved story

**Key principle:** Vertical slicing = E2E value per story
- ✅ Story 1: View list (UI + API + DB)
- ✅ Story 2: Create item (UI + API + DB)
- ❌ Story 1: All UI screens
- ❌ Story 2: All APIs

**Token usage:** ~2000-3000 tokens per invocation

---

### `/story` - Story Generation Specialist
**Purpose:** Generate detailed PBIs with acceptance criteria

**Responsibilities:**
1. Read project context files
2. Generate PBI with:
   - Title and description
   - Given-When-Then acceptance criteria
   - Accessibility requirements (WCAG 2.1 AA)
   - 6 standard subtasks (Investigate, Development, CR1, CR2, Test Design, Testing)
5. Offer next steps (review, diagram, ADO, prototype)

**Token usage:** ~1500-2500 tokens per story

---

## Workflow Examples

### Example 1: Feature Request

```
User: "/ba payment approval workflow"
  ↓
/ba analyzes:
  - Keywords: "workflow" → Feature indicator
  - Scope: Multiple workflows/personas → FEATURE
  ↓
/ba routes:
  Skill(skill: "slice", args: "payment approval workflow")
  ↓
/slice executes:
  1. Reads PROJECT_CONTEXT.md → Project entities/personas
  2. Reads ARCHITECTURE.md → Tech constraints
  3. Asks for feature context → User provides requirements
  4. Analyzes feature:
     - Personas: Finance Admin, Manager
     - Workflows: View, approve, reject, notify
  5. Slices vertically:
     Phase 1 (MVP):
       - View pending payments list (3 pts)
       - View payment details (3 pts)
       - Approve single payment (5 pts)
     Phase 2 (Enhanced):
       - Reject payment with reason (5 pts)
       - Bulk approve payments (8 pts)
     Phase 3 (Edge Cases):
       - Conditional approval rules (8 pts)
  6. Presents story list → User approves Phase 1
  7. Invokes /story 3 times:
     - /story "View pending payments list"
     - /story "View payment details"
     - /story "Approve single payment"
  ↓
Result: 3 complete PBIs with acceptance criteria, subtasks, and accessibility requirements
```

### Example 2: Story Request

```
User: "/ba add retry button to failed uploads"
  ↓
/ba analyzes:
  - Keywords: "add [small thing]" → Story indicator
  - Scope: Single action, ~3 points → STORY
  ↓
/ba routes:
  Skill(skill: "story", args: "add retry button to failed uploads")
  ↓
/story executes:
  1. Reads PROJECT_CONTEXT.md → Understands project context
  2. Reads ARCHITECTURE.md → Understands tech stack
  3. Generates PBI:
     - Title: "Add Retry Button to Failed File Uploads"
     - Given-When-Then acceptance criteria
     - Accessibility requirements
     - 6 standard subtasks
  6. Offers next steps
  ↓
Result: 1 complete PBI ready for development
```

### Example 3: Meeting Analysis

```
User: "/ba analyze this requirements meeting transcript: [paste]"
  ↓
/ba analyzes:
  - Keywords: "transcript", "meeting" → Meeting analysis
  - Not a feature or story request
  ↓
/ba routes:
  Skill(skill: "analyze-transcript", args: "[transcript]")
  ↓
/analyze-transcript executes:
  1. Extracts pain points
  2. Identifies feature requests
  3. Recommends user stories
  4. Generates action items
  ↓
Result: Structured insights with story recommendations
```

---

## Design Principles

### 1. Single Responsibility
Each skill has ONE clear purpose:
- `/ba` = Route
- `/slice` = Feature breakdown
- `/story` = Story generation

### 2. No Duplication
Each workflow implemented in ONE place:
- Feature slicing logic → ONLY in `/slice`
- Story generation logic → ONLY in `/story`
- Context file reading → In specialists, NOT in router

### 3. Composability
Skills can call each other:
- `/ba` → `/slice` → `/story`
- But NO circular dependencies

### 4. Fast Routing
`/ba` should be lightweight:
- Keyword detection < 1 second
- No heavy file reads
- Immediate delegation

### 5. Context Loading at the Right Level
- `/ba` doesn't need project context → Don't load it
- `/slice` needs context → Load in `/slice`
- `/story` needs context → Load in `/story`

---

## Anti-Patterns to Avoid

### ❌ Duplicate Logic
```
/ba implements feature slicing
/slice also implements feature slicing
→ Result: Two versions to maintain, drift, confusion
```

### ❌ Router Does Implementation
```
/ba reads PROJECT_CONTEXT.md
/ba analyzes feature scope
/ba slices stories
/ba generates PBIs
→ Result: /slice and /story become useless
```

### ❌ Specialists Call Router
```
/slice → /ba → /story
→ Result: Circular dependency, wasted routing overhead
```

### ❌ Premature Optimization
```
/ba pre-loads all context files "just in case"
→ Result: Wasted tokens, slower routing
```

---

## Maintenance Guidelines

### When to Update `/ba`:
- Adding new specialist skill to menu
- Updating keyword detection rules
- Changing routing logic
- **DO NOT** update feature breakdown workflow (that's in `/slice`)
- **DO NOT** update story generation logic (that's in `/story`)

### When to Update `/slice`:
- Changing vertical slicing strategy
- Updating feature analysis questions
- Modifying story list presentation
- Adding new slicing patterns
- **DO NOT** update story generation (that's in `/story`)

### When to Update `/story`:
- Changing acceptance criteria format
- Updating accessibility requirements
- Modifying subtask list
- Adding new story patterns
- **DO NOT** update feature breakdown (that's in `/slice`)

---

## Testing Strategy

### Test `/ba` Routing:
```javascript
// Feature detection
assert(/ba "invoice approval workflow" → routes to /slice)
assert(/ba "user can manage budgets" → routes to /slice)

// Story detection
assert(/ba "add retry button" → routes to /story)
assert(/ba "email validation rule" → routes to /story)

// Other BA tasks
assert(/ba "analyze this transcript" → routes to /analyze-transcript)
assert(/ba "review this story" → routes to /review-story)
```

### Test `/slice` Breakdown:
```javascript
// Vertical slicing
assert(feature → list of vertical stories)
assert(each story has UI + API + DB layers)
assert(no horizontal layers)

// Phase grouping
assert(Phase 1 = MVP stories)
assert(Phase 2 = Enhanced stories)
assert(Phase 3 = Edge cases)
```

### Test `/story` Generation:
```javascript
// Story format
assert(has Given-When-Then ACs)
assert(has 6 subtasks)
assert(has accessibility requirements)

// Context awareness
assert(uses Legal Tracker terminology)
assert(references correct TOF entities)
assert(follows tech constraints)
```

---

## Future Plugin Architecture

When these skills become plugins:

### Plugin: `@ba-ado/orchestrator`
- Contains: `/ba` skill
- Dependencies: None (routes to other plugins)
- Lightweight: <500 tokens

### Plugin: `@ba-ado/feature-slicer`
- Contains: `/slice` skill
- Dependencies: None
- Can be used standalone

### Plugin: `@ba-ado/story-generator`
- Contains: `/story` skill
- Dependencies: None
- Can be used standalone

### Plugin: `@ba-ado/suite` (meta-plugin)
- Contains: All BA plugins
- For users who want complete BA workflow

---

## Performance Metrics

### Target Performance:
- `/ba` routing: < 5 seconds
- `/slice` breakdown: < 30 seconds for 5-story feature
- `/story` generation: < 15 seconds per story
- Full workflow (feature → 5 stories): < 2 minutes

### Token Budget:
- `/ba` skill: ~300 tokens
- `/slice` skill: ~2000 tokens
- `/story` skill: ~1500 tokens
- Project context files: ~1500 tokens total
- Total for feature → stories: ~10,000 tokens

---

## Summary

**The architecture is simple:**

1. **User requests something** → `/ba` analyzes scope
2. **Feature?** → Route to `/slice` → `/slice` breaks down → invokes `/story` for each
3. **Story?** → Route to `/story` → `/story` generates PBI
4. **Other?** → Route to appropriate specialist

**Key insight:** `/ba` is a thin routing layer. All implementation happens in specialists.

This keeps the codebase:
- ✅ Maintainable (update in one place)
- ✅ Composable (skills call each other directly)
- ✅ Fast (no duplicate work)
- ✅ Clear (each skill has one job)
