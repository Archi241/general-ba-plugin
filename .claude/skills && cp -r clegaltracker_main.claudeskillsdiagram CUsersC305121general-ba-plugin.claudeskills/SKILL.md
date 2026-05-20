---
name: review-story
description: Review user stories for technical feasibility and functional completeness. Analyzes stories against codebase patterns and provides detailed feedback with improvement suggestions.
userInvocable: true
---

# Story Review Skill

**What to do:** Review the provided user story for technical feasibility, functional completeness, and overall quality.

**Usage:** `/review-story [paste user story]`

---

## ⚠️ BEFORE YOU START: Read BA Workflow Guidelines

**📖 MANDATORY: Read [BA_WORKFLOW_GUIDELINES.md](../../BA_WORKFLOW_GUIDELINES.md) FIRST**

This file contains critical review requirements that apply to ALL BA story reviews:
- ✅ **Figma Review** - MANDATORY for all UI stories (SOURCE OF TRUTH)
- ✅ **User Journey Cross-Reference** - Required for completeness validation
- ✅ **Role-Based Permissions** - Must be validated in acceptance criteria
- ✅ **Status Logic** - Must match documented business rules
- ✅ **Common Gaps Checklist** - Prevents missing requirements

**Critical:** Skipping Figma/User Journey review causes gaps and rework. Always cross-reference these first.

---

## 🔄 WORKFLOW: Read Context Files First (Legal Tracker Optimization)

**BEFORE reviewing the story, load Legal Tracker context:**

```
1. Read .claude/PROJECT_CONTEXT.md
   → Validate: Correct entities used (TMatter vs "Case", TAction vs "Task")
   → Validate: Correct personas referenced
   → Validate: Correct terminology
   → Validate: Business rules are properly handled

2. Read .claude/ARCHITECTURE.md
   → Validate: Tech stack is correct (TOF, not EF)
   → Validate: Constraints are followed (no foreign keys, TSer types, etc.)
   → Validate: Architecture patterns match (CQRS for microservices, MVC for monolith)
   → Validate: C# version constraints (7.3 for monolith, modern for microservices)

3. Determine story type and read appropriate context:
   - If story mentions "migrate" or "modernize" → Read .claude/MODERNISATION_CONTEXT.md
   - If story is for new functionality → Read .claude/NEW_FEATURE_CONTEXT.md

4. Review story against Legal Tracker patterns from context files
```

---

**Deliverables:**
- Technical feasibility assessment with codebase references
- Functional completeness analysis (acceptance criteria coverage, edge cases, testability)
- Quality assessment (clarity, domain terminology, template compliance)
- **Accessibility compliance validation (WCAG 2.1 AA)**
- Figma accessibility annotation check (if Figma MCP available)
- Subtask validation (ensure all 6 required subtasks are present)
- Prioritized recommendations (Critical → Nice-to-have)
- Revised story version for approval

**Required Subtasks Check:**

Verify the user story includes all 6 required subtasks:

1. ☐ Investigate
2. ☐ Development
3. ☐ Code Review 1
4. ☐ Code Review 2
5. ☐ Test Case Design
6. ☐ Testing

If missing, add them to the revised story version.

---

## 📋 Accessibility Review (Legal Tracker Standards)

**CRITICAL: For UI stories, validate accessibility compliance**

### Step 1: Check Figma Accessibility Annotations (if available)

**If Figma MCP is connected and user provided Figma link:**

1. Use Figma MCP to access the design file
2. Check for accessibility annotations:
   - ARIA labels and roles
   - Keyboard navigation specifications
   - Focus order requirements
   - Screen reader instructions
   - Color contrast ratios
   - Touch target sizes

3. **Validate story includes ACs for each Figma annotation**
   - If Figma specifies aria-label, ensure story has AC for it
   - If Figma shows keyboard flow, ensure story has keyboard navigation AC
   - Flag missing ACs in your review

### Step 2: Validate TR Accessibility Requirements

**Legal Tracker follows WCAG 2.1 Level AA**. For UI stories, verify presence of:

**Required Accessibility Acceptance Criteria:**

✅ **1. Keyboard Navigation AC**
- Must include: Tab/Shift+Tab navigation
- Must include: Focus indicators (min 2px outline)
- Must include: Logical tab order
- Must include: Enter/Space activation

