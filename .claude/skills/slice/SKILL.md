---
name: slice
description: Break down features into vertical user stories with E2E value
user-invocable: true
---

# Feature Slicer Skill

**Direct feature-to-stories breakdown with vertical slicing.**

**Usage:**
- `/slice [feature description]`
- `/slice` - Interactive mode

---

## What This Does

Takes a feature and slices it into implementable user stories using vertical slicing (E2E value per story).

**Example:**
```
/slice payment approval workflow
  ↓
Analyzes feature scope
  ↓
Identifies personas & journeys
  ↓
Slices vertically (not horizontally)
  ↓
Presents story list for approval
  ↓
Generates detailed stories
```

---

## Workflow

### Step 1: Gather Context

**Ask for inputs:**
```
Use AskUserQuestion:

Question: "What context do you have for this feature?"
Header: "Feature Context"

Options:
1. "Requirements document/notes"
   → Ask for paste or file path
   
2. "Figma designs"
   → Ask for Figma link
   
3. "Meeting transcript/recording"
   → Suggest /analyze-transcript first
   
4. "Just high-level idea"
   → Work with what they provide
```

**Read project context:**
```bash
Read .claude/PROJECT_CONTEXT.md → Entities, personas, terminology
Read .claude/ARCHITECTURE.md → Tech constraints
```

**Read story templates (for reference):**
```bash
Read .claude/templates/user-story-backend-example.md → Backend story structure
Read .claude/templates/user-story-ui-example.md → UI story structure
```

This helps you understand what sections each story will need when generated.

---

### Step 2: Feature Analysis

**Understand the feature:**
- What problem does it solve?
- Which personas are affected?
- What are the key user journeys?
- What's the happy path?
- What are edge cases?
- Dependencies on other features?

**Present analysis for confirmation:**
```markdown
I understand this feature as:

**Problem:** [problem statement]
**Personas:** [affected users]
**Key Workflows:** 
  1. [workflow 1]
  2. [workflow 2]

**Is this correct before I slice?**
```

Wait for user confirmation before proceeding.

---

### Step 3: Vertical Slicing

**Critical: Slice VERTICALLY, not horizontally!**

❌ **DON'T slice by layer:**
- Story 1: All UI screens
- Story 2: All APIs
- Story 3: All database changes

✅ **DO slice by end-to-end value:**
- Story 1: View list (UI + API + DB)
- Story 2: View details (UI + API + DB)
- Story 3: Create new (UI + API + DB)
- Story 4: Edit existing (UI + API + DB)

**Each story must:**
- Deliver end-to-end value
- Be independently testable
- Be demoable to stakeholders
- Be ≤ 8 story points
- Include full stack (UI + API + DB where needed)

**Slicing strategies:**

1. **By user workflow step:**
   - Story 1: User can view existing items
   - Story 2: User can create new item
   - Story 3: User can edit item
   - Story 4: User can delete item

2. **By complexity (simple → complex):**
   - Story 1: Basic approval (one approver, no conditions)
   - Story 2: Multi-level approval (sequential approvers)
   - Story 3: Conditional approval (business rules)
   - Story 4: Parallel approval (multiple concurrent approvers)

3. **By persona:**
   - Story 1: Legal Ops can initiate request
   - Story 2: Attorney can review request
   - Story 3: Billing Admin can approve request

4. **By CRUD operations:**
   - Story 1: Read/view functionality
   - Story 2: Create functionality
   - Story 3: Update functionality
   - Story 4: Delete functionality

**Phase grouping:**

Group stories into logical phases:

**Phase 1 - Core Value (MVP):**
- Minimum stories needed for feature to be useful
- Happy path only
- No edge cases yet

**Phase 2 - Enhanced Value:**
- Additional workflows
- Improved UX
- Performance optimizations

**Phase 3 - Edge Cases & Polish:**
- Error scenarios
- Edge cases
- Accessibility improvements
- Advanced features

---

### Step 4: Story List Presentation

**Present the sliced stories:**

```markdown
I've broken [feature name] into N stories:

**Phase 1 - Core Value (MVP):**
1. **[Story 1 title]** - [value delivered]
   - Estimated: [story points] points
   - Personas: [affected personas]
   
2. **[Story 2 title]** - [value delivered]
   - Estimated: [story points] points
   - Personas: [affected personas]

**Phase 2 - Enhanced Value:**
3. **[Story 3 title]** - [value delivered]
   - Estimated: [story points] points
   - Personas: [affected personas]

**Phase 3 - Edge Cases:**
4. **[Story 4 title]** - [value delivered]
   - Estimated: [story points] points
   - Personas: [affected personas]

**Total: N stories, approximately X story points**

---

**Next steps - What would you like to do?**

Use AskUserQuestion:

Question: "How would you like to proceed?"
Header: "Story Generation"

Options:
1. "Generate all N stories" (Recommended for small features)
   → Invoke /story for each
   
2. "Generate Phase 1 only (MVP)"
   → Invoke /story for Phase 1 stories
   
3. "Adjust the breakdown first"
   → Ask for feedback, re-slice
   
4. "Show me one story as example"
   → Generate first story, wait for approval
```

---

### Step 5: Story Generation

**For each approved story:**

```markdown
Invoke /story skill with:
- Story title
- Story summary
- Estimated points
- Affected personas
- Feature context

Note: /story will automatically:
- Read story templates (backend or UI)
- Follow all 11 required sections
- Include accessibility criteria (for UI)
- Generate Gherkin acceptance criteria
- Add 6 required subtasks
```

**After all stories generated:**

```markdown
✅ Generated N stories for [feature name]

**Stories created:**
1. [Story 1 title]
2. [Story 2 title]
...

**Next steps:**
- Review stories: /review-story [story]
- Create diagrams: /diagram [feature] workflow
- Push to ADO: (requires /setup-ado first)
- Build prototype: /prototype [feature]

Which would be helpful?
```

---

## Slicing Best Practices

### Size Guidelines
- ✅ Each story ≤ 8 story points
- ✅ Phase 1 should be ~3-5 stories
- ✅ Total feature ~8-15 stories max
- ❌ Avoid 1-point micro-stories (combine them)
- ❌ Avoid 13+ point mega-stories (split them)

### Value Guidelines
- ✅ Each story must be independently testable
- ✅ Each story must be demoable
- ✅ Each story must have clear acceptance criteria
- ❌ Avoid "refactoring" or "cleanup" stories
- ❌ Avoid "technical debt" stories

### Dependency Guidelines
- ✅ Phase 1 stories should have minimal dependencies
- ✅ Later phases can depend on Phase 1
- ✅ Stories within a phase can be parallel
- ❌ Avoid circular dependencies
- ❌ Avoid cross-phase blocking dependencies

---

## Example: Payment Approval Feature

**Input:** "Payment approval workflow for expense management"

**Analysis:**
- **Problem:** Finance admins need to approve payments before processing
- **Personas:** Finance Admin, Employee, Manager
- **Workflows:** View payments, review details, approve/reject, track status

**Vertical Slicing:**

**Phase 1 - Core Value:**
1. **View pending payments list** (3 points)
   - List view with basic filters
   - Shows payment number, amount, status
   - UI + API + DB

2. **View payment details** (3 points)
   - Detail page with line items
   - Shows all payment information
   - UI + API + DB

3. **Approve single payment** (5 points)
   - Approve button with confirmation
   - Updates status to "Approved"
   - Sends notification
   - UI + API + DB + Email

**Phase 2 - Enhanced Value:**
4. **Reject payment with reason** (5 points)
   - Reject button with reason field
   - Updates status to "Rejected"
   - Sends notification with reason
   - UI + API + DB + Email

5. **Bulk approve payments** (8 points)
   - Multi-select in list view
   - Approve multiple at once
   - Validation rules
   - UI + API + DB + Email

**Phase 3 - Edge Cases:**
6. **Conditional approval rules** (8 points)
   - Auto-approve below threshold
   - Require multiple approvers above threshold
   - Business rule engine
   - UI + API + DB + Rules

**Total: 6 stories, ~32 story points**

---

## Integration Points

**Can be invoked from:**
- `/ba` orchestrator → "Break down a feature"
- Direct invocation → `/slice [feature]`
- After requirements analysis → `/analyze-requirements` suggests slicing

**Can invoke:**
- `/story` - Generate detailed stories
- `/diagram` - Create workflow diagrams
- `/review-story` - Review generated stories

---

## Performance Optimizations

**Context pre-loading:**
- Hook: `onSkillInvoke.slice` → Pre-load PROJECT_CONTEXT.md
- Saves 2-3 seconds per invocation

**Progress indicators:**
```javascript
console.log("🔍 Step 1/4: Loading project context...");
console.log("🔍 Step 2/4: Analyzing feature scope...");
console.log("🔍 Step 3/4: Slicing into vertical stories...");
console.log("🔍 Step 4/4: Estimating story points...");
console.log("✅ Slicing complete! (took 25 seconds)");
```

---

**User's request:**
{{USER_INPUT}}