✅ **2. Screen Reader Support AC**
- Must include: ARIA labels for interactive elements
- Must include: Form label associations
- Must include: Error/success message announcements
- Must include: Dynamic content announcements

✅ **3. Color Contrast AC** (WCAG 2.1 AA)
- Must include: 4.5:1 ratio for normal text
- Must include: 3:1 ratio for large text (18pt+/14pt+ bold)
- Must include: 3:1 ratio for UI components
- Must include: 3:1 ratio for focus indicators

✅ **4. Touch Targets AC** (for mobile/tablet features)
- Must include: Minimum 44x44 CSS pixels
- Must include: Adequate spacing (8px minimum)

✅ **5. Responsive & Zoom Support AC**
- Must include: 200% zoom support
- Must include: No horizontal scrolling
- Must include: Text reflow

**Validation Checklist:**

For each UI story, check:
- [ ] Has keyboard navigation AC?
- [ ] Has screen reader support AC?
- [ ] Has color contrast requirements?
- [ ] Has touch target specifications (if mobile)?
- [ ] Has zoom/responsive AC?
- [ ] Definition of Done includes Axe accessibility audit?
- [ ] Definition of Done includes keyboard testing?
- [ ] Definition of Done includes screen reader testing?

**If accessibility ACs are missing:**
- Flag as **CRITICAL** issue in your review
- Add missing ACs to revised story version
- Reference TR Accessibility SharePoint (when link available)
- Include example accessibility AC from Legal Tracker standards

**TR Accessibility SharePoint:**

**TODO: Add TR Accessibility SharePoint link here when provided**

---

**After Completion - Offer Next Steps:**

After reviewing story, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Create Work Items** - Push the reviewed story to Azure DevOps
> 2. **Create Diagrams** - Visualize the workflow with sequence or flowchart diagrams (`/diagram`)
> 3. **Build Prototype** - Create working prototype to validate the story (`/prototype`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Create Work Items" → Use Azure DevOps **CLI** (not MCP) to create PBI with tag `BA_CC_WF1.0` and all 6 subtasks
  - **CRITICAL**: Use `az boards work-item create --type "Product Backlog Item"` for PBI creation
  - **Why**: ADO MCP does not support PBI work item type
  - After PBI created, auto-create 6 subtasks: Investigate, Development, Code Review 1, Code Review 2, Test Case Design, Testing
  - **MANDATORY**: Follow ADO formatting rules below (NO grey backgrounds or highlighting)
- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create [sequence/flowchart] diagram for: [story workflow]")`
- If user chooses "Build Prototype" → `Skill(skill: "prototype", args: "Build prototype implementing: [story summary]")`

---

## CRITICAL: ADO Text Formatting Rules (NO BACKGROUNDS)

**When creating or updating work items in Azure DevOps:**

**MANDATORY: Use plain black text on white background with NO grey backgrounds or highlighting.**

### ✅ ALLOWED Formatting (Plain Text Only)
- **Bold:** **text** or <strong>text</strong>
- **Italic:** *text* or <em>text</em>
- **Bullet lists:** - item or <ul><li>item</li></ul>
- **Numbered lists:** 1. item or <ol><li>item</li></ol>
- **Headings:** ## Heading or <h2>Heading</h2>
- **Line breaks:** <br/> or double newline

### ❌ NEVER USE (Creates Grey/Colored Backgrounds)
- Code blocks: ``` or <pre>
- Inline code: `text` or <code>
- Highlighting: <mark>, <kbd>, <span style="background">
- Any markdown/HTML that renders with grey or colored backgrounds

### How to Format Technical Content
- **API endpoints:** **Endpoint:** POST /api/auth/login (NOT `POST /api/auth/login`)
- **Code examples:** Use plain text with indentation, NO code fences
- **File paths:** Plain text only (NOT `src/app/file.ts`)
- **Commands:** **Command:** az boards work-item create (NOT `az boards work-item create`)
- **Gherkin AC:** Use numbered lists with bold labels (**Given**, **When**, **Then**), NO code blocks

**WHY:** Grey backgrounds and highlighting are NOT best practice in ADO. Use plain text formatting only.
